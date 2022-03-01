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

class DriverController extends Controller
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
        //
        try{
            if (!auth()->user()->can('customer.view')) {
                abort(403, 'Unauthorized action.');
            }
            $business_id = request()->session()->get('user.business_id');
            $drivers = DB::table('tbl_drivers')
                ->where('business_id',$business_id)
                ->get();

                if (request()->ajax()) {
                    return Datatables::of($drivers)
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
                                    <li><button class="btn btn-block btn-primary btn-modal" data-href="{{action("DriverController@edit",["id" => $id])}}" data-container=".driver_modal"><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</button></li>
                                @endcan
                                @can("customer.delete")
                                    <li><button href="{{action(\'DriverController@destroy\', [$id])}}" class="btn btn-block btn-danger delete_driver_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</button></li>
                                @endcan
                            </ul>
                        </div>'
                    )
                    ->rawColumns(['actions'])
                    ->make(true);
                }
            return view('outside_orders.drivers.index');
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
        return view('outside_orders.drivers.create');
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
            $password = $request['password'];
            $comapany = $request['comapany'];
            $civil_id = $request['civil_id'];
            $notes = $request['notes'];
            $insert = DB::table('tbl_drivers')
                ->insert([
                    'driver_name' => $name,
                    'driver_mobile' => $mobile,
                    'driver_email' => $email,
                    'driver_password' => $password,
                    'driver_civil_id' => $civil_id,
                    'driver_company' => $comapany,
                    'driver_notes' => $notes,
                    'business_id' => $business_id,
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
                //'msg' =>__("messages.something_went_wrong")
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
        $driver = DB::table('tbl_drivers')
            ->where('id',$id)
            ->first();
        return view('outside_orders.drivers.edit')->with(compact('driver'));
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
            $password = $request['password'];
            $comapany = $request['comapany'];
            $civil_id = $request['civil_id'];
            $notes = $request['notes'];
            $insert = DB::table('tbl_drivers')
                ->where('id',$id)
                ->update([
                    'driver_name' => $name,
                    'driver_mobile' => $mobile,
                    'driver_email' => $email,
                    'driver_password' => $password,
                    'driver_civil_id' => $civil_id,
                    'driver_company' => $comapany,
                    'driver_notes' => $notes,
                    'business_id' => $business_id,
                ]);
            $output = [
                'success' => true,
                'msg' => __("lang_v1.driver_updated")
            ];
            return $output;
        }catch(\Exception $e){
            return [
                'success' => false,
                'msg' => $e->getMessage(),
                //'msg' =>__("messages.something_went_wrong")
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
        try{
            $driver = DB::table('tbl_drivers')
                ->where('id',$id)
                ->delete();
            $output = [
                'success' => true,
                'msg' => __("lang_v1.driver_deleted")
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

    public function getDrivers(Request $request){
        $query_string = $request['q'];
        $drivers = DB::table('tbl_drivers')
            ->where('driver_name','LIKE','%'.$query_string.'%')
            ->orWhere('driver_mobile','LIKE','%'.$query_string.'%')
            ->get();
        return response()->json($drivers, 200);   
    }
}
