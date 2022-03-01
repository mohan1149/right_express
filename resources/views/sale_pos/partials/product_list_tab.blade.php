<ul class="mkdf-mg-holder clearfix">	

<script>
	        jQuery(function($){
            jQuery('.product_box_OEX').click(function(){
        if ($('input#location_id').val() == '') {
            toastr.warning(LANG.select_location);
        } else {
			
            pos_product_row($(this)[0].getAttribute('variation_id'));
        }
							
                return false;
            });
        });
 
	
	</script>
@forelse($products as $product)


<li class="product_box_OEX mkdf-mg-with-price post-2020 restaurant-menu-item type-restaurant-menu-item status-publish has-post-thumbnail hentry restaurant-menu-section-menu-1" variation_id="{{$product->id}}">
<div class="mkdf-mg-image-holder">
			@if(count($product->media) > 0)
				<img src="{{$product->media->first()->display_url}}" alt="Product Image">
			@elseif(!empty($product->product_image))
				<img src="{{asset('/uploads/img/' . $product->product_image)}}" alt="Product Image">
			@else
				<img src="{{asset('/img/default.png')}}" alt="Product Image">
			@endif
<span class="mkdf-mg-overlay"></span>

</div>
<div class="mkdf-mg-content-holder">
<div class="mkdf-mg-price-holder">
<span class="mkdf-mg-price">
<span>KD {{number_format((float)$product->selling_price, 2, '.', '')}}</span>
</span>
</div>
<div class="mkdf-mg-title-holder">
<h4 class="mkdf-mg-title"><a href="#">{{$product->name}}</a></h4>
</div>
<div class="mkdf-bg-excerpt-holder">
<p>{{$product->sub_sku}}</p>
</div>
</div>
</li>

@empty
	<input type="hidden" id="no_products_found">
	<div class="col-md-12">
		<h4 class="text-center">
			@lang('lang_v1.no_products_to_display')
		</h4>
	</div>
@endforelse
	
</ul>