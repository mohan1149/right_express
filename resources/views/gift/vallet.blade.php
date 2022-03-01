<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => '/add-vallet', 'method' => 'post', 'id' => 'add_vallet_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.add_vallet') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('vallet_credit', __('lang_v1.vallet_credit') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-money"></i>
                            </span>
                            {!! Form::number('vallet_credit', null, ['class' => 'form-control','placeholder' => __('lang_v1.vallet_credit'), 'required']); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('name', __('lang_v1.customer') . ':*') !!}
                        {!! Form::select('contact_id', [], null, ['class' => 'form-control mousetrap', 'id' => 'customer_id', 'placeholder' => 'Enter Customer name / phone', 'required', 'style' => 'width: 100%;']); !!}
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