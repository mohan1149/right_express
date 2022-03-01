@extends('layouts.app')
@section('title', 'Subscription Plans')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang( 'subscriptions.plans' )
        <small>@lang( 'subscriptions.plans' )</small>
    </h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'subscriptions.plans' )])
        <!-- @can('user.create') -->
            @slot('tool')
                <div class="box-tools">
                    <a class="btn btn-block btn-primary" 
                    href="{{action('SubscriptionController@plansCreate')}}" >
                    <i class="fa fa-plus"></i> @lang( 'messages.add' )</a>
                 </div>
            @endslot
        <!-- @endcan
        @can('user.view') -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="subscription_plans_table">
                    <thead>
                        <tr>
                            <th>@lang('subscriptions.plans_title')</th>
                            <th>@lang('subscriptions.plans_price')</th>
                            <th>@lang('subscriptions.plans_gender')</th>
                            <th>@lang('subscriptions.plans_months')</th>
							<th>@lang('subscriptions.meals_no')</th>
							<th>@lang('subscriptions.snacks_no')</th>
                            <th>@lang('messages.action')</th>
                        </tr>
                    </thead>
                </table>
            </div>
        <!-- @endcan -->
    @endcomponent

    <div class="modal fade user_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
    </div>

</section>
<!-- /.content -->
@stop
@section('javascript')
<script type="text/javascript">
    //Roles table
    $(document).ready( function(){
        var subscription_plans_table = $('#subscription_plans_table').DataTable({
                    processing: true,
                    serverSide: true,
                    ajax: '/subscriptions/plans',
                    columnDefs: [ {
                        "targets": [6],
                        "orderable": false,
                        "searchable": false
                    } ],
                    "columns":[
                        {"data":"title"},
                        {"data":"price"},
                        {"data":"gender"},
                        {"data":"months_no"},
						{"data":"meals_no"},
						{"data":"snacks_no"},
                        {"data":"action"}
                    ]
                });
        $(document).on('click', 'button.delete_plan_button', function(){
            swal({
              title: LANG.sure,
              text: LANG.confirm_delete_plan,
              icon: "warning",
              buttons: true,
              dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    var href = $(this).data('href');
                    var data = $(this).serialize();
                    $.ajax({
                        method: "POST",
                        url: href,
                        dataType: "json",
                        data: data,
                        success: function(result){
                            $('#subscription_plans_table').DataTable().ajax.reload();

                            if(result.success == true){
                                //toastr.success(result.msg);
                                //window.location.replace = "/subscriptions/plans";
                                
                            } else {
                                //toastr.error(result.msg);
                            }
                        }
                    });
                }
             });
        });
        
    });
    
    
</script>
@endsection
