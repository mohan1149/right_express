{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => action('OutsideOrderController@updateOrderStatus'), 'method' => 'post', 'id' => 'update_outside_order_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.order_status') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                
                <div class="col-md-12">
                    <div class="form-group">
                        {!! Form::label('order_status', __('lang_v1.order_status') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-money"></i>
                            </span>
                            <select name="order_status" id="order_status" class="form-control">
                                <option value="0">@lang( 'lang_v1.waiting' )</option>
                                <option value="1">@lang( 'lang_v1.accepted' )</option>
                                <option value="2">@lang( 'lang_v1.completed' )</option>
                                <option value="3">@lang( 'lang_v1.refused' )</option>
                            </select>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="outside_order_id" value="{{$oid}}">

            <div> 
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">@lang( 'lang_v1.update' )</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
        </div>
        {!! Form::close() !!}
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
