{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => action('DriverController@store'), 'method' => 'post', 'id' => 'add_driver_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.add_driver') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('name', __('lang_v1.driver_name') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            {!! Form::text('name', null, ['class' => 'form-control','placeholder' => __('lang_v1.driver_name'), 'required']); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('mobile', __('contact.mobile') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-mobile"></i>
                            </span>
                            {!! Form::text('mobile', null, ['class' => 'form-control', 'required', 'placeholder' => __('contact.mobile')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('email', __('business.email') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-envelope"></i>
                            </span>
                            {!! Form::email('email', null, ['class' => 'form-control','placeholder' => __('business.email')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('password', __('lang_v1.password') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-lock"></i>
                            </span>
                            {!! Form::text('password', null, ['class' => 'form-control','placeholder' => __('lang_v1.password')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('comapany', __('lang_v1.company') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-home"></i>
                            </span>
                            {!! Form::text('comapany', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.company')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('civil_id', __('lang_v1.civil_id') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('civil_id', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.civil_id')]); !!}
                        </div>
                    </div>
                </div>
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