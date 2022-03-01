@extends('layouts.app')


@if(auth()->user()->OEX_SHOW_POSTAB == false)

<script type="text/javascript">
    window.location = "/";
</script>
@endif

	<script type="text/javascript">
    base_path = "{{url('/')}}";
</script>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<title>MENU - TAB POS</title>


<link rel="stylesheet" href="{{ URL::asset('postab/css/9b38b.css')}}" media="all">
<link rel="stylesheet" href="{{ URL::asset('postab/css/dccb7.css')}}" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' id='mkd_google_fonts-css' href='https://fonts.googleapis.com/css?family=Roboto+Slab%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7COswald%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CShadows+Into+Light%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRoboto+Slab%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7COswald%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CPacifico%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CAlike%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CMontserrat%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&subset=latin%2Clatin-ext&ver=1.0.0' type='text/css' media='all'>


	
<script src="{{ URL::asset('postab/js/eff97.js')}}"></script>
<script src="{{ URL::asset('postab/js/864c2.js')}}"></script>
<script src="{{ URL::asset('postab/js/bf1c6.js')}}"></script>
<script src="{{ URL::asset('postab/js/13742.js')}}"></script>
<script src="{{ URL::asset('postab/js/9e5f8.js')}}"></script>
<script src="{{ URL::asset('postab/js/bootstrap.min.js')}}"></script>
	
	
	
			<script src="{{ asset('js/pos.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/printer.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/product.js?v=' . $asset_v) }}"></script>
	<script src="{{ asset('js/opening_stock.js?v=' . $asset_v) }}"></script>
	@include('sale_pos.partials.keyboard_shortcuts')

	<!-- Call restaurant module if defined -->
    @if(in_array('tables' ,$enabled_modules) || in_array('modifiers' ,$enabled_modules) || in_array('service_staff' ,$enabled_modules))
    	<script src="{{ asset('js/restaurant.js?v=' . $asset_v) }}"></script>
    @endif
	
	
	
<script type="text/javascript">
	

        jQuery(function($){
            jQuery('.showCatItems').click(function(){
                var elem = $(this);
				console.log(elem[0]);
var cat_id = elem[0].getAttribute('category-id');
				get_product_suggestion_list_tab(cat_id,"all","1",null);
				
							
                return false;
            });
        });
 
	
        jQuery(function($){
            jQuery('.backtoCats').click(function(){

							var index = $('#mkdf-tabs a[href="#tab-history"]').parent().index();
$('#mkdf-tabs').tabs("option", "active", index );
			
							
                return false;
            });
        });	
	
	
	
	        jQuery(function($){
            jQuery('.gotoCart').click(function(){

							var index = $('#mkdf-tabs a[href="#tab-cousine"]').parent().index();
$('#mkdf-tabs').tabs("option", "active", index );
			
							
                return false;
            });
        });	
	
	
function get_product_suggestion_list_tab(category_id, brand_id, location_id, url = null) {

    if (url == null) {
        url = '/sells/postab/get-product-suggestion';
    }

    $.ajax({
        method: 'GET',
        url: url,
        data: {
            category_id: category_id,
            brand_id: brand_id,
            location_id: location_id,
            
        },
        dataType: 'html',
        success: function(result) {
            $('div#category_product_list').html(result);
			$('#mkdf-tabs').tabs();
			var index = $('#mkdf-tabs a[href="#tab-awards"]').parent().index();
$('#mkdf-tabs').tabs("option", "active", index );
			
           // $('#suggestion_page_loader').fadeOut(700);
        },
    });
}
	
</script>	
<script type="text/javascript">
if( $("nav").hasClass( "fixed-header" ) )
{
  //$( "#category_product_list" ).addClass( "margna" );
}
</script>
<style>
/* resets */
body { margin:0px; padding:0px; }

/* main */
header {
    z-index: 10;
}
.header-banner {
    background-color: #333;
    background-image: url('https://37.media.tumblr.com/8b4969985e84b2aa1ac8d3449475f1af/tumblr_n3iftvUesn1snvqtdo1_1280.jpg');
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 300px;
}
.loadcat {
    padding: 20px;
    text-align: center;
    background: #e9e9e9;
    border: 1px solid #ddd;
    border-radius: 10px;
}
#catcar .mkdf-mg-content-holder {
    padding: 5px;
}
#catcar .mkdf-mg-content-holder h4 {
    font-size: 15px;
}
#category_product_list {
    margin: 30px 0;
}
#mkdf-back-to-top {
    border-radius: 5px;
}
.zrar {
    color: #000;
    border: 0;
    background: #ffd71b;
    font-size: 30px !important;
    display: block !important;
    margin-bottom: 10px;
    padding: 0;
}

