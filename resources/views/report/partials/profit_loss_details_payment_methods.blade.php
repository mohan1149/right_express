<div class="">
    @component('components.widget')
	
        <table class="table table-striped">
			
			@foreach ($payments_report as $key=>$payments_report_item)
              <tr>
				<th>{{$payments_report_item['name']}}:</th>
                <td>
                    <span class="display_currency" data-currency_symbol="true">
                        {{$payments_report_item['amount']}}
                    </span>
                </td>
                
            </tr>
@endforeach
			
			
        </table>
    @endcomponent
</div>