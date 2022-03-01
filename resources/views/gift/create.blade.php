{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => action('GiftVoucherController@store'), 'method' => 'post', 'id' => 'add_voucher_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.add_gift_voucher') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('name', __('lang_v1.voucher_name') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-gift"></i>
                            </span>
                            {!! Form::text('name', null, ['class' => 'form-control','placeholder' => __('lang_v1.voucher_name'), 'required']); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('voucher_cost', __('lang_v1.voucher_cost') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-money"></i>
                            </span>
                            {!! Form::text('voucher_cost', null, ['class' => 'form-control', 'required', 'placeholder' => __('lang_v1.voucher_cost')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('voucher_expire', __('lang_v1.voucher_expire') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            {!! Form::date('voucher_expire', null, ['class' => 'form-control','placeholder' => __('lang_v1.voucher_expire')]); !!}
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-12">
                    <div class="form-group">
                        {!! Form::label('notes', __('lang_v1.notes') . ':') !!}
                            {!! Form::textarea('notes', null, ['class' => 'form-control', 
                            'placeholder' => __('lang_v1.notes')]); !!}
                    </div>
                </div>
            <div> 
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">@lang( 'messages.save' )</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
        </div>
        {!! Form::close() !!}
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->