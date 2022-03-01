
@extends('layouts.app')
@section('title', __('lang_v1.outside_customers'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1> @lang('lang_v1.outside_customers')
    </h1>
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'lang_v1.outside_customers', ['outside_customers' => __('lang_v1.outside_customers') ])])
        @if(auth()->user()->can('supplier.create') || auth()->user()->can('customer.create'))
            @slot('tool')
                <div class="box-tools">
                    <button type="button" class="btn btn-block btn-primary btn-modal" 
                    data-href="{{action('OutsideCustomerController@create')}}" 
                    data-container=".outside_customer_modal">
                    <i class="fa fa-plus"></i> @lang('messages.add')</button>
                </div>
            @endslot
        @endif
        @if(auth()->user()->can('supplier.view') || auth()->user()->can('customer.view'))
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="outside_customer_table">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.customer_name')</th>
                            <th>@lang('lang_v1.customer_phone')</th>
                            <th>@lang('lang_v1.customer_email')</th>
                            <th>@lang('lang_v1.address')</th>
                            <th>@lang('lang_v1.actions')</th>
                        </tr>
                    </thead>
                    {{-- <tfoot>
                        <tr class="bg-gray font-17 text-center footer-total">
                            <td><span class="display_currency" id="footer_contact_due" data-currency_symbol ="true"></span></td>
                            <td><span class="display_currency" id="footer_contact_return_due" data-currency_symbol ="true"></span></td>
                            <td></td>
                        </tr>
                    </tfoot> --}}
                </table>
            </div>
        @endif
    @endcomponent

    <div class="modal fade outside_customer_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
    </div>
</section>
<!-- /.content -->

@endsection
