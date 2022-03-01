@extends('layouts.app')
@section('title', __('lang_v1.gift_vouchers'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1> @lang('lang_v1.gift_vouchers')
    </h1>
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'lang_v1.gift_vouchers', ['gift_vouchers' => __('lang_v1.git_vouchers') ])])
        @if(auth()->user()->can('supplier.create') || auth()->user()->can('customer.create'))
            @slot('tool')
                <div class="box-tools">
                    <button type="button" class="btn btn-block btn-primary btn-modal" 
                    data-href="{{action('GiftVoucherController@create')}}" 
                    data-container=".gift_voucher_modal">
                    <i class="fa fa-plus"></i> @lang('messages.add')</button>
                </div>
            @endslot
        @endif
        @if(auth()->user()->can('supplier.view') || auth()->user()->can('customer.view'))
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="gift_vouchers_table">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.voucher_name')</th>
                            <th>@lang('lang_v1.voucher_cost')</th>
                            <th>@lang('lang_v1.voucher_expire')</th>
                            <th>@lang('lang_v1.customers_count')</th>
                            <th>@lang('lang_v1.sales')</th>
                            <th>@lang('lang_v1.notes')</th>
                            <th>@lang('lang_v1.actions')</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr class="bg-gray font-17 text-center footer-total">
                            <td colspan="4"></td>
                            <td><span class="display_currency" id="sale_total" data-currency_symbol ="true"></span></td>
                            <td colspan="2"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        @endif
    @endcomponent

    <div class="modal fade gift_voucher_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
    </div>
</section>
<!-- /.content -->

@endsection
