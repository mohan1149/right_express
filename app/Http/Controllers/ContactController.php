<?php

namespace App\Http\Controllers;

use App\Business;
use App\Contact;
use App\CustomerGroup;
use App\Transaction;
use App\TransactionPayment;
use App\User;
use App\Utils\ModuleUtil;
use App\Utils\TransactionUtil;
use App\Utils\Util;
use DB;
use Excel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class ContactController extends Controller
{
    protected $commonUtil;
    protected $transactionUtil;
    protected $moduleUtil;

    /**
     * Constructor
     *
     * @param Util $commonUtil
     * @return void
     */
    public function __construct(
        Util $commonUtil,
        ModuleUtil $moduleUtil,
        TransactionUtil $transactionUtil
    ) {
        $this->commonUtil = $commonUtil;
        $this->moduleUtil = $moduleUtil;
        $this->transactionUtil = $transactionUtil;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $type = request()->get('type');

        $types = ['supplier', 'customer','regular'];

        if (empty($type) || !in_array($type, $types)) {
            return redirect()->back();
        }

        if (request()->ajax()) {
            if ($type == 'supplier') {
                return $this->indexSupplier();
            } elseif ($type == 'customer') {
                return $this->indexCustomer($request);
            } elseif($type == 'regular'){
                return $this->indexRegularCustomers($request);
            } else {
                die("Not Found");
            }
        }

        $reward_enabled = (request()->session()->get('business.enable_rp') == 1 && in_array($type, ['customer'])) ? true : false;
        if($type == 'regular'){
            return view('contact.regular');
        }
        return view('contact.index')
            ->with(compact('type', 'reward_enabled'));
    }


    private function indexRegularCustomers(Request $request){
        try{
            if (!auth()->user()->can('customer.view')) {
                abort(403, 'Unauthorized action.');
            }
            $business_id = request()->session()->get('user.business_id');
            $query = Contact::where('contacts.business_id', $business_id)
                        ->where('customer_group_id',1)
                        ->where('type','customer')
                        ->select(
                            [
                                'contact_id', 
                                'name', 
                                'mobile', 
                                'id', 
                            ])
                        ->get();
            return Datatables::of($query)
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
                    @can("customer.view")
                        <li><a href="{{action(\'ContactController@show\', [$id])}}"><i class="fa fa-external-link" aria-hidden="true"></i> @lang("messages.view")</a></li>
                    @endcan
                    @can("customer.update")
                        <li><a href="{{action(\'ContactController@edit\', [$id])}}" class="edit_contact_button"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a></li>
                    @endcan
                    @can("customer.delete")
                        <li><a href="{{action(\'ContactController@destroy\', [$id])}}" class="delete_contact_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</a></li>
                    @endcan
                    </ul></div>'
                )->rawColumns(['actions'])
                ->make(true);
            
        }catch(\Exception $e){
            return $e->getMessage();
        }
        
    }

    /**
     * Returns the database object for supplier
     *
     * @return \Illuminate\Http\Response
     */
    private function indexSupplier()
    {
        if (!auth()->user()->can('supplier.view')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');
        $contact = Contact::leftjoin('transactions AS t', 'contacts.id', '=', 't.contact_id')
                    ->where('contacts.business_id', $business_id)
                    ->onlySuppliers()
                    ->select(['contacts.contact_id', 'supplier_business_name', 'name', 'contacts.created_at', 'mobile',
                        'contacts.type', 'contacts.id',
                        DB::raw("SUM(IF(t.type = 'purchase', final_total, 0)) as total_purchase"),
                        DB::raw("SUM(IF(t.type = 'purchase', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as purchase_paid"),
                        DB::raw("SUM(IF(t.type = 'purchase_return', final_total, 0)) as total_purchase_return"),
                        DB::raw("SUM(IF(t.type = 'purchase_return', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as purchase_return_paid"),
                        DB::raw("SUM(IF(t.type = 'opening_balance', final_total, 0)) as opening_balance"),
                        DB::raw("SUM(IF(t.type = 'opening_balance', (SELECT SUM(IF(is_return = 1,-1*amount,amount)) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as opening_balance_paid")
                        ])
                    ->groupBy('contacts.id');
        return Datatables::of($contact)
            ->addColumn(
                'due',
                '<span class="display_currency contact_due" data-orig-value="{{$total_purchase - $purchase_paid}}" data-currency_symbol=true data-highlight=false>{{$total_purchase - $purchase_paid }}</span>'
            )
            ->addColumn(
                'return_due',
                '<span class="display_currency return_due" data-orig-value="{{$total_purchase_return - $purchase_return_paid}}" data-currency_symbol=true data-highlight=false>{{$total_purchase_return - $purchase_return_paid }}</span>'
            )
            ->addColumn(
                'action',
                '<div class="btn-group">
                    <button type="button" class="btn btn-info dropdown-toggle btn-xs" 
                        data-toggle="dropdown" aria-expanded="false">' .
                        __("messages.actions") .
                        '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                        </span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                @if(($total_purchase + $opening_balance - $purchase_paid - $opening_balance_paid)  > 0)
                    <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=purchase" class="pay_purchase_due"><i class="fa fa-money" aria-hidden="true"></i>@lang("contact.pay_due_amount")</a></li>
                @endif
                @if(($total_purchase_return - $purchase_return_paid)  > 0)
                    <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=purchase_return" class="pay_purchase_due"><i class="fa fa-money" aria-hidden="true"></i>@lang("lang_v1.receive_purchase_return_due")</a></li>
                @endif
                @can("supplier.view")
                    <li><a href="{{action(\'ContactController@show\', [$id])}}"><i class="fa fa-external-link" aria-hidden="true"></i> @lang("messages.view")</a></li>
                @endcan
                @can("supplier.update")
                    <li><a href="{{action(\'ContactController@edit\', [$id])}}" class="edit_contact_button"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a></li>
                @endcan
                @can("supplier.delete")
                    <li><a href="{{action(\'ContactController@destroy\', [$id])}}" class="delete_contact_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</a></li>
                @endcan </ul></div>'
            )
            ->editColumn('created_at', '{{@format_date($created_at)}}')
            ->removeColumn('opening_balance')
            ->removeColumn('opening_balance_paid')
            ->removeColumn('type')
            ->removeColumn('id')
            ->removeColumn('total_purchase')
            ->removeColumn('purchase_paid')
            ->removeColumn('total_purchase_return')
            ->removeColumn('purchase_return_paid')
            ->rawColumns(['due', 'return_due', 'action'])
            ->make(true);
    }

    /**
     * Returns the database object for customer
     *
     * @return \Illuminate\Http\Response
     */
    private function indexCustomer(Request $request)
    {
        try{
            if (!auth()->user()->can('customer.view')) {
                abort(403, 'Unauthorized action.');
            }
    
            $business_id = request()->session()->get('user.business_id');
    
            $query = Contact::leftjoin('transactions AS t', 'contacts.id', '=', 't.contact_id')
                        ->leftjoin('customer_groups AS cg', 'contacts.customer_group_id', '=', 'cg.id')
                        ->where('contacts.business_id', $business_id)
                        // ->where('contacts.customer_group_id','!=',1)
                        ->whereDate('contacts.created_at', '>=', $request['start_date'])
                        ->whereDate('contacts.created_at', '<=', $request['end_date'])
                        ->onlyCustomers()
                        ->select(
                            [
                                'contacts.contact_id', 
                                'contacts.name', 
                                'contacts.created_at',
                                'total_rp',
                                'cg.name as customer_group', 
                                'cg.subscription_cost',
                                'cg.subscription_pieces',
                                'city', 
                                'state', 
                                'country', 
                                'landmark', 
                                'mobile', 
                                'contacts.id', 
                                'is_default',
                                'custom_field1',
                                'custom_field2',
                                'custom_field3',
                                'custom_field4',
                                'renewal_count',
                                'total_paid_value',
                                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final', final_total, 0)) as total_invoice"),
                                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final', (SELECT SUM(IF(is_return = 1,-1*amount,amount)) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as invoice_received"),
                                DB::raw("SUM(IF(t.type = 'sell_return', final_total, 0)) as total_sell_return"),
                                DB::raw("SUM(IF(t.type = 'sell_return', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as sell_return_paid"),
                                DB::raw("SUM(IF(t.type = 'opening_balance', final_total, 0)) as opening_balance"),
                                DB::raw("SUM(IF(t.type = 'opening_balance', (SELECT SUM(IF(is_return = 1,-1*amount,amount)) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as opening_balance_paid")
                            ])
                        ->groupBy('contacts.id');
            $contacts = Datatables::of($query)
                ->addColumn('address', '{{implode(array_filter([$custom_field4,$city,$state,$country,$landmark]), ", ")}}')
                // ->addColumn(
                //     'due',
                //     '<span class="display_currency contact_due" data-orig-value="{{$total_invoice - $invoice_received}}" data-currency_symbol=true data-highlight=true>{{($total_invoice - $invoice_received)}}</span>'
                // )
                ->editColumn(
                    'total_paid_value',
                    '<span class="display_currency total_paid_value" data-orig-value="{{ $total_paid_value }}" data-currency_symbol=true data-highlight=false>{{ $total_paid_value }}</span>'
                )
                ->addColumn(
                    'status',
                    '<h5 class="customer_sub_status_<?php echo $custom_field1 == "0" ? "off" : "on" ?>"><?php echo $custom_field1 == "0" ? "Not" : "Member" ?></h5>'
                )
                ->addColumn(
                    'action',
                    '<div class="btn-group">
                        <button type="button" class="btn btn-info dropdown-toggle btn-xs" 
                            data-toggle="dropdown" aria-expanded="false">' .
                            __("messages.actions") .
                            '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                            </span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                    @if(($total_invoice + $opening_balance - $invoice_received - $opening_balance_paid)  > 0)
                        <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=sell" class="pay_sale_due"><i class="fa fa-money" aria-hidden="true"></i>@lang("contact.pay_due_amount")</a></li>
                    @endif
                    @if(($total_sell_return - $sell_return_paid)  > 0)
                        <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=sell_return" class="pay_purchase_due"><i class="fa fa-money" aria-hidden="true"></i>@lang("lang_v1.pay_sell_return_due")</a></li>
                    @endif
                    @can("customer.view")
                        <li><a href="{{action(\'ContactController@show\', [$id])}}"><i class="fa fa-external-link" aria-hidden="true"></i> @lang("messages.view")</a></li>
                    @endcan
                    @can("customer.update")
                        <li><a href="{{action(\'ContactController@edit\', [$id])}}" class="edit_contact_button"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a></li>
                    @endcan
                    @if(!$is_default)
                    @can("customer.delete")
                        <li><a href="{{action(\'ContactController@destroy\', [$id])}}" class="delete_contact_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</a></li>
                    @endcan
                    @endif 
                    </ul></div>'
                )
                //<li><a href="{{action(\'ContactController@show\', [$id])}}"><i class="fa fa-cog" aria-hidden="true"></i> @lang("messages.block_user")</a></li>
                ->editColumn('total_rp', '{{$total_rp ?? 0}}')
                ->editColumn('created_at', '{{@format_date($created_at)}}')
                // ->removeColumn('total_invoice')
                // ->removeColumn('opening_balance')
                // ->removeColumn('opening_balance_paid')
                // ->removeColumn('invoice_received')
                // ->removeColumn('state')
                // ->removeColumn('country')
                // ->removeColumn('city')
                // ->removeColumn('type')
                // ->removeColumn('id')
                // ->removeColumn('is_default')
                // ->removeColumn('total_sell_return')
                // ->removeColumn('sell_return_paid')
                ->filterColumn('address', function ($query, $keyword) {
                    $query->whereRaw("CONCAT(COALESCE(landmark, ''), ', ', COALESCE(city, ''), ', ', COALESCE(state, ''), ', ', COALESCE(country, '') ) like ?", ["%{$keyword}%"]);
                });
            $reward_enabled = (request()->session()->get('business.enable_rp') == 1) ? true : false;
            if (!$reward_enabled) {
                $contacts->removeColumn('total_rp');
            }
            return $contacts->rawColumns(['custom_field1','custom_field3','action','total_paid_value','status'])
                            ->make(true);
            
        }catch(\Exception $e){
            return $e->getMessage();
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');

        //Check if subscribed or not
        if (!$this->moduleUtil->isSubscribed($business_id)) {
            return $this->moduleUtil->expiredResponse();
        }

        $types = [];
        if (auth()->user()->can('supplier.create')) {
            $types['supplier'] = __('report.supplier');
        }
        if (auth()->user()->can('customer.create')) {
            $types['customer'] = __('report.customer');
        }
        if (auth()->user()->can('supplier.create') && auth()->user()->can('customer.create')) {
            $types['both'] = __('lang_v1.both_supplier_customer');
        }

        $customer_groups = CustomerGroup::forDropdown($business_id);
        $customer_areas = DB::table('KW_AREA')->get();
        return view('contact.create',['customer_areas' => $customer_areas])
            ->with(compact('types', 'customer_groups'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            $business_id = $request->session()->get('user.business_id');

            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }

            $input = $request->only(['type', 'supplier_business_name',
                'name', 'tax_number', 'pay_term_number', 'pay_term_type', 'mobile', 'landline', 'alternate_number', 'city', 'state', 'country', 'landmark', 'customer_group_id', 'contact_id', 'custom_field1', 'custom_field2', 'custom_field3', 'custom_field4', 'email']);
            $input['business_id'] = $business_id;
            $input['created_by'] = $request->session()->get('user.id');

            $input['credit_limit'] = $request->input('credit_limit') != '' ? $this->commonUtil->num_uf($request->input('credit_limit')) : null;

            //Check Contact id
            $count = 0;
            if (!empty($input['contact_id'])) {
                $count = Contact::where('business_id', $input['business_id'])
                                ->where('contact_id', $input['contact_id'])
                                ->count();
            }

            if ($count == 0) {
                //Update reference count
                $ref_count = $this->commonUtil->setAndGetReferenceCount('contacts');

                if (empty($input['contact_id'])) {
                    //Generate reference number
                    $input['contact_id'] = $this->commonUtil->generateReferenceNumber('contacts', $ref_count);
                }
                $input['custom_field4'] = $request['customer_area'];
                if($request['type'] == 'customer'){
                    $input['custom_field1'] = $request['custom_field1'] * (25 / 100) + $request['custom_field1'];
                    $input['custom_field2'] =  0;
                    $input['custom_field3'] = $request['custom_field1'] * (25 / 100) + $request['custom_field1'];
                    $input['total_paid_value'] = $request['custom_field1'];
                }
                $contact = Contact::create($input);

                
                //Add opening balance
                if (!empty($request->input('opening_balance'))) {
                    $this->transactionUtil->createOpeningBalanceTransaction($business_id, $contact->id, $request->input('opening_balance'));
                }

                $output = ['success' => true,
                            'data' => $contact,
                            'msg' => __("contact.added_success")
                        ];
            } else {
                throw new \Exception("Error Processing Request", 1);
            }
        } catch (\Exception $e) {
            \Log::emergency("File:" . $e->getFile(). "Line:" . $e->getLine(). "Message:" . $e->getMessage());
            
            $output = ['success' => false,
                            //'msg' =>__("messages.something_went_wrong")
                            'msg' => $e->getMessage()
                        ];
        }

        return $output;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!auth()->user()->can('supplier.view') && !auth()->user()->can('customer.view')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');

        $contact = Contact::where('contacts.id', $id)
                            ->where('contacts.business_id', $business_id)
                            ->join('transactions AS t', 'contacts.id', '=', 't.contact_id')
                            ->select(
                                DB::raw("SUM(IF(t.type = 'purchase', final_total, 0)) as total_purchase"),
                                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final', final_total, 0)) as total_invoice"),
                                DB::raw("SUM(IF(t.type = 'purchase', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as purchase_paid"),
                                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final', (SELECT SUM(IF(is_return = 1,-1*amount,amount)) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as invoice_received"),
                                DB::raw("SUM(IF(t.type = 'opening_balance', final_total, 0)) as opening_balance"),
                                DB::raw("SUM(IF(t.type = 'opening_balance', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as opening_balance_paid"),
                                'contacts.*'
                            )->first();

        $reward_enabled = (request()->session()->get('business.enable_rp') == 1 && in_array($contact->type, ['customer', 'both'])) ? true : false;

        return view('contact.show')
             ->with(compact('contact', 'reward_enabled'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!auth()->user()->can('supplier.update') && !auth()->user()->can('customer.update')) {
            abort(403, 'Unauthorized action.');
        }

        if (request()->ajax()) {
            $business_id = request()->session()->get('user.business_id');
            $contact = Contact::where('business_id', $business_id)->find($id);

            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }

            $types = [];
            if (auth()->user()->can('supplier.create')) {
                $types['supplier'] = __('report.supplier');
            }
            if (auth()->user()->can('customer.create')) {
                $types['customer'] = __('report.customer');
            }
            if (auth()->user()->can('supplier.create') && auth()->user()->can('customer.create')) {
                $types['both'] = __('lang_v1.both_supplier_customer');
            }

            $customer_groups = CustomerGroup::forDropdown($business_id);
            $areas = DB::table('KW_AREA')->get();
            $ob_transaction =  Transaction::where('contact_id', $id)
                                            ->where('type', 'opening_balance')
                                            ->first();
            $opening_balance = !empty($ob_transaction->final_total) ? $ob_transaction->final_total : 0;

            //Deduct paid amount from opening balance.
            if (!empty($opening_balance)) {
                $opening_balance_paid = $this->transactionUtil->getTotalAmountPaid($ob_transaction->id);
                if (!empty($opening_balance_paid)) {
                    $opening_balance = $opening_balance - $opening_balance_paid;
                }

                $opening_balance = $this->commonUtil->num_f($ob_transaction->final_total);
            }

            return view('contact.edit')
                ->with(compact('contact', 'types', 'customer_groups', 'opening_balance','areas'));
        }
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
        if (!auth()->user()->can('supplier.update') && !auth()->user()->can('customer.update')) {
            abort(403, 'Unauthorized action.');
        }

        if (request()->ajax()) {
            try {
                $input = $request->only(['type', 'supplier_business_name', 'name', 'tax_number', 'pay_term_number', 'pay_term_type', 'mobile', 'landline', 'alternate_number', 'city', 'state', 'country', 'landmark', 'customer_group_id', 'contact_id', 'custom_field1', 'custom_field2', 'custom_field3', 'custom_field4', 'email']);

                $input['credit_limit'] = $request->input('credit_limit') != '' ? $this->commonUtil->num_uf($request->input('credit_limit')) : null;
                
                $business_id = $request->session()->get('user.business_id');

                if (!$this->moduleUtil->isSubscribed($business_id)) {
                    return $this->moduleUtil->expiredResponse();
                }

                $count = 0;

                //Check Contact id
                if (!empty($input['contact_id'])) {
                    $count = Contact::where('business_id', $business_id)
                            ->where('contact_id', $input['contact_id'])
                            ->where('id', '!=', $id)
                            ->count();
                }
                
                if ($count == 0) {
                    $contact = Contact::where('business_id', $business_id)->findOrFail($id);
                    foreach ($input as $key => $value) {
                        $contact->$key = $value;
                    }
                    $contact->custom_field4 = $request['customer_area'];
                    $contact->save();

                    // if($request['type'] == 'customer'){
                    //     $input['custom_field1'] = $request['custom_field1'] * (25 / 100) + $request['custom_field1'];
                    //     $input['custom_field2'] =  0;
                    //     $input['custom_field3'] = $request['custom_field1'] * (25 / 100) + $request['custom_field1'];
                    //     $input['total_paid_value'] = $request['custom_field1'];
                    // }

                    //Get opening balance if exists
                    $ob_transaction =  Transaction::where('contact_id', $id)
                                            ->where('type', 'opening_balance')
                                            ->first();

                    if (!empty($ob_transaction)) {
                        $amount = $this->commonUtil->num_uf($request->input('opening_balance'));
                        $opening_balance_paid = $this->transactionUtil->getTotalAmountPaid($ob_transaction->id);
                        if (!empty($opening_balance_paid)) {
                            $amount += $opening_balance_paid;
                        }
                        
                        $ob_transaction->final_total = $amount;
                        $ob_transaction->save();
                        //Update opening balance payment status
                        $this->transactionUtil->updatePaymentStatus($ob_transaction->id, $ob_transaction->final_total);
                    } else {
                        //Add opening balance
                        if (!empty($request->input('opening_balance'))) {
                            $this->transactionUtil->createOpeningBalanceTransaction($business_id, $contact->id, $request->input('opening_balance'));
                        }
                    }

                    $output = ['success' => true,
                                'msg' => __("contact.updated_success")
                                ];
                } else {
                    throw new \Exception("Error Processing Request", 1);
                }
            } catch (\Exception $e) {
                \Log::emergency("File:" . $e->getFile(). "Line:" . $e->getLine(). "Message:" . $e->getMessage());
            
                $output = ['success' => false,
                            'msg' => __("messages.something_went_wrong")
                        ];
            }

            return $output;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!auth()->user()->can('supplier.delete') && !auth()->user()->can('customer.delete')) {
            abort(403, 'Unauthorized action.');
        }

        if (request()->ajax()) {
            try {
                $business_id = request()->user()->business_id;

                //Check if any transaction related to this contact exists
                $count = Transaction::where('business_id', $business_id)
                                    ->where('contact_id', $id)
                                    ->count();
                if ($count == 0) {
                    $contact = Contact::where('business_id', $business_id)->findOrFail($id);
                    if (!$contact->is_default) {
                        $contact->delete();
                    }
                    $output = ['success' => true,
                                'msg' => __("contact.deleted_success")
                                ];
                } else {
                    $output = ['success' => false,
                                'msg' => __("lang_v1.you_cannot_delete_this_contact")
                                ];
                }
            } catch (\Exception $e) {
                \Log::emergency("File:" . $e->getFile(). "Line:" . $e->getLine(). "Message:" . $e->getMessage());
            
                $output = ['success' => false,
                            'msg' => __("messages.something_went_wrong")
                        ];
            }

            return $output;
        }
    }

    /**
     * Retrieves list of customers, if filter is passed then filter it accordingly.
     *
     * @param  string  $q
     * @return JSON
     */
    public function getCustomers()
    {
        if (request()->ajax()) {
            $term = request()->input('q', '');

            $business_id = request()->session()->get('user.business_id');
            $user_id = request()->session()->get('user.id');

            $contacts = Contact::where('business_id', $business_id);

            $selected_contacts = User::isSelectedContacts($user_id);
            if ($selected_contacts) {
                $contacts->join('user_contact_access AS uca', 'contacts.id', 'uca.contact_id')
                ->where('uca.user_id', $user_id);
            }

            if (!empty($term)) {
                $contacts->where(function ($query) use ($term) {
                    $query->where('name', 'like', '%' . $term .'%')
                            ->orWhere('supplier_business_name', 'like', '%' . $term .'%')
                            ->orWhere('mobile', 'like', '%' . $term .'%')
                            ->orWhere('landline', 'like', '%' . $term .'%')
                            ->orWhere('contacts.contact_id', 'like', '%' . $term .'%');
                });
            }

            $contacts->select(
                'contacts.id',
                DB::raw("IF(contacts.contact_id IS NULL OR contacts.contact_id='', name, CONCAT(name, ' (', contacts.contact_id, ')')) AS text"),
                'mobile',
                'landmark',
                'city',
                'state',
                'pay_term_number',
                'pay_term_type'
            )
                    ->onlyCustomers();

            if (request()->session()->get('business.enable_rp') == 1) {
                $contacts->addSelect('total_rp');
            }
            $contacts = $contacts->get();
            return json_encode($contacts);
        }
    }

    /**
     * Checks if the given contact id already exist for the current business.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function checkContactId(Request $request)
    {
        $contact_id = $request->input('contact_id');

        $valid = 'true';
        if (!empty($contact_id)) {
            $business_id = $request->session()->get('user.business_id');
            $hidden_id = $request->input('hidden_id');

            $query = Contact::where('business_id', $business_id)
                            ->where('contact_id', $contact_id);
            if (!empty($hidden_id)) {
                $query->where('id', '!=', $hidden_id);
            }
            $count = $query->count();
            if ($count > 0) {
                $valid = 'false';
            }
        }
        echo $valid;
        exit;
    }

    /**
     * Shows import option for contacts
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function getImportContacts()
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }

        $zip_loaded = extension_loaded('zip') ? true : false;

        //Check if zip extension it loaded or not.
        if ($zip_loaded === false) {
            $output = ['success' => 0,
                            'msg' => 'Please install/enable PHP Zip archive for import'
                        ];

            return view('contact.import')
                ->with('notification', $output);
        } else {
            return view('contact.import');
        }
    }

    /**
     * Imports contacts
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function postImportContacts(Request $request)
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }

        try {

            $notAllowed = $this->commonUtil->notAllowedInDemo();
            if (!empty($notAllowed)) {
                return $notAllowed;
            }
            
            //Set maximum php execution time
            ini_set('max_execution_time', 0);

            if ($request->hasFile('contacts_csv')) {
                $file = $request->file('contacts_csv');
                $parsed_array = Excel::toArray([], $file);
                //Remove header row
                $imported_data = array_splice($parsed_array[0], 1);
                
                $business_id = $request->session()->get('user.business_id');
                $user_id = $request->session()->get('user.id');

                $formated_data = [];

                $is_valid = true;
                $error_msg = '';
                
                DB::beginTransaction();
                foreach ($imported_data as $key => $value) {
                    //Check if 21 no. of columns exists
                    if (count($value) != 21) {
                        $is_valid =  false;
                        $error_msg = "Number of columns mismatch";
                        break;
                    }

                    $row_no = $key + 1;
                    $contact_array = [];

                    //Check contact type
                    $contact_type = '';
                    $contact_types = [
                        1 => 'customer',
                        2 => 'supplier',
                        3 => 'both'
                    ];
                    if (!empty($value[0])) {
                        $contact_type = strtolower(trim($value[0]));
                        if (in_array($contact_type, [1, 2, 3])) {
                            $contact_array['type'] = $contact_types[$contact_type];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Invalid contact type in row no. $row_no";
                            break;
                        }
                    } else {
                        $is_valid =  false;
                        $error_msg = "Contact type is required in row no. $row_no";
                        break;
                    }

                    //Check contact name
                    if (!empty($value[1])) {
                        $contact_array['name'] = $value[1];
                    } else {
                        $is_valid =  false;
                        $error_msg = "Contact name is required in row no. $row_no";
                        break;
                    }

                    //Check supplier fields
                    if (in_array($contact_type, ['supplier', 'both'])) {
                        //Check business name
                        if (!empty(trim($value[2]))) {
                            $contact_array['supplier_business_name'] = $value[2];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Business name is required in row no. $row_no";
                            break;
                        }

                        //Check pay term
                        if (trim($value[6]) != '') {
                            $contact_array['pay_term_number'] = trim($value[6]);
                        } else {
                            $is_valid =  false;
                            $error_msg = "Pay term is required in row no. $row_no";
                            break;
                        }

                        //Check pay period
                        $pay_term_type = strtolower(trim($value[7]));
                        if (in_array($pay_term_type, ['days', 'months'])) {
                            $contact_array['pay_term_type'] = $pay_term_type;
                        } else {
                            $is_valid =  false;
                            $error_msg = "Pay term period is required in row no. $row_no";
                            break;
                        }
                    }

                    //Check contact ID
                    if (!empty(trim($value[3]))) {
                        $count = Contact::where('business_id', $business_id)
                                    ->where('contact_id', $value[3])
                                    ->count();
                

                        if ($count == 0) {
                            $contact_array['contact_id'] = $value[3];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Contact ID already exists in row no. $row_no";
                            break;
                        }
                    }

                    //Tax number
                    if (!empty(trim($value[4]))) {
                        $contact_array['tax_number'] = $value[4];
                    }

                    //Check opening balance
                    if (!empty(trim($value[5])) && $value[5] != 0) {
                        $contact_array['opening_balance'] = trim($value[5]);
                    }

                    //Check credit limit
                    if (trim($value[8]) != '' && in_array($contact_type, ['customer', 'both'])) {
                        $contact_array['credit_limit'] = trim($value[8]);
                    }

                    //Check email
                    if (!empty(trim($value[9]))) {
                        if (filter_var(trim($value[9]), FILTER_VALIDATE_EMAIL)) {
                            $contact_array['email'] = $value[9];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Invalid email id in row no. $row_no";
                            break;
                        }
                    }

                    //Mobile number
                    if (!empty(trim($value[10]))) {
                        $contact_array['mobile'] = $value[10];
                    } else {
                        $is_valid =  false;
                        $error_msg = "Mobile number is required in row no. $row_no";
                        break;
                    }

                    //Alt contact number
                    $contact_array['alternate_number'] = $value[11];

                    //Landline
                    $contact_array['landline'] = $value[12];

                    //City
                    $contact_array['city'] = $value[13];

                    //State
                    $contact_array['state'] = $value[14];

                    //Country
                    $contact_array['country'] = $value[15];

                    //Landmark
                    $contact_array['landmark'] = $value[16];

                    //Cust fields
                    $contact_array['custom_field1'] = $value[17];
                    $contact_array['custom_field2'] = $value[18];
                    $contact_array['custom_field3'] = $value[19];
                    $contact_array['custom_field4'] = $value[20];

                    $formated_data[] = $contact_array;
                }
                if (!$is_valid) {
                    throw new \Exception($error_msg);
                }

                if (!empty($formated_data)) {
                    foreach ($formated_data as $contact_data) {
                        $ref_count = $this->transactionUtil->setAndGetReferenceCount('contacts');
                        //Set contact id if empty
                        if (empty($contact_data['contact_id'])) {
                            $contact_data['contact_id'] = $this->commonUtil->generateReferenceNumber('contacts', $ref_count);
                        }

                        $opening_balance = 0;
                        if (isset($contact_data['opening_balance'])) {
                            $opening_balance = $contact_data['opening_balance'];
                            unset($contact_data['opening_balance']);
                        }

                        $contact_data['business_id'] = $business_id;
                        $contact_data['created_by'] = $user_id;

                        $contact = Contact::create($contact_data);

                        if (!empty($opening_balance)) {
                            $this->transactionUtil->createOpeningBalanceTransaction($business_id, $contact->id, $opening_balance);
                        }
                    }
                }

                $output = ['success' => 1,
                            'msg' => __('product.file_imported_successfully')
                        ];

                DB::commit();
            }
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile(). "Line:" . $e->getLine(). "Message:" . $e->getMessage());
            
            $output = ['success' => 0,
                            'msg' => $e->getMessage()
                        ];
            return redirect()->route('contacts.import')->with('notification', $output);
        }

        return redirect()->action('ContactController@index', ['type' => 'supplier'])->with('status', $output);
    }

    /**
     * Shows ledger for contacts
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function getLedger()
    {
        if (!auth()->user()->can('supplier.view') && !auth()->user()->can('customer.view')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');
        $contact_id = request()->input('contact_id');
        $transaction_types = explode(',', request()->input('transaction_types'));
        $show_payments = request()->input('show_payments') == 'true' ? true : false;

        //Get transactions
        $query1 = Transaction::where('transactions.contact_id', $contact_id)
                            ->where('transactions.business_id', $business_id)
                            ->where('status', '!=', 'draft')
                            ->whereIn('type', $transaction_types)
                            ->with(['location']);

        if (!empty(request()->start_date) && !empty(request()->end_date)) {
            $start = request()->start_date;
            $end =  request()->end_date;
            $query1->whereDate('transactions.transaction_date', '>=', $start)
                        ->whereDate('transactions.transaction_date', '<=', $end);
        }

        $transactions = $query1->get();

        $transaction_types = Transaction::transactionTypes();

        $ledger = [];
        foreach ($transactions as $transaction) {
            $ledger[] = [
                'date' => $transaction->transaction_date,
                'ref_no' => in_array($transaction->type, ['sell', 'sell_return']) ? $transaction->invoice_no : $transaction->ref_no,
                'type' => $transaction_types[$transaction->type],
                'location' => $transaction->location->name,
                'payment_status' =>  __('lang_v1.' . $transaction->payment_status),
                'total' => $transaction->final_total,
                'payment_method' => '',
                'debit' => '',
                'credit' => '',
                'others' => $transaction->additional_notes
            ];
        }

        if ($show_payments) {
            $query2 = TransactionPayment::join(
                'transactions as t',
                'transaction_payments.transaction_id',
                '=',
                't.id'
            )
                ->leftJoin('business_locations as bl', 't.location_id', '=', 'bl.id')
                ->where('t.contact_id', $contact_id)
                ->where('t.business_id', $business_id)
                ->where('t.status', '!=', 'draft');

            if (!empty(request()->start_date) && !empty(request()->end_date)) {
                $start = request()->start_date;
                $end =  request()->end_date;
                $query1->whereDate('transactions.transaction_date', '>=', $start)
                            ->whereDate('transactions.transaction_date', '<=', $end);

                if ($show_payments) {
                    $query2->whereDate('paid_on', '>=', $start)
                            ->whereDate('paid_on', '<=', $end);
                }
            }

            $payments = $query2->select('transaction_payments.*', 'bl.name as location_name', 't.type as transaction_type', 't.ref_no', 't.invoice_no')->get();
            $paymentTypes = $this->transactionUtil->payment_types();
            foreach ($payments as $payment) {
                $ref_no = in_array($payment->transaction_type, ['sell', 'sell_return']) ?  $payment->invoice_no :  $payment->ref_no;
                $ledger[] = [
                    'date' => $payment->paid_on,
                    'ref_no' => $payment->payment_ref_no,
                    'type' => $transaction_types['payment'],
                    'location' => $payment->location_name,
                    'payment_status' => '',
                    'total' => '',
                    'payment_method' => !empty($paymentTypes[$payment->method]) ? $paymentTypes[$payment->method] : '',
                    'debit' => in_array($payment->transaction_type, ['purchase', 'sell_return']) ? $payment->amount : '',
                    'credit' => in_array($payment->transaction_type, ['sell', 'purchase_return', 'opening_balance']) ? $payment->amount : '',
                    'others' => $payment->note . '<small>' . __('account.payment_for') . ': ' . $ref_no . '</small>'
                ];
            }
        }

        //Sort by date
        if (!empty($ledger)) {
            usort($ledger, function ($a, $b) {
                $t1 = strtotime($a['date']);
                $t2 = strtotime($b['date']);
                return $t2 - $t1;
            });
        }
        return view('contact.ledger')
             ->with(compact('ledger'));
    }

    public function postCustomersApi(Request $request)
    {
        try {
            $api_token = $request->header('API-TOKEN');

            $api_settings = $this->moduleUtil->getApiSettings($api_token);

            $business = Business::find($api_settings->business_id);

            $data = $request->only(['name', 'email']);

            $customer = Contact::where('business_id', $api_settings->business_id)
                                ->where('email', $data['email'])
                                ->whereIn('type', ['customer', 'both'])
                                ->first();

            if (empty($customer)) {
                $data['type'] = 'customer';
                $data['business_id'] = $api_settings->business_id;
                $data['created_by'] = $business->owner_id;
                $data['mobile'] = 0;

                $ref_count = $this->commonUtil->setAndGetReferenceCount('contacts', $business->id);

                $data['contact_id'] = $this->commonUtil->generateReferenceNumber('contacts', $ref_count, $business->id);

                $customer = Contact::create($data);
            }
        } catch (\Exception $e) {
            \Log::emergency("File:" . $e->getFile(). "Line:" . $e->getLine(). "Message:" . $e->getMessage());
            
            return $this->respondWentWrong($e);
        }

        return $this->respond($customer);
    }

    public function getCustomerSubscriptionInfo(Request $request){
        try{
            $cid = $request['cid'];
            $response = Contact::where('contacts.id',$cid)
                ->where('contacts.type','customer')
                ->select([
                    'contacts.name',
                    'contacts.contact_id',
                    'contacts.custom_field1',
                    'contacts.custom_field2',
                    'contacts.custom_field3',
                    'total_paid_value'
                ])
                ->first();
            return $response;
        }catch(\Exception $e){
            return response()->json(0, 200);
        }
    }

    public function updateCustomerSubscriptionInfo(Request $request){
        try{
            $cid = $request['cid'];
            $total_used = number_format($request['total_used'],3);
            $total_avil = number_format($request['net_total_avail'],3);
            $response = Contact::where('contacts.id',$cid)
            ->update([
                'custom_field2'=>$total_used,
                'custom_field3'=>$total_avil,
            ]);
            return $response;
        }catch(\Exception $e){
            return response()->json($e->getMessage(), 200);
        }
    }

    public function renewCustomerSubscriptionPlan(Request $request){
        try{
            $cid = $request['cid'];
            $check = $request['paid_for_renewal'];
            $customer = Contact::where('id',$cid)->first();
            return Contact::where('id',$cid)
            ->update([
                'custom_field3' => $check * (25 / 100) + $customer->custom_field3 + $check,
                'renewal_count' => $customer->renewal_count + 1, 
            ]);
        }catch(\Exception $e){
            return response()->json($e->getMessage(), 200);
        }
    }

    public function printMembership($id){
        try{
            $contact = Contact::join('customer_groups as cg','cg.id','=','contacts.customer_group_id')
            ->where('contacts.id',$id)
            ->select([
                'contacts.*',
                'cg.subscription_pieces',
            ])
            ->first();
            $content = view('contact.print',['data'=>$contact])->render();
            return  response()->json([
                'success'=>true,
                'html_content'=>$content,
        ], 200);
        }catch(\Exception $e){
            return  response()->json(['success'=>false,'msg'=>$e->getMessage()], 200);
        }
    }
}
