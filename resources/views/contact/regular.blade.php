@extends('layouts.app')
@section('title', __('lang_v1.regular_customers'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1> @lang('lang_v1.regular_customers')
        <small>@lang( 'contact.manage_your_contact', ['contacts' =>  __('lang_v1.regular_customers') ])</small>
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <input type="hidden" value="regular" id="contact_type">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'contact.all_your_contact', ['contacts' => __('lang_v1.regular_customers') ])])
        @if(auth()->user()->can('supplier.create') || auth()->user()->can('customer.create'))
            @slot('tool')
                <div class="box-tools">
                    <button type="button" class="btn btn-block btn-primary btn-modal" 
                        data-href="{{action('ContactController@create', ['type' => 'regular'])}}" 
                        data-container=".contact_modal">
                    <i class="fa fa-plus"></i> @lang('messages.add')</button>
                </div>
            @endslot
        @endif
        @if(auth()->user()->can('supplier.view') || auth()->user()->can('customer.view'))
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="regular_customers_table">
                    <thead>
                        <tr>
                            <th>@lang('user.name')</th>
                            <th>@lang('contact.mobile')</th>
                            <th>@lang('messages.action')</th>
                        </tr>
                    </thead>
                </table>
            </div>
        @endif
    @endcomponent

    <div class="modal fade contact_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
    </div>
    <div class="modal fade pay_contact_due_modal" tabindex="-1" role="dialog" 
        aria-labelledby="gridSystemModalLabel">
    </div>

</section>
<!-- /.content -->

@endsection