.mkdf-header-cart span {
    color: #000 !important;
}	
.mkdf-menu-grid.mkdf-mg-four-cols li:nth-child(2n+1) {
    clear: inherit !important;
}
.mkdf-mobile-header {
    display: block !important;
}	
nav {
    width: 100%;
    height: auto;
    background-image:url({{ URL::asset('postab/img/new-parallax-1.jpg')}});
    z-index: 10;
	direction: ltr;
}

.mkdf-title.mkdf-standard-type.mkdf-has-background.mkdf-has-parallax-background.mkdf-content-center-alignment.mkdf-animation-no.mkdf-title-image-not-responsive.mkdf-has-subtitle.mkdf-subtitle-type-standard.mkdf-has-title-graphic {
    z-index: 999999;
}
.mkdf-menu-carousel-holder.mkdf-carousel-navigation.mkdf-carousel-navigation-light.visible-title {
    margin-bottom: 50px;
}

</style>
	
<script>
/* ========================================== 
scrollTop() >= 300
Should be equal the the height of the header
========================================== */

$(window).scroll(function(){
    if ($(window).scrollTop() >= 300) {
        $('nav').addClass('fixed-header');
        $('nav div').addClass('visible-title');
		$( "#category_product_list").addClass( "margna" );
    }
    else {
        $('nav').removeClass('fixed-header');
        $('nav div').removeClass('visible-title');
		$( "#category_product_list" ).removeClass( "margna" );
    }
});

$(document).ready(function(){
  $("#hide").click(function(){
    $("#alldiv").hide();
  });
  $("#show").click(function(){
    $("#alldiv").show();
  });
});
	
</script>
	
<style>
	.sticky { position: fixed; top: 0; width: 100%; }
	#mkdf-tabs { border: 0 !important;}
	.ui-tabs { margin: -30px; }
</style>
</head>

<body class="page-template-default page page-id-1468 mkd-core-1.0 mkd-restaurant-1.0 piquant-ver-1.1 mkdf-smooth-scroll mkdf-header-standard mkdf-sticky-header-on-scroll-up mkdf-default-mobile-header mkdf-sticky-up-mobile-header mkdf-dropdown-default mkdf-light-header mkdf-header-standard-border-disable mkdf-top-bar-with-border mkdf-top-bar-in-grid mkdf-overlapping-content-enabled mkdf-side-menu-slide-with-content mkdf-width-370 wpb-js-composer js-comp-ver-6.0.5 vc_responsive">

	

  <!-- Modal -->
  <div class="modal fade" id="modalcart" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">My Cart</h4>
        </div>
        <div class="modal-body">
          <div class="@if(!empty($pos_settings['hide_product_suggestion']) && !empty($pos_settings['hide_recent_trans'])) col-md-10 col-md-offset-1 @else col-md-11 @endif col-sm-12">
			@component('components.widget', ['class' => 'box-success'])
				@slot('header')
					<div class="col-sm-6">
						<h3 class="box-title">POS Terminal <i class="fa fa-keyboard-o hover-q text-muted" aria-hidden="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="@include('sale_pos.partials.keyboard_shortcuts_details')" data-html="true" data-trigger="hover" data-original-title="" title=""></i></h3>
					</div>
					<div class="col-sm-6">
						<p class="text-right"><strong>@lang('sale.location'):</strong> {{$default_location->name}}</p>
					</div>
					<input type="hidden" id="item_addition_method" value="{{$business_details->item_addition_method}}">
				@endslot
				{!! Form::open(['url' => action('SellPosController@store'), 'method' => 'post', 'id' => 'add_pos_sell_form' ]) !!}

				{!! Form::hidden('location_id', $default_location->id, ['id' => 'location_id', 'data-receipt_printer_type' => !empty($default_location->receipt_printer_type) ? $default_location->receipt_printer_type : 'browser', 'data-default_accounts' => $default_location->default_payment_accounts]); !!}

				<!-- /.box-header -->
				<div class="box-body">
					<div class="row">
						@if(!empty($pos_settings['enable_transaction_date']))
							<div class="col-md-4 col-sm-6">
								<div class="form-group">
									{!! Form::label('transaction_date', __('sale.sale_date') . ':*') !!}
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
										{!! Form::text('transaction_date', $default_datetime, ['class' => 'form-control', 'readonly', 'required']); !!}
									</div>
								</div>
							</div>
						@endif
						@if(config('constants.enable_sell_in_diff_currency') == true)
							<div class="col-md-4 col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-exchange"></i>
										</span>
										{!! Form::text('exchange_rate', config('constants.currency_exchange_rate'), ['class' => 'form-control input-sm input_number', 'placeholder' => __('lang_v1.currency_exchange_rate'), 'id' => 'exchange_rate']); !!}
									</div>
								</div>
							</div>
						@endif
						@if(!empty($price_groups) && count($price_groups) > 1)
							<div class="col-md-4 col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-money"></i>
										</span>
										@php
											reset($price_groups);
											$selected_price_group = !empty($default_price_group_id) && array_key_exists($default_price_group_id, $price_groups) ? $default_price_group_id : null;
										@endphp
										{!! Form::hidden('hidden_price_group', key($price_groups), ['id' => 'hidden_price_group']) !!}
										{!! Form::select('price_group', $price_groups, $selected_price_group, ['class' => 'form-control select2', 'id' => 'price_group', 'style' => 'width: 100%;']); !!}
										<span class="input-group-addon">
											@show_tooltip(__('lang_v1.price_group_help_text'))
										</span> 
									</div>
								</div>
							</div>
						@else
							@php
								reset($price_groups);
							@endphp
							{!! Form::hidden('price_group', key($price_groups), ['id' => 'price_group']) !!}
						@endif
						@if(!empty($default_price_group_id))
							{!! Form::hidden('default_price_group', $default_price_group_id, ['id' => 'default_price_group']) !!}
						@endif

						@if(in_array('types_of_service', $enabled_modules) && !empty($types_of_service))
							<div class="col-md-4 col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-external-link text-primary service_modal_btn"></i>
										</span>
										{!! Form::select('types_of_service_id', $types_of_service, null, ['class' => 'form-control', 'id' => 'types_of_service_id', 'style' => 'width: 100%;', 'placeholder' => __('lang_v1.select_types_of_service')]); !!}

										{!! Form::hidden('types_of_service_price_group', null, ['id' => 'types_of_service_price_group']) !!}

										<span class="input-group-addon">
											@show_tooltip(__('lang_v1.types_of_service_help'))
										</span> 
									</div>
									<small><p class="help-block hide" id="price_group_text">@lang('lang_v1.price_group'): <span></span></p></small>
								</div>
							</div>
							<div class="modal fade types_of_service_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel"></div>
						@endif

						@if(in_array('subscription', $enabled_modules))
							<div class="col-md-4 pull-right col-sm-6">
								<div class="checkbox">
									<label>
						              {!! Form::checkbox('is_recurring', 1, false, ['class' => 'input-icheck', 'id' => 'is_recurring']); !!} @lang('lang_v1.subscribe')?
						            </label><button type="button" data-toggle="modal" data-target="#recurringInvoiceModal" class="btn btn-link"><i class="fa fa-external-link"></i></button>@show_tooltip(__('lang_v1.recurring_invoice_help'))
								</div>
							</div>
						@endif
					</div>
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
					@include('sale_pos.partials.pos_details')

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
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<div class="mkdf-wrapper">
<div class="mkdf-wrapper-inner">


