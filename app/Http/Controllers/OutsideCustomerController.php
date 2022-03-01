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

class OutsideCustomerController extends Controller
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
    public function index()
    {
        try{
            if (!auth()->user()->can('customer.view')) {
                abort(403, 'Unauthorized action.');
            }
            $business_id = request()->session()->get('user.business_id');
            $customers = DB::table('tbl_outside_customers')
                ->where('business_id',$business_id)
                ->leftJoin('PROVINCE','PROVINCE.PROVINCE_ID','=','tbl_outside_customers.governorate')
                ->leftJoin('AREAS','AREAS.AREA_ID','=','tbl_outside_customers.area')
                ->get();

                if (request()->ajax()) {
                    return Datatables::of($customers)
                        ->editColumn('governorate', '{{implode(array_filter([$PROVINCE_NAME_EN."/".$PROVINCE_NAME_AR,$AREA_NAME_EN."/".$AREA_NAME_AR,$street,$building,$floor,$apartment,$landmark]), ", ")}}')
                        ->addColumn(
                            'actions',
                            '<div class="btn-group">
                                <button type="button" class="btn btn-info dropdown-toggle btn-xs" 
                                    data-toggle="dropdown" aria-expanded="false">' .
                                    __("messages.actions") .
                                    '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                                    </span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu" style="padding:5px">
                                    @can("customer.update")
                                        <li><button class="btn btn-block btn-primary btn-modal" data-href="{{action("OutsideCustomerController@edit",["id" => $id])}}" data-container=".outside_customer_modal"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</button></li>
                                    @endcan
                                    @can("customer.delete")
                                        <li><button href="{{action(\'OutsideCustomerController@destroy\', [$id])}}" class="btn btn-block btn-danger delete_outside_customer_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</button></li>
                                    @endcan
                                </ul>
                            </div>'
                        )
                        ->rawColumns(['governorate','actions'])
                        ->make(true);
                }
            return view('outside_orders.customers.index');
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
        $governorates = DB::table('PROVINCE')->get();
        return view('outside_orders.customers.create')->with(compact('governorates'));
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
        try{
            $business_id = $request->session()->get('user.business_id');
            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }
            $name = $request['name'];
            $mobile = $request['mobile'];
            $email = $request['email'];
            $civil_id = $request['civil_id'];
            $governorate = $request['governorate'];
            $area = $request['area'];
            $street = $request['street'];
            $building = $request['building'];
            $floor = $request['floor'];
            $apartment = $request['apartment'];
            $landmark = $request['landmark'];
            $notes = $request['notes'];
            $insert = DB::table('tbl_outside_customers')
                ->insert([
                    'customer_name' => $name,
                    'customer_phone' => $mobile,
                    'customer_email' => $email,
                    'customer_civil_id' => $civil_id,
                    'business_id' => $business_id,
                    'governorate' => $governorate,
                    'area' => $area,
                    'street' => $street,
                    'building' => $building,
                    'floor' => $floor,
                    'apartment' => $apartment,
                    'landmark' => $landmark,
                    'notes' => $notes
                ]);
            $output = [
                'success' => true,
                'msg' => __("contact.added_success")
            ];
            return $output;
        }catch(\Exception $e){
            return [
                'success' => false,
                'msg' => $e->getMessage(),
            ];
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

        $governorates = DB::table('PROVINCE')->get();
        $customer = DB::table('tbl_outside_customers')
            ->where('id',$id)
            ->first();
        $areas = DB::table('AREAS')
            ->where('PROVINCE_ID',$customer->governorate)
            ->get();
        return view('outside_orders.customers.edit')->with(compact('customer','governorates','areas'));
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
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        try{
            $business_id = $request->session()->get('user.business_id');
            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }
            $name = $request['name'];
            $mobile = $request['mobile'];
            $email = $request['email'];
            $civil_id = $request['civil_id'];
            $governorate = $request['governorate'];
            $area = $request['area'];
            $street = $request['street'];
            $building = $request['building'];
            $floor = $request['floor'];
            $apartment = $request['apartment'];
            $landmark = $request['landmark'];
            $notes = $request['notes'];
            $insert = DB::table('tbl_outside_customers')
                ->where('id',$id)
                ->update([
                    'customer_name' => $name,
                    'customer_phone' => $mobile,
                    'customer_email' => $email,
                    'customer_civil_id' => $civil_id,
                    'business_id' => $business_id,
                    'governorate' => $governorate,
                    'area' => $area,
                    'street' => $street,
                    'building' => $building,
                    'floor' => $floor,
                    'apartment' => $apartment,
                    'landmark' => $landmark,
                    'notes' => $notes
                ]);
            $output = [
                'success' => true,
                'msg' => __("lang_v1.customer_updated")
            ];
            return $output;
        }catch(\Exception $e){
            return [
                'success' => false,
                'msg' => $e->getMessage(),
            ];
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
        //
        try{
            $driver = DB::table('tbl_outside_customers')
                ->where('id',$id)
                ->delete();
            $output = [
                'success' => true,
                'msg' => __("contact.customer_deleted")
            ];
            return $output;
        }catch(\Exception $e){
            $output = [
                'success' => false,
                'msg' => $e->getMessage(),
            ];
            return $output;
        }
    }


    public function getCustomers(Request $request){
        $query_string = $request['q'];
        $data = DB::table('tbl_outside_customers')
            ->where('customer_name','LIKE','%'.$query_string.'%')
            ->orWhere('customer_phone','LIKE','%'.$query_string.'%')
            ->get();
        return response()->json($data, 200);
    }

    public function getAreas(Request $request){
        try{
            $areas = DB::table('AREAS')
            ->where('PROVINCE_ID',$request['pid'])
            ->get();
        return  response()->json($areas, 200);
        }catch(\Exception $e){
            return [];
        }
    }
}
