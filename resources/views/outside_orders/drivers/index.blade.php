
@extends('layouts.app')
@section('title', __('lang_v1.drivers'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1> @lang('lang_v1.drivers')
    </h1>
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'lang_v1.drivers', ['drivers' => __('lang_v1.drivers') ])])
        @if(auth()->user()->can('supplier.create') || auth()->user()->can('customer.create'))
            @slot('tool')
                <div class="box-tools">
                    <button type="button" class="btn btn-block btn-primary btn-modal" 
                    data-href="{{action('DriverController@create')}}" 
                    data-container=".driver_modal">
                    <i class="fa fa-plus"></i> @lang('messages.add')</button>
                </div>
            @endslot
        @endif
        @if(auth()->user()->can('supplier.view') || auth()->user()->can('customer.view'))
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="drivers_table">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.driver_name')</th>
                            <th>@lang('contact.mobile')</th>
                            <th>@lang('business.email')</th>
                            {{-- <th>@lang('lang_v1.password')</th> --}}
                            <th>@lang('lang_v1.civil_id')</th>
                            <th>@lang('lang_v1.company')</th>
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

    <div class="modal fade driver_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
    </div>
</section>
<!-- /.content -->

@endsection
