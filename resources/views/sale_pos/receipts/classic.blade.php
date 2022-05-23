<div class="row">
	{{-- customer receipt --}}
	<div class="col-xs-6 customer-receipt">
		<div class="row">
			<div class="col-xs-6">
				<img src="/img/default.png" style="width: 75%">
			</div>
			<div class="col-xs-6">  
				<h6>Kaifan , Block 2  داخل مجمع كيفان التجاري</h6>
				<h6>Tel :: (+965) 66444477</h6>
				<h6>Delivery :: (+965) 95590633</h6>
			</div>
		</div>
		<h3 style="text-align: right"><strong>{{ $receipt_details->invoice_no }}</strong></h3>
		<div class="row">
			<div class="col-xs-6">
				<table class="full-table">
					<tr>
						<td>Received Date</td>
						<td>{{ $receipt_details->invoice_date }}</td>
					</tr>
					<tr>
						<td>Delivery Date</td>
						<td>
							@if ( isset($receipt_details->types_of_service_custom_fields))
								{{ $receipt_details->types_of_service_custom_fields['Delivery Date'] }}
							@endif
						</td>
						
					</tr>
					<tr>
						<td>Delivery</td>
						<td>
							@if ( isset($receipt_details->types_of_service_custom_fields ))
								{{ $receipt_details->types_of_service_custom_fields['Delivery Staff Name'] }}
							@endif
						</td>
						
					</tr>
					<tr>
						<td>Service Type</td>
						<td>
							@if ( isset($receipt_details->types_of_service_custom_fields ))
								{{ $receipt_details->types_of_service }}
							@endif
						</td>
					</tr>
				</table>
			</div>
			<div class="col-xs-6">
				<table class="full-table">
					<tr>
						<td>Name</td>
						<td>{{ $receipt_details->customer_name }}</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>{!! $receipt_details->customer_info !!}</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>{{ $receipt_details->contact }}</td>
					</tr>
					<tr>
						<td>Current Bal</td>
						<td>
							@if (isset($receipt_details->current_balance))
								<span>{{ number_format($receipt_details->current_balance,3) }}</span>
							@endif
						</td>
					</tr>
				</table>
			</div>
		</div><br>
		<table class="table table-responsive">
			<thead>
				<tr>
					<th>{{$receipt_details->table_product_label}}</th>
					<th>Service Type</th>
					<th>{{$receipt_details->table_qty_label}}</th>
					<th>{{$receipt_details->table_unit_price_label}}</th>
					<th>{{$receipt_details->table_subtotal_label}}</th>
				</tr>
			</thead>
			<tbody>
				@php
					$qn=0;
				@endphp
				@forelse($receipt_details->lines as $line)
				@php
					$qn += $line['quantity'];
				@endphp
					<tr>
						<td style="word-break: break-all;">
							{{-- @if(!empty($line['image']))
								<img src="{{$line['image']}}" alt="Image" width="50" style="float: left; margin-right: 8px;">
							@endif --}}
                            {{$line['name']}}
                            {{-- @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif  --}}
							{{-- @if(!empty($line['brand'])), {{$line['brand']}} @endif --}}
							{{$line['line_note']}}
							{{-- @if(!empty($line['cat_code'])), {{$line['cat_code']}}@endif --}}
							
                            {{-- @if(!empty($line['product_custom_fields'])), {{$line['product_custom_fields']}} @endif --}}
                            {{-- @if(!empty($line['sell_line_note']))({{$line['sell_line_note']}}) @endif  --}}
                            {{-- @if(!empty($line['lot_number']))<br> {{$line['lot_number_label']}}:  {{$line['lot_number']}} @endif  --}}
                            {{-- @if(!empty($line['product_expiry'])), {{$line['product_expiry_label']}}:  {{$line['product_expiry']}} @endif --}}
                            {{-- @if(!empty($line['warranty_name'])) <br><small>{{$line['warranty_name']}} </small>@endif @if(!empty($line['warranty_exp_date'])) <small>- {{@format_date($line['warranty_exp_date'])}} </small>@endif --}}
                            {{-- @if(!empty($line['warranty_description'])) <small> {{$line['warranty_description'] ?? ''}}</small>@endif --}}
                        </td>
						<td>{{ $line['variation'] }}</td>
						<td>{{$line['quantity']}} </td>
						<td>{{$line['unit_price_inc_tax']}}</td>
						<td>{{$line['line_total']}}</td>
					</tr>
					@if(!empty($line['modifiers']))
						@foreach($line['modifiers'] as $modifier)
							<tr>
								<td>
		                            {{$modifier['name']}} {{$modifier['variation']}} 
		                            @if(!empty($modifier['sub_sku'])), {{$modifier['sub_sku']}} @endif @if(!empty($modifier['cat_code'])), {{$modifier['cat_code']}}@endif
		                            @if(!empty($modifier['sell_line_note']))({{$modifier['sell_line_note']}}) @endif 
		                        </td>
								<td>{{$modifier['quantity']}} {{$modifier['units']}} </td>
								<td>{{$modifier['unit_price_inc_tax']}}</td>
								<td>{{$modifier['line_total']}}</td>
							</tr>
						@endforeach
					@endif
				@empty
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
				@endforelse
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6" class="pull-right">
				<table class="full-right">
					<tr>
						<td>Amount</td>
						<td>{{ $receipt_details->total_paid }}</td>
					</tr>
					<tr>
						<td>Total Items</td>
						<td>{{  $qn  }}</td>
					</tr>
					{{-- <tr>
						<td>Balance</td>
						<td>{{ $receipt_details->total_paid }}</td>
					</tr> --}}
				</table>
			</div>
		</div>
		<div class="row">
			<br>
			<ul style="text-align: right;list-style: none;margin-right:20px;">
				<li style="text-align: right"> المصبغة غير مسؤول عن الملابس التي لاتطلب خلال (30) يوم .</li>
				<li style="text-align: right"> المصبغة غير مسؤولة عن التلفيات اذا لم يتم التبليغ عنها بعد 48 ساعه من الاستلام </li>
			</ul> 
		</div>

	</div>
	{{-- shop receipt --}}
	<div class="col-xs-6">
		<div class="row">
			<div class="col-xs-6">
				<img src="/img/default.png" style="width: 75%">
			</div>
			<div class="col-xs-6">
				<h6>Kaifan , Block 2  داخل مجمع كيفان التجاري</h6>
				<h6>Tel :: (+965) 66444477</h6>
				<h6>Delivery :: (+965) 95590633</h6>
			</div>
		</div>
		<h3 style="text-align: right"><strong>{{ $receipt_details->invoice_no }}</strong></h3>
		<div class="row">
			<div class="col-xs-6">
				<table class="full-table">
					<tr>
						<td>Received Date</td>
						<td>{{ $receipt_details->invoice_date }}</td>
					</tr>
					<tr>
						<td>Delivery Date</td>
						<td>
							@if ( isset($receipt_details->types_of_service_custom_fields))
								{{ $receipt_details->types_of_service_custom_fields[__('lang_v1.service_custom_field_1')] }}
							@endif
						</td>
						
					</tr>
					<tr>
						<td>Delivery</td>
						<td>
							@if ( isset($receipt_details->types_of_service_custom_fields ))
								{{ $receipt_details->types_of_service_custom_fields[__("lang_v1.service_custom_field_2")] }}
							@endif
						</td>
						
					</tr>
					<tr>
						<td>Service Type</td>
						<td>
							@if ( isset($receipt_details->types_of_service_custom_fields ))
								{{ $receipt_details->types_of_service }}
							@endif
						</td>
					</tr>
				</table>
			</div>
			<div class="col-xs-6">
				<table class="full-table">
					<tr>
						<td>Name</td>
						<td>{{ $receipt_details->customer_name }}</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>{!! $receipt_details->customer_info !!}</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>{{ $receipt_details->contact }}</td>
					</tr>
					<tr>
						<td>Current Bal</td>
						<td>
							@if (isset($receipt_details->current_balance))
								<span>{{ number_format($receipt_details->current_balance,3) }}</span>
							@endif
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br>
		<table class="table table-responsive">
			<thead>
				<tr>
					<th>{{$receipt_details->table_product_label}}</th>
					<th>Service Type</th>
					<th>{{$receipt_details->table_qty_label}}</th>
					<th>{{$receipt_details->table_unit_price_label}}</th>
					<th>{{$receipt_details->table_subtotal_label}}</th>
				</tr>
			</thead>
			<tbody>
				@forelse($receipt_details->lines as $line)
					<tr>
						<td style="word-break: break-all;">
							{{-- @if(!empty($line['image']))
								<img src="{{$line['image']}}" alt="Image" width="50" style="float: left; margin-right: 8px;">
							@endif --}}
                            {{$line['name']}}
                            {{-- @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif  --}}
							{{-- @if(!empty($line['brand'])), {{$line['brand']}} @endif --}}
							{{$line['line_note']}}
							{{-- @if(!empty($line['cat_code'])), {{$line['cat_code']}}@endif --}}
							
                            {{-- @if(!empty($line['product_custom_fields'])), {{$line['product_custom_fields']}} @endif --}}
                            {{-- @if(!empty($line['sell_line_note']))({{$line['sell_line_note']}}) @endif  --}}
                            {{-- @if(!empty($line['lot_number']))<br> {{$line['lot_number_label']}}:  {{$line['lot_number']}} @endif  --}}
                            {{-- @if(!empty($line['product_expiry'])), {{$line['product_expiry_label']}}:  {{$line['product_expiry']}} @endif --}}
                            {{-- @if(!empty($line['warranty_name'])) <br><small>{{$line['warranty_name']}} </small>@endif @if(!empty($line['warranty_exp_date'])) <small>- {{@format_date($line['warranty_exp_date'])}} </small>@endif --}}
                            {{-- @if(!empty($line['warranty_description'])) <small> {{$line['warranty_description'] ?? ''}}</small>@endif --}}
                        </td>
						<td>{{ $line['variation'] }}</td>
						<td>{{$line['quantity']}} </td>
						<td>{{$line['unit_price_inc_tax']}}</td>
						<td>{{$line['line_total']}}</td>
					</tr>
					@if(!empty($line['modifiers']))
						@foreach($line['modifiers'] as $modifier)
							<tr>
								<td>
		                            {{$modifier['name']}} {{$modifier['variation']}} 
		                            @if(!empty($modifier['sub_sku'])), {{$modifier['sub_sku']}} @endif @if(!empty($modifier['cat_code'])), {{$modifier['cat_code']}}@endif
		                            @if(!empty($modifier['sell_line_note']))({{$modifier['sell_line_note']}}) @endif 
		                        </td>
								<td>{{$modifier['quantity']}} {{$modifier['units']}} </td>
								<td>{{$modifier['unit_price_inc_tax']}}</td>
								<td>{{$modifier['line_total']}}</td>
							</tr>
						@endforeach
					@endif
				@empty
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
				@endforelse
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6" class="pull-right">
				<table class="full-right">
					<tr>
						<td>Amount</td>
						<td>{{ $receipt_details->total_paid }}</td>
					</tr>
					<tr>
						<td>Total Items</td>
						<td>{{  $qn }}</td>
					</tr>
					{{-- <tr>
						<td>Balance</td>
						<td>{{ $receipt_details->total_paid }}</td>
					</tr> --}}
				</table>
			</div>
		</div>
		<div class="row">
			<br>
			<ul style="text-align: right;list-style: none;margin-right:20px;">
				<li style="text-align: right"> المصبغة غير مسؤول عن الملابس التي لاتطلب خلال (30) يوم .</li>
				<li style="text-align: right"> المصبغة غير مسؤولة عن التلفيات اذا لم يتم التبليغ عنها بعد 48 ساعه من الاستلام </li>
			</ul> 
		</div>
	</div>
</div>


<style>
	@media print{
		.customer-receipt{
			border-right: 3px dotted black;
		}
		.full-table{
			width: 100%;
			/* border: 2px solid black; */
		}
		.full-table tr{
			border: 2px solid black;
		}
		.full-right{
			width: 100%;
		}
		.full-right tr{
			border: 2px solid black;;
		}
		.pull-right{
			padding-right: 10px
		}
	}
</style>