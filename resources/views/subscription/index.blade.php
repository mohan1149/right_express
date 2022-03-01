@extends('layouts.app')
@section('title', 'Subscriptions')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang( 'subscriptions.subscriptions' )
        <small>@lang( 'subscriptions.subscriptions' )</small>
    </h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'subscriptions.subscriptions' )])
        <!-- @can('user.create') -->
            @slot('tool')
                <div class="box-tools">
                    <a class="btn btn-block btn-primary" 
                    href="{{action('SubscriptionController@create')}}" >
                    <i class="fa fa-plus"></i> @lang( 'messages.add' )</a>
                 </div>
            @endslot
        <!-- @endcan
        @can('user.view') -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="subscription_registers_table">
                    <thead>
                        <tr>
                            <th>@lang('subscriptions.client_name')</th>
							<th>@lang('subscriptions.client_gender')</th>
                            <th>@lang('subscriptions.plan')</th>
                            <th>@lang('subscriptions.plan_price')</th>
							<th>@lang('subscriptions.client_mobile')</th>
							<th>@lang('subscriptions.client_weight')</th>
							<th>@lang('subscriptions.client_height')</th>
							<th>@lang('subscriptions.client_state')</th>
							<th>@lang('subscriptions.client_address')</th>
                            <th>@lang('subscriptions.payment_method')</th>
                            <th>@lang('subscriptions.payment_status')</th>
                            <th>@lang('subscriptions.subscription_method')</th>
                            <th>@lang('subscriptions.start_date')</th>
                            <th>@lang('subscriptions.end_date')</th>
                            <th>@lang('subscriptions.status')</th>

                            <th>@lang( 'messages.action' )</th>
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
        var subscription_registers_table = $('#subscription_registers_table').DataTable({
                    processing: true,
                    serverSide: true,
                    ajax: '/subscriptions',
                    columnDefs: [ {
                        "targets": [9],
                        "orderable": false,
                        "searchable": false
                    } ],
                    "columns":[
                        {"data":"client_name"},
						{"data":"client_gender"},
                        {"data":"plan_name"},
                        {"data":"plan_price"},
						{"data":"client_mobile"},
						{"data":"client_weight"},
						{"data":"client_height"},
						{"data":"client_state"},
						{"data":"client_address"},
						{"data":"payment_method"},
						{"data":"payment_status"},
                        {"data":"subscription_method"},
                        {"data":"date_start","render":function(data,type,full){
                            if(data == null)
                                return "@lang('subscriptions.notstarted')";
                            else
                                return data.split(' ')[0];
                            }
                        },
                        {"data":"date_end","render":function(data,type,full){
                            if(data == null)
                                return "@lang('subscriptions.notstarted')";
                            else
                                return data.split(' ')[0];
                            }
                        },
                        {"data":"StatusText"},
                        {"data":"action"}
                    ]
                });
        $(document).on('click', 'button.delete_subscription_button', function(){
            swal({
              title: LANG.sure,
              text: LANG.confirm_delete_subscription,
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
                        complete : function(){
                            $('#subscription_registers_table').DataTable().ajax.reload();
                        },
                        success: function(result){
                            
                            $('#subscription_registers_table').DataTable().ajax.reload();

                            /*if(result.success == true){
                                toastr.success(result.msg);
                                
                            } else {
                                toastr.error(result.msg);
                            }*/
                        }
                    });
                }
             });
        });


        $(document).on('click', 'button.confirm_subscription_button', function(){
            swal({
              title: LANG.sure,
              text: LANG.confirm,
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
                        complete : function(){
                            $('#subscription_registers_table').DataTable().ajax.reload();
                        },
                        success: function(result){
                            
                            $('#subscription_registers_table').DataTable().ajax.reload();

                            /*if(result.success == true){
                                toastr.success(result.msg);
                                
                            } else {
                                toastr.error(result.msg);
                            }*/
                        }
                    });
                }
             });
        });
        
    });
    
    
</script>
@endsection