<header class="mkdf-mobile-header">
<div class="mkdf-mobile-header-inner">
<div class="mkdf-mobile-header-holder">
<div class="mkdf-grid">
<div class="mkdf-vertical-align-containers">

<div class="mkdf-mobile-menu-opener">
<div class="mkdf-shopping-cart-outer">
<div class="mkdf-shopping-cart-inner">
<div class="mkdf-shopping-cart-header">
<a class="mkdf-header-cart" href="#">
<span class="mkdf-cart-label" data-toggle="modal" data-target="#modalcart">Cart</span>
<img style="height: 24px;margin-top: -5px; cursor: pointer;" src="http://pos.healthstudiokuwait.com/postab/cart_white_x2.png"  data-toggle="modal" data-target="#modalcart">

</a>


</div>
</div>
</div>
</div>


<div class="mkdf-position-center">
<div class="mkdf-position-center-inner">
<div class="mkdf-mobile-logo-wrapper">
<a href="#" style="height: 40px">
<img src="http://pos.healthstudiokuwait.com/uploads/business_logos/1579593370_hs_logo.png" alt="mobile-logo">
</a>
</div>
</div>
</div>
<div class="mkdf-position-right">
<div class="mkdf-position-right-inner">
</div>
</div>
</div> 
</div>
</div>

</div>
</header> 
<div id='mkdf-back-to-top' >
	<button class="zrar fa fa-eye-slash" id="hide"></button>
    <button class="zrar fa fa-eye" id="show"></button>
<img style="height: 24px;margin-top: -5px; cursor: pointer;" src=http://pos.healthstudiokuwait.com/postab/cart_white_x2.png  data-toggle="modal" data-target="#modalcart">
</div>
<div class="mkdf-content" style="margin-top: -146px">
<div class="mkdf-content-inner">

