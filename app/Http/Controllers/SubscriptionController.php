<?php

namespace App\Http\Controllers;

use App\BusinessLocation;

use Datatables;
use DB;
use Illuminate\Http\Request;
use App\SubscriptionRegister;
use App\SubscriptionPlan;
use App\Contact;
use Carbon\Carbon;
use Session;
use Auth;

use App\Account;
use App\Business;
use App\CustomerGroup;
use App\InvoiceScheme;
use App\SellingPriceGroup;
use App\TaxRate;
use App\Transaction;
use App\TransactionSellLine;
use App\TypesOfService;


use App\Utils\BusinessUtil;
use App\Utils\ContactUtil;
use App\Utils\ModuleUtil;
use App\Utils\ProductUtil;
use App\Utils\TransactionUtil;
class SubscriptionController extends Controller
{
     /**
     * All Utils instance.
     *
     */
    protected $contactUtil;
    protected $businessUtil;
    protected $transactionUtil;
    protected $productUtil;


    /**
     * Constructor
     *
     * @param ProductUtils $product
     * @return void
     */
    public function __construct(ContactUtil $contactUtil, BusinessUtil $businessUtil, TransactionUtil $transactionUtil, ModuleUtil $moduleUtil, ProductUtil $productUtil)
    {
        $this->contactUtil = $contactUtil;
        $this->businessUtil = $businessUtil;
        $this->transactionUtil = $transactionUtil;
        $this->moduleUtil = $moduleUtil;
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

    public function index()
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }

        if (request()->ajax()) {
            $business_id = request()->session()->get('user.business_id');

            $data = SubscriptionRegister::with('contact','plan')->where('subscription_registers.business_id',$business_id)
            ->select('subscription_registers.*');

            return Datatables::of($data)
            ->addColumn('plan_name',function($item){

                if(!empty($item->plan->title))
                 return $item->plan->title;
                 else
                 return "DELETED";
            })
            ->addColumn(
                'action',
                '@can("user.update")
                    <a href="{{action(\'SubscriptionController@edit\', [$id])}}" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a>
                    &nbsp;
                @endcan
                @can("user.view")
                <a href="#" data-href="{{action(\'SubscriptionController@view\', [$id])}}" data-container=".view_modal" class="btn btn-xs btn-info btn-modal"><i class="fa fa-eye"></i> @lang("messages.view")</a>
                &nbsp;
                @endcan
                @can("user.delete")
                    <button data-href="{{action(\'SubscriptionController@delete\', [$id])}}" class="btn btn-xs btn-danger delete_subscription_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</button>
                @endcan
                 
                @if ($IsStarted)
                @if($IsSuspended)
                  @can("user.delete")
                  <button data-href="{{action(\'SubscriptionController@unsuspendSubscription\', [$id])}}" class="btn btn-xs btn-danger confirm_subscription_button"><i class="glyphicon glyphicon-play"></i> @lang("subscriptions.unsuspend")</button>
                  @endcan

                @else
                  @can("user.delete")
                  <button data-href="{{action(\'SubscriptionController@suspendSubscription\', [$id])}}" class="btn btn-xs btn-danger confirm_subscription_button"><i class="glyphicon glyphicon-stop"></i> @lang("subscriptions.suspend")</button>
                  @endcan


                  @if($IsPaused)
                    @can("user.delete")
                    <button data-href="{{action(\'SubscriptionController@resumeSubscription\', [$id])}}" class="btn btn-xs btn-success confirm_subscription_button"><i class="glyphicon glyphicon-play"></i> @lang("subscriptions.resume")</button>
                    @endcan

                  @else
                    @can("user.delete")
                    <button data-href="{{action(\'SubscriptionController@pauseSubscription\', [$id])}}" class="btn btn-xs btn-warning confirm_subscription_button"><i class="glyphicon glyphicon-pause"></i> @lang("subscriptions.pause")</button>
                    @endcan               
                  @endif
                
                @endif

                @else

                @can("user.delete")
                  <button data-href="{{action(\'SubscriptionController@startSubscription\', [$id])}}" class="btn btn-xs btn-success confirm_subscription_button"><i class="glyphicon glyphicon-play"></i> @lang("subscriptions.start")</button>
                  @endcan


                @endif

                

                '
            )
            ->removeColumn('id')
            ->rawColumns(['action'])
            ->make(true);

        }
        
