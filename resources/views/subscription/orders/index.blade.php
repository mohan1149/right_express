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
                            <th>@lang('messages.action')</th>
                            <th>@lang('messages.date')</th>
                            <th>@lang('sale.invoice_no')</th>
                            <th>@lang('sale.customer_name')</th>
                            <th>@lang('lang_v1.contact_no')</th>
                            <th>@lang('subscriptions.plan')</th>
                            <th>@lang('subscriptions.meals_no')</th>
                            <th>@lang('subscriptions.snacks_no')</th>
                            
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
                    ajax: '/subscriptions/orders',
                    columnDefs: [ {
                        "targets": [6],
                        "orderable": false,
                        "searchable": false
                    } ],
                    "columns":[
            { data: 'action', name: 'action', orderable: false, "searchable": false},
            { data: 'transaction_date', name: 'transaction_date'  },
            { data: 'invoice_no', name: 'invoice_no'},
            { data: 'name', name: 'contacts.name'},
            { data: 'mobile', name: 'contacts.mobile'},
            { data: 'subscription.plan.title', name: 'subscription.plan.title'},
            { data: 'meals_no', name: 'meals_no'},
            { data: 'snacks_no', name:'snacks_no'},
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
        
    });
    
    
</script>
@endsection