<div id="alldiv" class="mkdf-title mkdf-standard-type mkdf-preload-background mkdf-has-background mkdf-has-parallax-background mkdf-content-center-alignment mkdf-animation-no mkdf-title-image-not-responsive mkdf-has-subtitle mkdf-subtitle-type-standard mkdf-has-title-graphic" style="background-image:url(https://piquant.mikado-themes.com/wp-content/uploads/2015/11/title-img-1.jpg);height:538px;;border-bottom: none" data-height="538" data-background-width="&quot;1920&quot;">

	
<div id="catcar" data-mkdf-parallax-speed="1" class="vc_row wpb_row vc_row-fluid mkdf-section vc_custom_1446567776039 mkdf-content-aligment-center mkdf-parallax-section-holder mkdf-parallax-section-holder-touch-disabled mkdf-grid-section" style="background-image:url(https://piquant.mikado-themes.com/wp-content/uploads/2015/11/parallax-1.jpg);">
	<nav>
<div class="clearfix mkdf-section-inner">
<div class="mkdf-section-inner-margin clearfix">
<div class="wpb_column vc_column_container vc_col-sm-12"><div class="vc_column-inner">
<div class="wpb_wrapper">
<div class="vc_empty_space" style="height: 12px">
<span class="vc_empty_space_inner"></span>
</div>

<div class="mkdf-menu-carousel-holder mkdf-carousel-navigation mkdf-carousel-navigation-light">
<ul class="mkdf-menu-carousel">

@if(!empty($categories))

			@foreach($categories as $category)
	
	
	
<li>
<div class="mkdf-mg-image-holder">
<a href="#" data-rel="prettyPhotoMenuGrid2158">
<img class="showCatItems" category-id="{{$category['id']}}" width="734" height="428" src="{{ URL::asset('postab/img/' . $category['id'] . '.jpg')}}" alt="{{$category['id']}}" sizes="(max-width: 734px) 100vw, 734px" />
<span class="showCatItems"></span>
</a>
</div>
<div class="mkdf-mg-content-holder">
<div class="mkdf-mg-title-holder">
<h4 class="mkdf-mg-title"><a class="showCatItems" href="#" category-id="{{$category['id']}}" >{{$category['name']}}</a></h4>
</div>
</div>
</li>
	

@endforeach

@endif	
	
									 
</ul>

</div>


	
<div class="vc_empty_space" style="height: 5px"><span class="vc_empty_space_inner"></span></div></div></div></div></div></div></div>
</div>
</div> 
</div> 
</div>


</div>
</div> 
</div> 

	
<div class="mkdf-container-inner clearfix">
<div class="vc_row wpb_row vc_row-fluid mkdf-section vc_custom_1447758330295 mkdf-content-aligment-left">
<div class="clearfix mkdf-full-section-inner">
<div class="wpb_column vc_column_container vc_col-sm-12">
<div class="vc_column-inner">
<div class="wpb_wrapper">
      <div class="mkdf-menu-grid mkdf-mg-four-cols">
		<div id="category_product_list">
			<span class="loadcat" ><i class="fato fa fa-mouse-pointer"></i> Click on any category to view Menu</span>
		</div>	
		</div>
		</div>	
		</div>
		</div>	
		</div>
		</div>	
		</div>
<footer>
<div class="mkdf-footer-inner clearfix">

<div class="mkdf-footer-bottom-holder">
<div class="mkdf-footer-bottom-holder-inner">
<div class="mkdf-container">
<div class="mkdf-container-inner">
<div class="mkdf-two-columns-50-50 clearfix">
<div class="mkdf-two-columns-50-50-inner">
<div class="mkdf-column">
<div class="mkdf-column-inner">
<div id="text-4" class="widget mkdf-footer-bottom-left widget_text"> <div class="textwidget"><a style="color: #ffffff;" target="_blank" rel="noopener noreferrer">Copyrights © Health Studio</a></div>
</div> </div>
</div>
</div>
</div> </div>
</div>
</div>
</div>
</div>
</footer>
</div> 
</div> 
<div class="rbt-toolbar" data-theme="Piquant" data-featured="" data-button-position="30%" data-button-horizontal="right" data-button-alt="no">
</div>


<script type='text/javascript'>
/* <![CDATA[ */
var mkdfGlobalVars = {"vars":{"mkdfAddForAdminBar":0,"mkdfElementAppearAmount":-150,"mkdfFinishedMessage":"No more posts","mkdfMessage":"Loading new posts...","mkdfTopBarHeight":51,"mkdfStickyHeaderHeight":60,"mkdfStickyHeaderTransparencyHeight":60,"mkdfLogoAreaHeight":0,"mkdfMenuAreaHeight":146,"mkdfMobileHeaderHeight":100}};
var mkdfPerPageVars = {"vars":{"mkdfStickyScrollAmount":0,"mkdfHeaderTransparencyHeight":0}};
/* ]]> */
</script>




</body>
</html>



