@extends('layouts.app')

@section('title', 'POS')

@section('content')
<style>
.col-md-12.no-print.pos-header {
    float: left;
}
.lockscreen.pace-done {
    background:#fafafa;
}
.logohead img {
    width: 200px;
    padding: 10px;
}
.logohead {
    margin: -8px 20px 10px 0;
    background: #fff;
    width: 220px;
    padding: 5px 10px;
    border-bottom: 1px solid #ddd;
    border-radius: 10px;
}
.product_box .image-container img {
    height: auto !important;
    width: 190px !important;
}
.product_box .image-container {
    height: 139px !important;
    border-radius: 0px !important;
}
.text.text-muted.text-uppercase {
    margin-top: 15px !important;
}
.bg-gray {
background-color: #f4f4f4 !important;
}
.restleft {
    float: left;
}
.sub_unit {
    display: none;
}

#close_register {
    display: none;
}
#full_screen {
    display: none;
}
#register_details {
    display: none;
}
</style>

<!-- Main content -->
<div class="logohead"><img src="http://pos.healthstudiokuwait.com/uploads/business_logos/1579593370_hs_logo.png" /></div>
<section class="content no-print">

		<div class="col-md-5 col-sm-12">
			@include('sale_pos.partials.right_tab_div')
		</div>

	@if(!empty($pos_settings['allow_overselling']))
		<input type="hidden" id="is_overselling_allowed">
	@endif
	@if(session('business.enable_rp') == 1)
        <input type="hidden" id="reward_point_enabled">
    @endif
	<div class="row">
		<div class="@if(!empty($pos_settings['hide_product_suggestion']) && !empty($pos_settings['hide_recent_trans'])) col-md-10 col-md-offset-1 @else col-md-7 @endif col-sm-12">
			@component('components.widget', ['class' => 'box-success'])
				@slot('header')


					<input type="hidden" id="item_addition_method" value="{{$business_details->item_addition_method}}">
				@endslot
				{!! Form::open(['url' => action('SellPosController@store'), 'method' => 'post', 'id' => 'add_pos_sell_form' ]) !!}

				{!! Form::hidden('location_id', $default_location->id, ['id' => 'location_id', 'data-receipt_printer_type' => !empty($default_location->receipt_printer_type) ? $default_location->receipt_printer_type : 'browser', 'data-default_accounts' => $default_location->default_payment_accounts]); !!}

				<!-- /.box-header -->
				<div class="box-body">
					<div class="row">
						<div class="@if(!empty($commission_agent)) col-sm-4 @else col-sm-6 @endif">
							<div class="form-group" style="width: 100% !important">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-user"></i>
									</span>
									<input type="hidden" id="default_customer_id" 
									value="{{ $walk_in_customer['id']}}" >
									<input type="hidden" id="default_customer_name" 
									value="{{ $walk_in_customer['name']}}" >
									{!! Form::select('contact_id', 
										[], null, ['class' => 'form-control mousetrap', 'id' => 'customer_id', 'placeholder' => 'Enter Customer name / phone', 'required', 'style' => 'width: 100%;']); !!}
									<span class="input-group-btn">
										<button type="button" class="btn btn-default bg-white btn-flat add_new_customer" data-name=""  @if(!auth()->user()->can('customer.create')) disabled @endif><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
									</span>
								</div>
							</div>
						</div>
						<input type="hidden" name="pay_term_number" id="pay_term_number" value="{{$walk_in_customer['pay_term_number']}}">
						<input type="hidden" name="pay_term_type" id="pay_term_type" value="{{$walk_in_customer['pay_term_type']}}">
						
						@if(!empty($commission_agent))
							<div class="col-sm-4">
								<div class="form-group">
								{!! Form::select('commission_agent', 
											$commission_agent, null, ['class' => 'form-control select2', 'placeholder' => __('lang_v1.commission_agent')]); !!}
								</div>
							</div>
						@endif

						<div class="@if(!empty($commission_agent)) col-sm-4 @else col-sm-6 @endif">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default bg-white btn-flat" data-toggle="modal" data-target="#configure_search_modal" title="{{__('lang_v1.configure_product_search')}}"><i class="fa fa-barcode"></i></button>
									</div>
									{!! Form::text('search_product', null, ['class' => 'form-control mousetrap', 'id' => 'search_product', 'placeholder' => __('lang_v1.search_product_placeholder'),
									'disabled' => is_null($default_location)? true : false,
									'autofocus' => is_null($default_location)? false : true,
									]); !!}
									<span class="input-group-btn">
										<button type="button" class="btn btn-default bg-white btn-flat pos_add_quick_product" data-href="{{action('ProductController@quickAdd')}}" data-container=".quick_add_product_modal"><i class="fa fa-plus-circle text-primary fa-lg"></i></button>
									</span>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>

						<!-- Call restaurant module if defined -->
				        @if(in_array('tables' ,$enabled_modules) || in_array('service_staff' ,$enabled_modules))
				        	<span id="restaurant_module_span">
				          		<div class="col-md-3"></div>
				        	</span>
				        @endif
			        </div>

					<div class="row">
					<div class="col-sm-12 pos_product_div">
						<input type="hidden" name="sell_price_tax" id="sell_price_tax" value="{{$business_details->sell_price_tax}}">

						<!-- Keeps count of product rows -->
						<input type="hidden" id="product_row_count" 
							value="0">
						@php
							$hide_tax = '';
							if( session()->get('business.enable_inline_tax') == 0){
								$hide_tax = 'hide';
							}
						@endphp
						<table class="table table-condensed table-bordered table-striped table-responsive" id="pos_table">
							<thead>
								<tr>
									<th class="tex-center @if(!empty($pos_settings['inline_service_staff'])) col-md-3 @else col-md-4 @endif">	
										@lang('sale.product') @show_tooltip(__('lang_v1.tooltip_sell_product_column'))
									</th>
									<th class="text-center col-md-3">
										@lang('sale.qty')
									</th>
									@if(!empty($pos_settings['inline_service_staff']))
										<th class="text-center col-md-2">
											@lang('restaurant.service_staff')
										</th>
									@endif
									<th class="text-center col-md-2 {{$hide_tax}}">
										@lang('sale.price_inc_tax')
									</th>
									<th class="text-center col-md-2">
										@lang('sale.subtotal')
									</th>
									<th class="text-center"><i class="fa fa-close" aria-hidden="true"></i></th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						</div>
					</div>
					@include('sale_pos.partials.pos_details_tab')

					@include('sale_pos.partials.payment_modal')

					@if(empty($pos_settings['disable_suspend']))
						@include('sale_pos.partials.suspend_note_modal')
					@endif

					@if(empty($pos_settings['disable_recurring_invoice']))
						@include('sale_pos.partials.recurring_invoice_modal')
					@endif
				</div>
				<!-- /.box-body -->
				{!! Form::close() !!}
			@endcomponent
		</div>


	</div>
</section>

<!-- This will be printed -->
<section class="invoice print_section" id="receipt_section">
</section>
<div class="modal fade contact_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	@include('contact.create', ['quick_add' => true])
</div>
<!-- /.content -->
<div class="modal fade register_details_modal" tabindex="-1" role="dialog" 
	aria-labelledby="gridSystemModalLabel">
</div>
<div class="modal fade close_register_modal" tabindex="-1" role="dialog" 
	aria-labelledby="gridSystemModalLabel">
</div>
<!-- quick product modal -->
<div class="modal fade quick_add_product_modal" tabindex="-1" role="dialog" aria-labelledby="modalTitle"></div>

@include('sale_pos.partials.configure_search_modal')

@stop

@section('javascript')
	<script src="{{ asset('js/pos.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/printer.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/product.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/opening_stock.js?v=' . $asset_v) }}"></script>
	@include('sale_pos.partials.keyboard_shortcuts')

	<!-- Call restaurant module if defined -->
    @if(in_array('tables' ,$enabled_modules) || in_array('modifiers' ,$enabled_modules) || in_array('service_staff' ,$enabled_modules))
    	<script src="{{ asset('js/restaurant.js?v=' . $asset_v) }}"></script>
    @endif
@endsection