        return view('subscription.index');
    }


    public function view($id)
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }
        $data = SubscriptionRegister::with('contact','plan')->find($id);
       return view('subscription.view',compact('data'));
    }

    public function edit($id)
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }
       $data = SubscriptionRegister::find($id);
       $plans = SubscriptionPlan::pluck('title', 'id');
        $customers = Contact::where('type','customer')->pluck('name', 'id');
       return view('subscription.edit',compact('data','plans','customers'));
    }

    public function create()
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }
    
        $plans = SubscriptionPlan::pluck('title', 'id');
        $customers = Contact::where('type','customer')->pluck('name', 'id');
       return view('subscription.create',compact('plans','customers'));
    }


    public function insert(Request $request)
    {
        $plan_id = $request->plan_id;
        $plan = SubscriptionPlan::find($plan_id);
        $date_start = Carbon::parse($request->date_start);
        $date_end = $date_start->copy()->addMonth($plan->months_no);

        $newItem = new SubscriptionRegister();
        $newItem->business_id = $request->session()->get('user.business_id');
        $newItem->plan_id = $plan_id;
        //$newItem->contact_id = $request->contact_id;
        $newItem->payment_method = $request->payment_method;
        $newItem->payment_status = $request->payment_status;
        $newItem->subscription_method = "local";
        $newItem->plan_price = $plan->price;
        $newItem->meals_no = $plan->meals_no;
        $newItem->snacks_no = $plan->snacks_no;
        $newItem->date_start = $date_start;
        $newItem->date_end = $date_end;
		
        $newItem->client_name = $request->client_name;
		$newItem->client_gender = $request->client_gender;
		$newItem->client_mobile = $request->client_mobile;
		$newItem->client_weight = $request->client_weight;
		$newItem->client_height = $request->client_height;
		$newItem->client_state = $request->client_state;
		$newItem->client_address = $request->client_address;
		
        $newItem->save();

        return redirect('subscriptions');




    }

    public function update(Request $request,$id)
    {
        $plan_id = $request->plan_id;
        $plan = SubscriptionPlan::find($plan_id);
        $date_start = Carbon::parse($request->date_start);
        $date_end = $date_start->copy()->addMonth($plan->months_no);

        $newItem =  SubscriptionRegister::find($id);
        $newItem->plan_id = $plan_id;
        //$newItem->contact_id = $request->contact_id;
        $newItem->payment_method = $request->payment_method;
        $newItem->payment_status = $request->payment_status;
        
        $newItem->plan_price = $plan->price;
        $newItem->meals_no = $plan->meals_no;
        $newItem->snacks_no = $plan->snacks_no;
        $newItem->date_start = $date_start;
        $newItem->date_end = $date_end;

		$newItem->client_name = $request->client_name;
		$newItem->client_gender = $request->client_gender;
		$newItem->client_mobile = $request->client_mobile;
		$newItem->client_weight = $request->client_weight;
		$newItem->client_height = $request->client_height;
		$newItem->client_state = $request->client_state;
		$newItem->client_address = $request->client_address;
		
		
        $newItem->save();

        return redirect('subscriptions');




    }


    public function delete($id)
    {
        
        $newItem =  SubscriptionRegister::find($id);
        $newItem->delete();
        
        
    }



    public function plansIndex()
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }

        if (request()->ajax()) {
            $business_id = request()->session()->get('user.business_id');

            $data = SubscriptionPlan::where('business_id',$business_id);

            return Datatables::of($data)->addColumn(
                'action',
                '@can("user.update")
                    <a href="{{action(\'SubscriptionController@plansEdit\', [$id])}}" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a>
                    &nbsp;
                @endcan
                @can("user.delete")
                    <button data-href="{{action(\'SubscriptionController@plansDelete\', [$id])}}" class="btn btn-xs btn-danger delete_plan_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</button>
                @endcan'
            )
            ->removeColumn('id')
            ->rawColumns(['action'])
            ->make(true);

        }
          return view('subscription.plans.index');
    }


    public function plansView()
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }

       return view('subscription.plans.view');
    }

    public function plansEdit($id)
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }
       
        $data = SubscriptionPlan::find($id);
       return view('subscription.plans.edit',compact('data'));
    }

    public function plansCreate()
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }
        
        

       return view('subscription.plans.create');
    }

    public function plansInsert(Request $request)
    {
        
        $newItem = new SubscriptionPlan();
        $newItem->business_id = $request->session()->get('user.business_id');
        $newItem->title = $request->plan_title;
        $newItem->price = $request->plan_price;
        $newItem->gender = $request->gender;
        $newItem->months_no = 1;
        $newItem->meals_no = $request->meals_no;
        $newItem->snacks_no = $request->snacks_no;
        $newItem->notes = $request->additional_notes;

        $newItem->save();

        return redirect('subscriptions/plans');
    }

    public function plansUpdate(Request $request,$id)
    {
        
        $newItem =  SubscriptionPlan::find($id);
        $newItem->business_id = $request->session()->get('user.business_id');
        $newItem->title = $request->plan_title;
        $newItem->price = $request->plan_price;
        $newItem->gender = $request->gender;
        $newItem->months_no = 1;
        $newItem->meals_no = $request->meals_no;
        $newItem->snacks_no = $request->snacks_no;
        $newItem->notes = $request->additional_notes;

        $newItem->save();

        return redirect('subscriptions/plans');

    }

    public function plansDelete($id)
    {
        
        $newItem =  SubscriptionPlan::find($id);
        $newItem->delete();
        
        
    }


    public function ordersIndex()
    {
        if (!auth()->user()->can('purchase.view') && !auth()->user()->can('purchase.create')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');
        $is_woocommerce = $this->moduleUtil->isModuleInstalled('Woocommerce');
        $is_tables_enabled = $this->transactionUtil->isModuleEnabled('tables');
        $is_service_staff_enabled = $this->transactionUtil->isModuleEnabled('service_staff');

        if (request()->ajax()) {
            $payment_types = $this->transactionUtil->payment_types();
            $with = [];
            $shipping_statuses = $this->transactionUtil->shipping_statuses();
            $sells = Transaction::with('sell_lines.product','subscription.plan')->leftJoin('contacts', 'transactions.contact_id', '=', 'contacts.id')
                // ->leftJoin('transaction_payments as tp', 'transactions.id', '=', 'tp.transaction_id')
                ->leftJoin('transaction_sell_lines as tsl', 'transactions.id', '=', 'tsl.transaction_id')
                ->leftJoin('users as u', 'transactions.created_by', '=', 'u.id')
                ->leftJoin('users as ss', 'transactions.res_waiter_id', '=', 'ss.id')
                ->leftJoin('res_tables as tables', 'transactions.res_table_id', '=', 'tables.id')
                ->join(
                    'business_locations AS bl',
                    'transactions.location_id',
                    '=',
                    'bl.id'
                )
                ->leftJoin(
                    'transactions AS SR',
                    'transactions.id',
                    '=',
                    'SR.return_parent_id'
                )
                ->leftJoin(
                    'types_of_services AS tos',
                    'transactions.types_of_service_id',
                    '=',
                    'tos.id'
                )
                ->where('transactions.subscription_id','!=',null)
                ->where('transactions.business_id', $business_id)
                ->where('transactions.type', 'sell')
                ->where('transactions.status', 'final')
                ->select('transactions.subscription_id',
                    'transactions.id',
                    'transactions.transaction_date',
                    'transactions.is_direct_sale',
                    'transactions.invoice_no',
                    'contacts.name',
                    'contacts.mobile',
                    'transactions.payment_status',
                    'transactions.final_total',
                    'transactions.tax_amount',
                    'transactions.discount_amount',
                    'transactions.discount_type',
                    'transactions.total_before_tax',
                    'transactions.rp_redeemed',
                    'transactions.rp_redeemed_amount',
                    'transactions.rp_earned',
                    'transactions.types_of_service_id',
                    'transactions.shipping_status',
                    'transactions.pay_term_number',
                    'transactions.pay_term_type',
                    'transactions.additional_notes',
                    'transactions.staff_note',
                    'transactions.shipping_details',
                    DB::raw("CONCAT(COALESCE(u.surname, ''),' ',COALESCE(u.first_name, ''),' ',COALESCE(u.last_name,'')) as added_by"),
                    DB::raw('(SELECT SUM(IF(TP.is_return = 1,-1*TP.amount,TP.amount)) FROM transaction_payments AS TP WHERE
                        TP.transaction_id=transactions.id) as total_paid'),
                    'bl.name as business_location',
                    DB::raw('COUNT(SR.id) as return_exists'),
                    DB::raw('(SELECT SUM(TP2.amount) FROM transaction_payments AS TP2 WHERE
                        TP2.transaction_id=SR.id ) as return_paid'),
                    DB::raw('COALESCE(SR.final_total, 0) as amount_return'),
                    'SR.id as return_transaction_id',
                    'tos.name as types_of_service_name',
                    'transactions.service_custom_field_1',
                    DB::raw('COUNT( DISTINCT tsl.id) as total_items'),
                    DB::raw("CONCAT(COALESCE(ss.surname, ''),' ',COALESCE(ss.first_name, ''),' ',COALESCE(ss.last_name,'')) as waiter"),
                    'tables.name as table_name'
                );

            $permitted_locations = auth()->user()->permitted_locations();
            if ($permitted_locations != 'all') {
                $sells->whereIn('transactions.location_id', $permitted_locations);
            }

            //Add condition for created_by,used in sales representative sales report
            if (request()->has('created_by')) {
                $created_by = request()->get('created_by');
                if (!empty($created_by)) {
                    $sells->where('transactions.created_by', $created_by);
                }
            }

            if (!auth()->user()->can('direct_sell.access') && auth()->user()->can('view_own_sell_only')) {
                $sells->where('transactions.created_by', request()->session()->get('user.id'));
            }

            if (!empty(request()->input('payment_status')) && request()->input('payment_status') != 'overdue') {
                $sells->where('transactions.payment_status', request()->input('payment_status'));
            } elseif (request()->input('payment_status') == 'overdue') {
                $sells->whereIn('transactions.payment_status', ['due', 'partial'])
                    ->whereNotNull('transactions.pay_term_number')
                    ->whereNotNull('transactions.pay_term_type')
                    ->whereRaw("IF(transactions.pay_term_type='days', DATE_ADD(transactions.transaction_date, INTERVAL transactions.pay_term_number DAY) < CURDATE(), DATE_ADD(transactions.transaction_date, INTERVAL transactions.pay_term_number MONTH) < CURDATE())");
            }

            //Add condition for location,used in sales representative expense report
            if (request()->has('location_id')) {
                $location_id = request()->get('location_id');
                if (!empty($location_id)) {
                    $sells->where('transactions.location_id', $location_id);
                }
            }

            if (!empty(request()->input('rewards_only')) && request()->input('rewards_only') == true) {
                $sells->where(function ($q) {
                    $q->whereNotNull('transactions.rp_earned')
                    ->orWhere('transactions.rp_redeemed', '>', 0);
                });
            }

            if (!empty(request()->customer_id)) {
                $customer_id = request()->customer_id;
                $sells->where('contacts.id', $customer_id);
            }
            if (!empty(request()->start_date) && !empty(request()->end_date)) {
                $start = request()->start_date;
                $end =  request()->end_date;
                $sells->whereDate('transactions.transaction_date', '>=', $start)
                            ->whereDate('transactions.transaction_date', '<=', $end);
            }

            //Check is_direct sell
            if (request()->has('is_direct_sale')) {
                $is_direct_sale = request()->is_direct_sale;
                if ($is_direct_sale == 0) {
                    $sells->where('transactions.is_direct_sale', 0);
                    $sells->whereNull('transactions.sub_type');
                }
            }

            //Add condition for commission_agent,used in sales representative sales with commission report
            if (request()->has('commission_agent')) {
                $commission_agent = request()->get('commission_agent');
                if (!empty($commission_agent)) {
                    $sells->where('transactions.commission_agent', $commission_agent);
                }
            }

            if ($is_woocommerce) {
                $sells->addSelect('transactions.woocommerce_order_id');
                if (request()->only_woocommerce_sells) {
                    $sells->whereNotNull('transactions.woocommerce_order_id');
                }
            }

            if (!empty(request()->list_for) && request()->list_for == 'service_staff_report') {
                $sells->whereNotNull('transactions.res_waiter_id');
            }

            if (!empty(request()->res_waiter_id)) {
                $sells->where('transactions.res_waiter_id', request()->res_waiter_id);
            }

            if (!empty(request()->input('sub_type'))) {
                $sells->where('transactions.sub_type', request()->input('sub_type'));
            }

            if (!empty(request()->input('created_by'))) {
                $sells->where('transactions.created_by', request()->input('created_by'));
            }

            if (!empty(request()->input('sales_cmsn_agnt'))) {
                $sells->where('transactions.commission_agent', request()->input('sales_cmsn_agnt'));
            }

            if (!empty(request()->input('service_staffs'))) {
                $sells->where('transactions.res_waiter_id', request()->input('service_staffs'));
            }
            $only_shipments = request()->only_shipments == 'true' ? true : false;
            if ($only_shipments && auth()->user()->can('access_shipping')) {
                $sells->whereNotNull('transactions.shipping_status');
            }

            if (!empty(request()->input('shipping_status'))) {
                $sells->where('transactions.shipping_status', request()->input('shipping_status'));
            }
            
            $sells->groupBy('transactions.id');

            if (!empty(request()->suspended)) {
                $with = ['sell_lines'];

                if ($is_tables_enabled) {
                    $with[] = 'table';
                }

                if ($is_service_staff_enabled) {
                    $with[] = 'service_staff';
                }

                $sales = $sells->where('transactions.is_suspend', 1)
                            ->with($with)
                            ->addSelect('transactions.is_suspend', 'transactions.res_table_id', 'transactions.res_waiter_id', 'transactions.additional_notes')
                            ->get();

                return view('sale_pos.partials.suspended_sales_modal')->with(compact('sales', 'is_tables_enabled', 'is_service_staff_enabled'));
            }

            $with[] = 'payment_lines';
            if (!empty($with)) {
                $sells->with($with);
            }

            //$business_details = $this->businessUtil->getDetails($business_id);
            if ($this->businessUtil->isModuleEnabled('subscription')) {
                $sells->addSelect('transactions.is_recurring', 'transactions.recur_parent_id');
            }

            $datatable = Datatables::of($sells)
                ->addColumn(
                    'action',
                    function ($row) use ($only_shipments) {
                        $html = '<div class="btn-group">
                                    <button type="button" class="btn btn-info dropdown-toggle btn-xs" 
                                        data-toggle="dropdown" aria-expanded="false">' .
                                        __("messages.actions") .
                                        '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                                        </span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-left" role="menu">' ;

                        if (auth()->user()->can("sell.view") || auth()->user()->can("direct_sell.access") || auth()->user()->can("view_own_sell_only")) {
                            $html .= '<li><a href="#" data-href="' . action("SellController@show", [$row->id]) . '" class="btn-modal" data-container=".view_modal"><i class="fa fa-external-link" aria-hidden="true"></i> ' . __("messages.view") . '</a></li>';
                        }
                        if (!$only_shipments) {
                            if ($row->is_direct_sale == 0) {
                                if (auth()->user()->can("sell.update")) {
                                    $html .= '<li><a target="_blank" href="' . action('SellPosController@edit', [$row->id]) . '"><i class="glyphicon glyphicon-edit"></i> ' . __("messages.edit") . '</a></li>';
                                }
                            } else {
                                if (auth()->user()->can("direct_sell.access")) {
                                    $html .= '<li><a target="_blank" href="' . action('SellController@edit', [$row->id]) . '"><i class="glyphicon glyphicon-edit"></i> ' . __("messages.edit") . '</a></li>';
                                }
                            }

                            if (auth()->user()->can("direct_sell.delete") || auth()->user()->can("sell.delete")) {
                                $html .= '<li><a href="' . action('SellPosController@destroy', [$row->id]) . '" class="delete-sale"><i class="fa fa-trash"></i> ' . __("messages.delete") . '</a></li>';
                            }
                        }
                        if (auth()->user()->can("sell.view") || auth()->user()->can("direct_sell.access")) {
                            $html .= '<li><a href="#" class="print-invoice" data-href="' . route('sell.printInvoice', [$row->id]) . '"><i class="fa fa-print" aria-hidden="true"></i> ' . __("messages.print") . '</a></li>
                                <li><a href="#" class="print-invoice" data-href="' . route('sell.printInvoice', [$row->id]) . '?package_slip=true"><i class="fa fa-file-text-o" aria-hidden="true"></i> ' . __("lang_v1.packing_slip") . '</a></li>';
                        }
                        if (auth()->user()->can("access_shipping")) {
                            $html .= '<li><a href="#" data-href="' . action('SellController@editShipping', [$row->id]) . '" class="btn-modal" data-container=".view_modal"><i class="fa fa-truck" aria-hidden="true"></i>' . __("lang_v1.edit_shipping") . '</a></li>';
                        }
                        if (!$only_shipments) {
                            $html .= '<li class="divider"></li>';
                            if ($row->payment_status != "paid" && (auth()->user()->can("sell.create") || auth()->user()->can("direct_sell.access")) && auth()->user()->can("sell.payments")) {
                                $html .= '<li><a href="' . action('TransactionPaymentController@addPayment', [$row->id]) . '" class="add_payment_modal"><i class="fa fa-money"></i> ' . __("purchase.add_payment") . '</a></li>';
                            }

                            $html .= '<li><a href="' . action('TransactionPaymentController@show', [$row->id]) . '" class="view_payment_modal"><i class="fa fa-money"></i> ' . __("purchase.view_payments") . '</a></li>';

                            if (auth()->user()->can("sell.create")) {
                                $html .= '<li><a href="' . action('SellController@duplicateSell', [$row->id]) . '"><i class="fa fa-copy"></i> ' . __("lang_v1.duplicate_sell") . '</a></li>

                                <li><a href="' . action('SellReturnController@add', [$row->id]) . '"><i class="fa fa-undo"></i> ' . __("lang_v1.sell_return") . '</a></li>

                                <li><a href="' . action('SellPosController@showInvoiceUrl', [$row->id]) . '" class="view_invoice_url"><i class="fa fa-external-link"></i> ' . __("lang_v1.view_invoice_url") . '</a></li>';
                            }

                            if (auth()->user()->can("send_notification")) {
                                $html .= '<li><a href="#" data-href="' . action('NotificationController@getTemplate', ["transaction_id" => $row->id,"template_for" => "new_sale"]) . '" class="btn-modal" data-container=".view_modal"><i class="fa fa-envelope" aria-hidden="true"></i>' . __("lang_v1.new_sale_notification") . '</a></li>';
                            }
                        }

                        $html .= '</ul></div>';

                        return $html;
                    }
                )
                ->removeColumn('id')
                ->editColumn(
                    'final_total',
                    '<span class="display_currency final-total" data-currency_symbol="true" data-orig-value="{{$final_total}}">{{$final_total}}</span>'
                )
                ->editColumn(
                    'tax_amount',
                    '<span class="display_currency total-tax" data-currency_symbol="true" data-orig-value="{{$tax_amount}}">{{$tax_amount}}</span>'
                )
                ->editColumn(
                    'total_paid',
                    '<span class="display_currency total-paid" data-currency_symbol="true" data-orig-value="{{$total_paid}}">{{$total_paid}}</span>'
                )
                ->editColumn(
                    'total_before_tax',
                    '<span class="display_currency total_before_tax" data-currency_symbol="true" data-orig-value="{{$total_before_tax}}">{{$total_before_tax}}</span>'
                )
                ->editColumn(
                    'discount_amount',
                    function ($row) {
                        $discount = !empty($row->discount_amount) ? $row->discount_amount : 0;

                        if (!empty($discount) && $row->discount_type == 'percentage') {
                            $discount = $row->total_before_tax * ($discount / 100);
                        }

                        return '<span class="display_currency total-discount" data-currency_symbol="true" data-orig-value="' . $discount . '">' . $discount . '</span>';
                    }
                )
                ->editColumn('transaction_date', '{{@format_datetime($transaction_date)}}')
                ->editColumn(
                    'payment_status',
                    function ($row) {
                        $payment_status = Transaction::getPaymentStatus($row);
                        return (string) view('sell.partials.payment_status', ['payment_status' => $payment_status, 'id' => $row->id]);
                    }
                )
                ->editColumn(
                    'types_of_service_name',
                    '<span class="service-type-label" data-orig-value="{{$types_of_service_name}}" data-status-name="{{$types_of_service_name}}">{{$types_of_service_name}}</span>'
                )
                ->addColumn('total_remaining', function ($row) {
                    $total_remaining =  $row->final_total - $row->total_paid;
                    $total_remaining_html = '<span class="display_currency payment_due" data-currency_symbol="true" data-orig-value="' . $total_remaining . '">' . $total_remaining . '</span>';

                    
                    return $total_remaining_html;
                })
                ->addColumn('return_due', function ($row) {
                    $return_due_html = '';
                    if (!empty($row->return_exists)) {
                        $return_due = $row->amount_return - $row->return_paid;
                        $return_due_html .= '<a href="' . action("TransactionPaymentController@show", [$row->return_transaction_id]) . '" class="view_purchase_return_payment_modal"><span class="display_currency sell_return_due" data-currency_symbol="true" data-orig-value="' . $return_due . '">' . $return_due . '</span></a>';
                    }

                    return $return_due_html;
                })
                ->editColumn('invoice_no', function ($row) {
                    $invoice_no = $row->invoice_no;
                    if (!empty($row->woocommerce_order_id)) {
                        $invoice_no .= ' <i class="fa fa-wordpress text-primary no-print" title="' . __('lang_v1.synced_from_woocommerce') . '"></i>';
                    }
                    if (!empty($row->return_exists)) {
                        $invoice_no .= ' &nbsp;<small class="label bg-red label-round no-print" title="' . __('lang_v1.some_qty_returned_from_sell') .'"><i class="fa fa-undo"></i></small>';
                    }
                    if (!empty($row->is_recurring)) {
                        $invoice_no .= ' &nbsp;<small class="label bg-red label-round no-print" title="' . __('lang_v1.subscribed_invoice') .'"><i class="fa fa-recycle"></i></small>';
                    }

                    if (!empty($row->recur_parent_id)) {
                        $invoice_no .= ' &nbsp;<small class="label bg-info label-round no-print" title="' . __('lang_v1.subscription_invoice') .'"><i class="fa fa-recycle"></i></small>';
                    }

                    return $invoice_no;
                })
                ->editColumn('shipping_status', function ($row) use ($shipping_statuses) {
                    $status_color = !empty($this->shipping_status_colors[$row->shipping_status]) ? $this->shipping_status_colors[$row->shipping_status] : 'bg-gray';
                    $status = !empty($row->shipping_status) ? '<a href="#" class="btn-modal" data-href="' . action('SellController@editShipping', [$row->id]) . '" data-container=".view_modal"><span class="label ' . $status_color .'">' . $shipping_statuses[$row->shipping_status] . '</span></a>' : '';
                     
                    return $status;
                })
                ->addColumn('payment_methods', function ($row) use ($payment_types) {
                    $methods = array_unique($row->payment_lines->pluck('method')->toArray());
                    $count = count($methods);
                    $payment_method = '';
                    if ($count == 1) {
                        $payment_method = $payment_types[$methods[0]];
                    } elseif ($count > 1) {
                        $payment_method = __('lang_v1.checkout_multi_pay');
                    }

                    $html = !empty($payment_method) ? '<span class="payment-method" data-orig-value="' . $payment_method . '" data-status-name="' . $payment_method . '">' . $payment_method . '</span>' : '';
                    
                    return $html;
                })
                ->addColumn('meals_no', function ($row) {
                    
                    return $row->sell_lines->where('product.subscription_definition','meal')->sum('quantity');
                    
                })
                ->addColumn('snacks_no', function ($row) {
                    
                    return $row->sell_lines->where('product.subscription_definition','snack')->sum('quantity');
                    
                })
                ->setRowAttr([
                    'data-href' => function ($row) {
                        if (auth()->user()->can("sell.view") || auth()->user()->can("view_own_sell_only")) {
                            return  action('SellController@show', [$row->id]) ;
                        } else {
                            return '';
                        }
                    }]);

            $rawColumns = ['final_total', 'action', 'total_paid', 'total_remaining', 'payment_status', 'invoice_no', 'discount_amount', 'tax_amount', 'total_before_tax', 'shipping_status', 'types_of_service_name', 'payment_methods', 'return_due'];
                
            return $datatable->rawColumns($rawColumns)
                      ->make(true);

        }
          return view('subscription.orders.index');
    }



    public function suspendSubscription($id)
    {
         $item = SubscriptionRegister::find($id);
         $item->date_suspended =  Carbon::parse(Carbon::now()->format('Y-m-d'));
         $item->return_value = ($item->plan_price * 75/100) + 25 ;
         $item->save();
    }

    public function unsuspendSubscription($id)
    {
         $item = SubscriptionRegister::find($id);
         $item->date_suspended =  null;
         $item->return_value = 0;
         $item->save();
    }

    public function pauseSubscription($id)
    {
         $item = SubscriptionRegister::find($id);
         $item->date_paused =  Carbon::parse(Carbon::now()->format('Y-m-d'));
         $item->date_resumed =  null;
         $item->save();
    }


    public function resumeSubscription($id)
    {
         $item = SubscriptionRegister::find($id);
         $item->date_resumed =  Carbon::parse(Carbon::now()->format('Y-m-d'));
         
         $diffDays = $item->date_paused->diffInDays($item->date_resumed, false);
         
         $item->date_end = $item->date_end->addDays($diffDays);
         $item->save();
    }


    public function startSubscription($id)
    {
         $item = SubscriptionRegister::with('plan')->find($id);

         $date_start = Carbon::parse(Carbon::now()->format('Y-m-d'));
         $date_end = $date_start->copy()->addMonth($item->plan->months_no);

         $item->date_start = $date_start;
         $item->date_end = $date_end;

         $item->save();
    }


    public function submitSubscriptionOEXApi(Request $request)
    {

        try{

            $plan_id = $request['plan_id'];

            /*$contact_id = $request['contact_id'];

            $exist_subscription = SubscriptionRegister::where('contact_id',$contact_id)
            ->where('plan_id',$plan_id)->get()
            ->where('IsAvaliable',true)
            ->first();*/

            /*if($exist_subscription != null)
            {
                return [
                    'success' => 0,
                    'msg' => 'You have an active subscribtion.'
                ];
            }*/
            

            $myplan = SubscriptionPlan::find($plan_id);

            $item = new SubscriptionRegister();
            $item->business_id = 1;
            $item->plan_id = $plan_id;
            //$item->contact_id = $contact_id;
            $item->plan_price = $myplan->price;
            $item->payment_method = "cash";
            $item->subscription_method ="online";
            $item->online_submition_date =Carbon::now();
            $item->payment_status ='pending';
            $item->meals_no = $myplan->meals_no;
            $item->snacks_no = $myplan->snacks_no;
            
			$item->client_gender = $request['gender'];
			$item->client_name = $request['name'];
			$item->client_mobile = $request['mobile'];
			$item->client_height = $request['height'];
			$item->client_weight = $request['weight'];
			$item->client_state = $request['state'];
			$item->client_address = $request['address'];
			
            $item->save();
            
            $output = [
                'success' => 1,
                'msg' => "Subscribed"
            ];

        }
        catch(\Exception $e)

        {
            $output = [
                'success' => 0,
                'msg' => $e->getMessage()
            ];

            
        }



        return $this->respond($output);

    }

}

?>




