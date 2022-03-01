{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => '/redeem-voucher', 'method' => 'post', 'id' => 'redeem_gift_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.redeem_gift_voucher') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::hidden('id', $data['id']) !!}
                        {!! Form::hidden('left', $data['left']) !!}
                        {!! Form::label('redeem_cost', __('lang_v1.redeem_cost') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-money"></i>
                            </span>
                            {!! Form::number('redeem_cost', null, ['class' => 'form-control', 'required', 'placeholder' => __('lang_v1.redeem_cost')]); !!}
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            <div> 
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">@lang( 'messages.save' )</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
        </div>
        {!! Form::close() !!}
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->