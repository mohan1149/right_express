<?php

namespace App\Http\Controllers;

use App\Business;
use App\Contact;
use App\CustomerGroup;
use App\Transaction;
use App\TransactionPayment;
use App\User;
use App\Utils\ContactUtil;
use App\Utils\ModuleUtil;
use App\Utils\ProductUtil;
use App\Utils\TransactionUtil;
use App\Utils\BusinessUtil;
use App\Utils\Util;
use DB;
use Excel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\TaxRate;

class OutsideOrderController extends Controller
{
    protected $commonUtil;
    protected $transactionUtil;
    protected $moduleUtil;
    protected $contactUtil;
    protected $businessUtil;
    protected $productUtil;

    /**
     * Constructor
     *
     * @param Util $commonUtil
     * @return void
     */
    public function __construct(
        Util $commonUtil,
        ModuleUtil $moduleUtil,
        ContactUtil $contactUtil,
        BusinessUtil $businessUtil,
        TransactionUtil $transactionUtil,
        ProductUtil $productUtil
    ) {
        $this->commonUtil = $commonUtil;
        $this->moduleUtil = $moduleUtil;
        $this->transactionUtil = $transactionUtil;
        $this->contactUtil = $contactUtil;
        $this->businessUtil = $businessUtil;
        $this->productUtil = $productUtil;
        $this->dummyPaymentLine = ['method' => '', 'amount' => 0, 'note' => '', 'card_transaction_number' => '', 'card_number' => '', 'card_type' => '', 'card_holder_name' => '', 'card_month' => '', 'card_year' => '', 'card_security' => '', 'cheque_number' => '', 'bank_account_number' => '',
        'is_return' => 0, 'transaction_no' => ''];

        $this->shipping_status_colors = [
            'ordered' => 'bg-yellow',
            'packed' => 'bg-info',
            'shipped' => 'bg-navy',
            'delivered' => 'bg-green',
            'cancelled' => 'bg-red',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
            $sd = $request['start_date'];
            $ed = $request['end_date'];
            if (!auth()->user()->can('customer.view')) {
                abort(403, 'Unauthorized action.');
            }
            if($sd == '' || $ed == ''){
                $sd = date('YY-M-D');
                $ed = date('YY-M-D');
            }
            $business_id = request()->session()->get('user.business_id');
            $outside_orders = DB::table('tbl_outside_orders')
                ->join('tbl_outside_customers','tbl_outside_customers.id','=','tbl_outside_orders.customer_id')
                ->leftJoin('tbl_drivers','tbl_drivers.id','=','tbl_outside_orders.driver_id')
                ->join('transactions','transactions.id','=','tbl_outside_orders.transaction_id')
                ->where('tbl_outside_orders.business_id',$business_id)
                ->whereDate('tbl_outside_orders.order_date', '>=', $sd)
                ->whereDate('tbl_outside_orders.order_date', '<=', $ed)
                //->whereBetween('tbl_outside_orders.order_date', [$request['start_date'], $request['end_date']])
                ->select(
                    'tbl_outside_orders.id',
                    'tbl_outside_orders.order_status',
                    'tbl_outside_orders.payment_type',
                    'tbl_outside_orders.order_date',
                    'tbl_outside_customers.customer_name',
                    'transactions.invoice_no',
                    'transactions.id as tid',
                    'transactions.final_total',
                    'tbl_drivers.driver_name',
                )
                ->get();
                if (request()->ajax()) {
                    return Datatables::of($outside_orders)
                    ->addColumn(
                        'order_status',
                        '<span 
                            class="btn btn-block btn-modal order_satus_{{$order_status}}"
                            data-container=".update_order_status_modal"
                            data-href="{{action("OutsideOrderController@getOrderUpdateView",["oid"=>$id])}}" 
                        >
                            {{ $order_status == 0 ? __("lang_v1.waiting") : "" }}
                            {{ $order_status == 1 ? __("lang_v1.accepted") : "" }}
                            {{ $order_status == 2 ? __("lang_v1.completed") : "" }}
                            {{ $order_status == 3 ? __("lang_v1.refused") : "" }}
                        </span>'
                    )
                    ->editColumn(
                        'final_total',
                        '<span class="display_currency final_total" data-currency_symbol="true" data-orig-value="{{$final_total}}">{{$final_total}}</span>'
                    )
                    ->editColumn(
                        'payment_type',
                        '<span>{{ $payment_type == "other" ? "KNET" :  $payment_type }}</span>'
                    )
                    ->addColumn(
                        'actions',
                        '<div class="btn-group">
                            <button type="button" class="btn btn-info dropdown-toggle btn-xs" 
                                data-toggle="dropdown" aria-expanded="false">' .
                                __("messages.actions") .
                                '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                                </span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                @can("sell.view")
                                        <li><a class="btn-modal" data-href="{{action("OutsideOrderController@show",[$tid])}}" data-container=".view_outside_order_modal"><i class="glyphicon glyphicon-file"></i> @lang("messages.view")</a></li>
                                    @endcan
                                @can("sell.update")
                                    <li><a href="{{action(\'SellPosController@edit\', [$tid])}}" ><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a></li>
                                @endcan
                                @can("customer.delete")
                                    <li><a href="{{action(\'OutsideOrderController@destroy\', [$id])}}" class="delete_outside_order_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</a></li>
                                @endcan
                            </ul>
                        </div>'
                    )
                    ->rawColumns(['order_status', 'final_total', 'actions','payment_type'])
                    ->make(true);
                }
            return view('outside_orders.index');
        }catch(\Exception $e){
            return $e->getMessage();
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $business_id = $request->session()->get('user.business_id');
        $drivers = DB::table('tbl_drivers')
            ->where('business_id',$business_id)
            ->get();
        $outside_customers = DB::table('tbl_outside_customers')
            ->where('business_id',$business_id)
            ->get();
        return view('outside_orders.create')
            ->with(compact('drivers','outside_customers'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        try{
            $business_id = $request->session()->get('user.business_id');
            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }
            $trans_id = $request['trans_id'];
            $update = DB::table('transaction_payments')
                ->where('transaction_id',$trans_id)
                ->update([
                    'method' => $request['payment_method'],
                ]);
            $update1 = DB::table('transactions')
                ->where('id',$trans_id)
                ->update([
                    'trasaction_type' => 'outside'
                ]);
            $driver_id = $request['driver_id'];
            $outside_customer_id = $request['outside_customer_id'];
            $insert = DB::table('tbl_outside_orders')
                ->insert([
                    'driver_id' => $driver_id,
                    'customer_id' => $outside_customer_id,
                    'order_status' => 0,
                    'transaction_id' => $trans_id,
                    'business_id' => $business_id,
                    'payment_type' => $request['payment_method'],

                ]);
            $output = [
                'success' => true,
                'msg' =>__("sale.pos_sale_added")
            ];
            return $output;
        }catch(\Exception $e){
            return [
                'success' => false,
                'msg' =>__("messages.something_went_wrong")
            ];
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id,Request $request)
    {
        //
        $iskitchen = $request->get('iskitchen');


        if (!auth()->user()->can('sell.view') && !auth()->user()->can('direct_sell.access') && !auth()->user()->can('view_own_sell_only')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');
        $taxes = TaxRate::where('business_id', $business_id)
                            ->pluck('name', 'id');
        $query = Transaction::where('business_id', $business_id)
                    ->where('id', $id)
                    ->with(['contact', 'sell_lines' => function ($q) {
                        $q->whereNull('parent_sell_line_id');
                    },'sell_lines.product', 'sell_lines.product.unit', 'sell_lines.variations', 'sell_lines.variations.product_variation', 'payment_lines', 'sell_lines.modifiers', 'sell_lines.lot_details', 'tax', 'sell_lines.sub_unit', 'table', 'service_staff', 'sell_lines.service_staff', 'types_of_service', 'sell_lines.warranties']);

        if (!auth()->user()->can('sell.view') && !auth()->user()->can('direct_sell.access') && auth()->user()->can('view_own_sell_only')) {
            $query->where('transactions.created_by', request()->session()->get('user.id'));
        }

        $sell = $query->firstOrFail();

        foreach ($sell->sell_lines as $key => $value) {
            if (!empty($value->sub_unit_id)) {
                $formated_sell_line = $this->transactionUtil->recalculateSellLineTotals($business_id, $value);
                $sell->sell_lines[$key] = $formated_sell_line;
            }
        }

        $payment_types = $this->transactionUtil->payment_types();

        $order_taxes = [];
        if (!empty($sell->tax)) {
            if ($sell->tax->is_tax_group) {
                $order_taxes = $this->transactionUtil->sumGroupTaxDetails($this->transactionUtil->groupTaxDetails($sell->tax, $sell->tax_amount));
            } else {
                $order_taxes[$sell->tax->name] = $sell->tax_amount;
            }
        }

        $business_details = $this->businessUtil->getDetails($business_id);
        $pos_settings = empty($business_details->pos_settings) ? $this->businessUtil->defaultPosSettings() : json_decode($business_details->pos_settings, true);
        $shipping_statuses = $this->transactionUtil->shipping_statuses();
        $shipping_status_colors = $this->shipping_status_colors;
        $common_settings = session()->get('business.common_settings');
        $is_warranty_enabled = !empty($common_settings['enable_product_warranty']) ? true : false;

		$cooking_status= array_map('intval', explode(',', $sell->OEX_KITCHEN_STATUS ));
        return view('outside_orders.show')
            ->with(compact(
                'taxes',
                'sell',
                'payment_types',
                'order_taxes',
                'pos_settings',
                'shipping_statuses',
                'shipping_status_colors',
                'is_warranty_enabled',
				'iskitchen',
				'cooking_status'
            ));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $delete = DB::table('tbl_outside_orders')
                ->where('id',$id)
                ->delete();
            return[
                    'success' => true,
                    'msg' =>__("lang_v1.order_deleted"),
                ];
        }catch(\Exception $e){
            return [
                'success' => false,
                'msg' => $e->getMessage(),
            ];
        }
    }

    public function getOrderUpdateView(Request $request){
        $oid = $request['oid'];
        return view('outside_orders.update_order_status')->with(compact('oid'));
    }

    public function updateOrderStatus(Request $request){
        try{
            $order_status = $request['order_status'];
            $outside_order_id = $request['outside_order_id'];
            $update = DB::table('tbl_outside_orders')
                ->where('id',$outside_order_id)
                ->update([
                    'order_status' => $order_status
                ]);
            return[
                'success' => true,
                'msg' =>__("lang_v1.order_status_updated"),
            ];
        }catch(\Exception $e){
            return [
                'success' => false,
                'msg' => $e->getMessage(),
            ];
        }
    }

    public function printInvoice($id,Request $request ){

        //cash_register_transactions
        //transactions -- opening_stock_product_id
        //outside-customers
        //address
        $transction = DB::table('transactions')
            ->join('transaction_sell_lines','transaction_sell_lines.transaction_id','=','transactions.id')
            ->join('products','products.id','=','transaction_sell_lines.product_id')
            ->where('transactions.id',$id)
            ->get();
        $customer_data = DB::table('tbl_outside_orders')
            ->join('tbl_outside_customers','tbl_outside_customers.id','=','tbl_outside_orders.customer_id')
            ->join('PROVINCE','PROVINCE.PROVINCE_ID','=','tbl_outside_customers.governorate')
            ->join('AREAS','AREAS.AREA_ID','=','tbl_outside_customers.area')
            ->where('tbl_outside_orders.transaction_id',$id)
            ->first();
            $data = [
                'transaction' => $transction,
                'customer_data' => $customer_data,
            ];
        $output = [
            'is_enabled' => true,
            'print_type' => 'browser',
            'html_content' => null,
            'printer_config' => [],
            'data' => []
        ];
        $output['html_content'] = view('outside_orders.invoice', compact('data'))->render();

        return $output;
    }
}
