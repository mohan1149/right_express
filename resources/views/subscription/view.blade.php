<div class="modal-dialog modal-xl" role="document">
  <div class="modal-content">
    
    Customer: 
    {{$data->contact->name}}
    <br>
    Plan: 
    {{$data->plan->title}}
    <br>
    Price: 
    {{$data->plan_price}}
    <br>
    Payment Status: 
    {{$data->payment_status}}
    <br>
    Payment Method: 
    {{$data->payment_method}}
    <br>
    Active: 
    {{$data->IsActive?'Yes':'No'}}
    <br>
    Paused: 
    {{$data->IsPaused?'Yes':'No'}}
    <br>
    Suspended: 
    {{$data->IsSuspended?'Yes':'No'}}
    <br>
    Start Date: 
    {{$data->date_start}}
    <br>
    End Date: 
    {{$data->date_end}}
    <div class="modal-footer">
      <button type="button" class="btn btn-primary no-print" aria-label="Print" 
      onclick="$(this).closest('div.modal-content').printThis();"><i class="fa fa-print"></i> @lang( 'messages.print' )
      </button>
      <button type="button" class="btn btn-default no-print" data-dismiss="modal">@lang( 'messages.close' )</button>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var element = $('div.modal-xl');
		__currency_convert_recursively(element);
	});
</script>