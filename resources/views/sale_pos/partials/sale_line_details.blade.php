<table class="table bg-gray">
        <tr class="bg-green">
        <th>#</th>
        <th>{{ __('sale.product') }}</th>
        @if( session()->get('business.enable_lot_number') == 1)
            <th>{{ __('lang_v1.lot_n_expiry') }}</th>
        @endif
        <th>{{ __('sale.qty') }}</th>
        @if(!empty($pos_settings['inline_service_staff']))
            <th>
                @lang('restaurant.service_staff')
            </th>
        @endif
        <th>{{ __('sale.unit_price') }}</th>
        <th>{{ __('sale.discount') }}</th>
        <th>{{ __('sale.tax') }}</th>
        <th>{{ __('sale.price_inc_tax') }}</th>
        <th>{{ __('sale.subtotal') }}</th>
		{{-- <th>{{ __('sale.cook_status') }}</th> --}}

    </tr>
    @foreach($sell->sell_lines as $sell_line)
        <tr>
            <td>{{ $loop->iteration }}</td>
            <td>
                {{ $sell_line->product->name }}
                @if( $sell_line->product->type == 'variable')
                - {{ $sell_line->variations->product_variation->name ?? ''}}
                - {{ $sell_line->variations->name ?? ''}},
                @endif
                {{ $sell_line->variations->sub_sku ?? ''}}
                @php
                $brand = $sell_line->product->brand;
                @endphp
                @if(!empty($brand->name))
                , {{$brand->name}}
                @endif

                @if(!empty($sell_line->sell_line_note))
                <br> {{$sell_line->sell_line_note}}
                @endif
                @if($is_warranty_enabled && !empty($sell_line->warranties->first()) )
                    <br><small>{{$sell_line->warranties->first()->display_name ?? ''}} - {{ @format_date($sell_line->warranties->first()->getEndDate($sell->transaction_date))}}</small>
                    @if(!empty($sell_line->warranties->first()->description))
                    <br><small>{{$sell_line->warranties->first()->description ?? ''}}</small>
                    @endif
                @endif
            </td>
            @if( session()->get('business.enable_lot_number') == 1)
                <td>{{ $sell_line->lot_details->lot_number ?? '--' }}
                    @if( session()->get('business.enable_product_expiry') == 1 && !empty($sell_line->lot_details->exp_date))
                    ({{@format_date($sell_line->lot_details->exp_date)}})
                    @endif
                </td>
            @endif
            <td>
                <span class="display_currency" data-currency_symbol="false" data-is_quantity="true">{{ $sell_line->quantity }}</span> @if(!empty($sell_line->sub_unit)) {{$sell_line->sub_unit->short_name}} @else {{$sell_line->product->unit->short_name}} @endif
            </td>
            @if(!empty($pos_settings['inline_service_staff']))
                <td>
                {{ $sell_line->service_staff->user_full_name ?? '' }}
                </td>
            @endif
            <td>
                <span class="display_currency" data-currency_symbol="true">{{ $sell_line->unit_price_before_discount }}</span>
            </td>
            <td>
                <span class="display_currency" data-currency_symbol="true">{{ $sell_line->get_discount_amount() }}</span> @if($sell_line->line_discount_type == 'percentage') ({{$sell_line->line_discount_amount}}%) @endif
            </td>
            <td>
                <span class="display_currency" data-currency_symbol="true">{{ $sell_line->item_tax }}</span> 
                @if(!empty($taxes[$sell_line->tax_id]))
                ( {{ $taxes[$sell_line->tax_id]}} )
                @endif
            </td>
            <td>
                <span class="display_currency" data-currency_symbol="true">{{ $sell_line->unit_price_inc_tax }}</span>
            </td>
            <td>
                <span class="display_currency" data-currency_symbol="true">{{ $sell_line->quantity * $sell_line->unit_price_inc_tax }}</span>
            </td>
			
                {{-- <td>
					@if(in_array($sell_line->id,$cooking_status))
                    <span style="color:green">{{ __('sale.cooked') }}</span>
                    @else	
					
					@if($iskitchen==true)
					<a href="#" class="btn btn-flat small-box-footer bg-yellow mark_as_cooked_btn_item" data-href="{{action('Restaurant\KitchenController@markAsCookedItem', ['transaction_id'=>$sell->id,'item_id'=>$sell_line->id])}}"><i class="fa fa-check-square-o"></i> @lang('sale.cooked')</a>
					@else
					 <span style="color:red">{{ __('sale.cooking') }}</span>
					@endif
                    @endif
									
                </td> --}}
        </tr>
        @if(!empty($sell_line->modifiers))
        @foreach($sell_line->modifiers as $modifier)
            <tr>
                <td>&nbsp;</td>
                <td>
                    {{ $modifier->product->name }} - {{ $modifier->variations->name ?? ''}},
                    {{ $modifier->variations->sub_sku ?? ''}}
                </td>
                @if( session()->get('business.enable_lot_number') == 1)
                    <td>&nbsp;</td>
                @endif
                <td>{{ $modifier->quantity }}</td>
                <td>
                    <span class="display_currency" data-currency_symbol="true">{{ $modifier->unit_price }}</span>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <span class="display_currency" data-currency_symbol="true">{{ $modifier->item_tax }}</span> 
                    @if(!empty($taxes[$modifier->tax_id]))
                    ( {{ $taxes[$modifier->tax_id]}} )
                    @endif
                </td>
                <td>
                    <span class="display_currency" data-currency_symbol="true">{{ $modifier->unit_price_inc_tax }}</span>
                </td>
                <td>
                    <span class="display_currency" data-currency_symbol="true">{{ $modifier->quantity * $modifier->unit_price_inc_tax }}</span>
                </td>
				
				
            </tr>
            @endforeach
        @endif
    @endforeach
</table>