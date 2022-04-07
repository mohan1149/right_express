<div class="row">
	{{-- customer receipt --}}
	<div class="col-xs-6 customer-receipt">
		<div class="row">
			<div class="col-xs-6">
				<img src="/img/default.png" style="width: 75%">
			</div>
			<div class="col-xs-6">
				<h6>Kaifan, Block -2, Kifan Commercial Complex</h6>
				<h6>Tel :: (+965) 29415416</h6>
				<h6>Delivery :: (+965) 66444477</h6>
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
								<span>{{ $receipt_details->current_balance }}</span>
							@endif
						</td>
					</tr>
				</table>
			</div>
		</div><br>
		<table class="table table-responsive">
			<thead>
				<tr>
					<th>No</th>
					<th>{{$receipt_details->table_product_label}}</th>
					<th>{{$receipt_details->table_qty_label}}</th>
					<th>{{$receipt_details->table_unit_price_label}}</th>
					<th>{{$receipt_details->table_subtotal_label}}</th>
				</tr>
			</thead>
			<tbody>
				@foreach($receipt_details->lines as $line)
					<tr>
						<td class="text-center">
							{{$loop->iteration}}
						</td>
						<td>
                            {{$line['name']}} {{$line['variation']}} 
                            @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif @if(!empty($line['brand'])), {{$line['brand']}} @endif
                            @if(!empty($line['sell_line_note']))({{$line['sell_line_note']}}) @endif 
                        </td>

						@if($receipt_details->show_cat_code == 1)
	                        <td>
	                        	@if(!empty($line['cat_code']))
	                        		{{$line['cat_code']}}
	                        	@endif
	                        </td>
	                    @endif

						<td class="text-right">
							{{$line['quantity']}} {{$line['units']}}
						</td>
						<td class="text-right">
							{{$line['unit_price_exc_tax']}}
						</td>
						<td class="text-right">
							{{$line['line_total']}}
						</td>
					</tr>
				@endforeach
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6" class="pull-right">
				<table class="full-right">
					<tr>
						<td>Amount</td>
						<td>{{ $receipt_details->total }}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	{{-- shop receipt --}}
	<div class="col-xs-6">
		<div class="row">
			<div class="col-xs-6">
				<img src="/img/default.png" style="width: 75%">
			</div>
			<div class="col-xs-6">
				<h6>Kaifan, Block -2, Kifan Commercial Complex</h6>
				<h6>Tel :: (+965) 29415416</h6>
				<h6>Delivery :: (+965) 66444477</h6>
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
					<th>No</th>
					<th>{{$receipt_details->table_product_label}}</th>
					<th>{{$receipt_details->table_qty_label}}</th>
					<th>{{$receipt_details->table_unit_price_label}}</th>
					<th>{{$receipt_details->table_subtotal_label}}</th>
				</tr>
			</thead>
			<tbody>
				@foreach($receipt_details->lines as $line)
					<tr>
						<td class="text-center">
							{{$loop->iteration}}
						</td>
						<td>
                            {{$line['name']}} {{$line['variation']}} 
                            @if(!empty($line['sub_sku'])), {{$line['sub_sku']}} @endif @if(!empty($line['brand'])), {{$line['brand']}} @endif
                            @if(!empty($line['sell_line_note']))({{$line['sell_line_note']}}) @endif 
                        </td>

						@if($receipt_details->show_cat_code == 1)
	                        <td>
	                        	@if(!empty($line['cat_code']))
	                        		{{$line['cat_code']}}
	                        	@endif
	                        </td>
	                    @endif

						<td class="text-right">
							{{$line['quantity']}} {{$line['units']}}
						</td>
						<td class="text-right">
							{{$line['unit_price_exc_tax']}}
						</td>
						<td class="text-right">
							{{$line['line_total']}}
						</td>
					</tr>
				@endforeach
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6" class="pull-right">
				<table class="full-right">
					<tr>
						<td>Amount</td>
						<td>{{ $receipt_details->total }}</td>
					</tr>
				</table>
			</div>
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
