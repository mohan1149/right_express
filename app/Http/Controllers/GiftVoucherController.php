<?php

namespace App\Http\Controllers;

use App\GiftVoucher;
use App\Contact;
use Illuminate\Http\Request;
use DB;

use Yajra\DataTables\Facades\DataTables;

class GiftVoucherController extends Controller
{
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
            $giftVouchers = DB::table('gift_vouchers')
                ->leftJoin('gift_vouchers_redeems','gift_vouchers.id','=','gift_vouchers_redeems.gift_voucher_id')
                ->groupBy('gift_vouchers.id')
                ->select([
                    'voucher_name',
                    'voucher_value',
                    'expire_date',
                    DB::raw('count(gift_vouchers_redeems.id) as count'),
                    'notes',
                    'gift_vouchers.id as id'
                ])
                ->where('gift_vouchers.business_id',$business_id)
                ->get();
                if (request()->ajax()) {
                    return Datatables::of($giftVouchers)
                        ->addColumn('voucher_value',
                        '<span class="display_currency" data-currency_symbol="true" data-orig-value="{{ $voucher_value }}">{{ $voucher_value }}</span>',
                        )
                        ->editColumn('sale',
                        '<span class="display_currency voucher_value" data-currency_symbol="true" data-orig-value="{{ $count * $voucher_value }}">{{ $count * $voucher_value }}</span>',
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
                                    <li><a class="btn-modal" data-href="{{action("GiftVoucherController@show",["id" => $id])}}" data-container=".gift_voucher_modal" ><i class="glyphicon glyphicon-user"></i> @lang("lang_v1.assign")</a></li>
                                        @endcan
                                    @can("sell.update")
                                        <li><a class="btn-modal" data-href="{{action("GiftVoucherController@edit",["id" => $id])}}" data-container=".gift_voucher_modal" ><i class="glyphicon glyphicon-edit"></i> @lang("messages.edit")</a></li>
                                    @endcan
                                    @can("customer.delete")
                                        <li><a href="{{action(\'GiftVoucherController@destroy\', [$id])}}" class="delete_gift_voucher_button"><i class="glyphicon glyphicon-trash"></i> @lang("messages.delete")</a></li>
                                    @endcan
                                </ul>
                            </div>'
                        )
                        ->rawColumns(['voucher_value','sale','actions'])
                        ->make(true);
                }
            return view('gift.index');
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
        //
        return view('gift.create');
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
            $input['business_id'] = $request->session()->get('user.business_id');
            $input['voucher_name'] = $request['name'];
            $input['voucher_value'] = $request['voucher_cost'];
            $input['expire_date'] = $request['voucher_expire'];
            $input['notes'] = $request['notes'];
            DB::table('gift_vouchers')
                ->insert($input);
            return [
                'success' => true,
                'msg' => __("lang_v1.gift_added")
            ];
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
     * @param  \App\GiftVoucher  $giftVoucher
     * @return \Illuminate\Http\Response
     */
    public function show(GiftVoucher $giftVoucher)
    {
        //
        return view('gift.show',['giftVoucher'=>$giftVoucher]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\GiftVoucher  $giftVoucher
     * @return \Illuminate\Http\Response
     */
    public function edit(GiftVoucher $giftVoucher)
    {
        //
        return view('gift.edit',['giftVoucher'=>$giftVoucher]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\GiftVoucher  $giftVoucher
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GiftVoucher $giftVoucher)
    {
        //
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        try{
            $input['business_id'] = $request->session()->get('user.business_id');
            $input['voucher_name'] = $request['name'];
            $input['voucher_value'] = $request['voucher_cost'];
            $input['expire_date'] = $request['voucher_expire'];
            $input['notes'] = $request['notes'];
            DB::table('gift_vouchers')
                ->where('id',$giftVoucher->id)
                ->update($input);
            return [
                'success' => true,
                'msg' => __("lang_v1.gift_updated")
            ];
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
     * @param  \App\GiftVoucher  $giftVoucher
     * @return \Illuminate\Http\Response
     */
    public function destroy(GiftVoucher $giftVoucher)
    {
        //
        try{
            DB::table('gift_vouchers')
                ->where('id',$giftVoucher->id)
                ->delete();
                return([
                    'success' => true,
                    'msg' => __("lang_v1.gift_deleted")
                ]);
        }catch(\Exception $e){
            return([
                'success' => false,
                'msg' => $e->getMessage(),
            ]);
        }
    }

    public function assignVoucher(Request $request){
        try{
            $input['business_id'] = $request->session()->get('user.business_id');
            $input['customer_id'] = $request['contact_id'];
            $input['to_contact_id'] = $request['to_contact_id'];
            $input['gift_voucher_id'] = $request['voucher_id'];
            DB::table('gift_vouchers_redeems')
                ->insert($input);
                return([
                    'success' => true,
                    'msg' => __("lang_v1.gift_assigned")
                ]);
        }catch(\Exception $e){
            return([
                'success' => false,
                'msg' => $e->getMessage(),
            ]);
        }
    }

    public function giftRedeems(Request $request){
        try{
            if (!auth()->user()->can('customer.view')) {
                abort(403, 'Unauthorized action.');
            }
            $business_id = request()->session()->get('user.business_id');
            $giftVouchers = GiftVoucher::where('gift_vouchers.business_id',$business_id)
                ->join('gift_vouchers_redeems','gift_vouchers_redeems.gift_voucher_id','=','gift_vouchers.id')
                ->join('contacts','gift_vouchers_redeems.customer_id','=','contacts.id')
                ->select([
                    'gift_vouchers_redeems.id as id',
                    'contacts.id as cid',
                    'contacts.name as customer_name',
                    'voucher_value',
                    'voucher_name',
                    'expire_date',
                    'redeemed',
                    'to_contact_id',
                    'added_on',
                    'name as to_name',
                ])
                ->get();
                if (request()->ajax()) {
                    return Datatables::of($giftVouchers)
                        ->editColumn('to_contact_id',function($data){
                                $to = Contact::find($data->to_contact_id);
                                $name = $to['name'];
                                return $name;
                            }
                        )
                        ->editColumn('expire_date',
                            '{{ date("Y-m-d") > $expire_date ? __("lang_v1.expired") : __("lang_v1.valid") }}'
                        )
                        ->editColumn('voucher_value',
                            '<span class="display_currency voucher_value" data-currency_symbol="true" data-orig-value="{{$voucher_value}}">{{$voucher_value}}</span>'
                        )
                        ->editColumn('redeemed',
                            '<span class="display_currency redeemed" data-currency_symbol="true" data-orig-value="{{$redeemed}}">{{$redeemed}}</span>'
                        )
                        ->addColumn('left',
                            '<span class="display_currency gift-left" data-currency_symbol="true" data-orig-value="{{$voucher_value - $redeemed}}">{{$voucher_value - $redeemed}}</span>'
                        )
                        ->addColumn(
                            'actions',
                            '<div>
                                <button {{$voucher_value - $redeemed == 0 ? "disabled":""}} {{ date("Y-m-d") > $expire_date ? "disabled" : "" }} class="btn btn-primary btn-modal" data-href="/redeem-form/{{ $id }}/{{$voucher_value - $redeemed}}" data-container=".gift_voucher_modal">{{ __("lang_v1.redeem") }}</button>
                                <button href="/delete-redeem/{{ $id }}" class="btn btn-danger delete_redeem_button"> @lang("messages.delete")</button>
                            </di>',
                        )
                        ->rawColumns(['to_contact_id','expire_date','redeemed','voucher_value','left','actions'])
                        ->make(true);
                }
            return view('gift.redeems');
        }catch(\Exception $e){
            return $e->getMessage();
        }
    }

    public function redeemForm(Request $request){
        $data['id'] = $request['id'];
        $data['left'] = $request['left'];
        return view('gift.redeem',['data'=>$data]);
    }
    public function redeemVoucher(Request $request){
        $id = $request['id'];
        $cost = $request['redeem_cost'];
        $left = $request['left'];
        try{
            if($cost > $left){
                return([
                    'success' => false,
                    'msg' => __('lang_v1.redemm_amt_shld_less_than_left'),
                ]);
            }
            DB::table('gift_vouchers_redeems')
                ->where('id',$id)
                ->increment('redeemed',$cost);
                return([
                    'success' => true,
                    'msg' => __("lang_v1.gift_redeemed")
                ]);
        }catch(\Exception $e){
            return([
                'success' => false,
                'msg' => $e->getMessage(),
            ]);
        }

    }

    public function deleteRedeem(Request $request){
        try{
            DB::table('gift_vouchers_redeems')
                ->where('id',$request['id'])
                ->delete();
                return([
                    'success' => true,
                    'msg' => __("lang_v1.gift_deleted")
                ]);
        }catch(\Exception $e){
            return([
                'success' => false,
                'msg' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Display the valletForm.
     *
     * @param  Request  $request
     * @return View
     */
    public function valletForm(Request $request){
        return view('gift.vallet');
    }

    public function addVallet(Request $request){
        try{
            $input['business_id'] = $request->session()->get('user.business_id');
            $input['contact_id'] = $request['contact_id'];
            $input['credit_amount'] = $request['vallet_credit'];
            $input['notes'] = $request['notes'];
            DB::table('vallet')
                ->insert($input);
            $contact = Contact::find($input['contact_id']);
            $print_data = [
                'name'=> $contact->name,
                'amount'=> $input['credit_amount'],
                'notes' => $input['notes'],
            ];
                return([
                    'success' => true,
                    'msg' => __("lang_v1.vallet_added"),
                    'html_content' => view('gift.print', compact('print_data'))->render(),
                ]);
        }catch(\Exception $e){
            return([
                'success' => false,
                'msg' => $e->getMessage(),
            ]);
        }
    }

    public function getVallet(Request $request){
        try{
            $business_id = request()->session()->get('user.business_id');
            $vallets = DB::table('vallet')
                ->where('vallet.business_id',$business_id)
                ->join('contacts','contacts.id','=','vallet.contact_id')
                ->select([
                    'vallet.id as id',
                    'name',
                    'mobile',
                    'credit_amount',
                    'added_on',
                    'notes',
                ])
                ->get();
            return view('gift.valletList',['vallets'=>$vallets]);
        }catch(\Exception $e){
            return $e->getMessage();
        }
    }

    public function deleteWallet(Request $request){
        try{
            DB::table('vallet')
                ->where('id',$request['wid'])
                ->delete();
                return([
                    'success' => true,
                    'msg' => __("lang_v1.wallet_done")
                ]);
        }catch(\Exception $e){
            return([
                'success' => false,
                'msg' => $e->getMessage(),
            ]);
        }
    }
}
