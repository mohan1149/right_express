@extends('layouts.app')
@section('title', __('lang_v1.outside_orders'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header no-print">
    <h1> @lang('lang_v1.outside_orders')
        <small>@lang( 'lang_v1.manage_outside_ordres', ['outside_orders' =>  __('lang_v1.outside_orders') ])</small>
    </h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section>

<!-- Main content -->
<section class="content no-print">
    {{-- <input type="hidden" value="{{$type}}" id="contact_type"> --}}
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'contact.all_your_contact', ['contacts' => __('lang_v1.outside_orders') ])])
        <div class="form-group">
            {!! Form::label('sell_list_filter_date_range', __('report.date_range') . ':') !!}
            {!! Form::text('outside_order_list_filter_date_range', null, ['placeholder' => __('lang_v1.select_a_date_range'), 'class' => 'form-control outside_order_list_filter_date_range', 'readonly']); !!}
        </div>
        @if(auth()->user()->can('supplier.create') || auth()->user()->can('customer.create'))
            @slot('tool')
                
            @endslot
        @endif
        @if(auth()->user()->can('supplier.view') || auth()->user()->can('customer.view'))
            <div class="table-responsive">
                <table class="table table-bordered table-striped"  id="outside_orders_table">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.invoice_no')</th>
                            <th>@lang('lang_v1.customer_name')</th>
                            <th>@lang('lang_v1.driver_name')</th>
                            <th>@lang('lang_v1.status')</th>
                            <th>@lang('lang_v1.payment_type')</th>
                            <th>@lang('lang_v1.order_date')</th>
                            <th>@lang('lang_v1.final_total')</th>
                            <th>@lang('lang_v1.actions')</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr class="bg-gray font-17 text-center footer-total">
                            <td colspan="6">@lang('lang_v1.order_total')</td>
                            <td><span class="display_currency" id="footer_outside_order_total" data-currency_symbol ="true"></span></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        @endif
    @endcomponent
    <div class="modal fade update_order_status_modal" tabindex="-1" role="dialog" 
        aria-labelledby="gridSystemModalLabel">
    </div>
    <div class="modal fade view_outside_order_modal" tabindex="-1" role="dialog" 
        aria-labelledby="gridSystemModalLabel">
    </div>
    

</section>

<!-- This will be printed -->
<!-- <section class="invoice print_section" id="receipt_section">
</section> -->
<!-- /.content -->

@endsection

