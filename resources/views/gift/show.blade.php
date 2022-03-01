{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => '/assign/voucher', 'method' => 'post', 'id' => 'assign_voucher_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.assign_gift_voucher') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::hidden('voucher_id', $giftVoucher->id) !!}
                        {!! Form::label('contact_id', __('lang_v1.from_customer') . ':*') !!}
                        {!! Form::select('contact_id', [], null, ['class' => 'form-control mousetrap', 'id' => 'customer_id', 'placeholder' => 'Enter Customer name / phone', 'required', 'style' => 'width: 100%;']); !!}
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('to_contact_id', __('lang_v1.to_customer') . ':*') !!}
                        {!! Form::select('to_contact_id', [], null, ['class' => 'form-control mousetrap', 'id' => 'to_contact_id', 'placeholder' => 'Enter Customer name / phone', 'required', 'style' => 'width: 100%;']); !!}
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