{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => action('OutsideCustomerController@store'), 'method' => 'post', 'id' => 'add_outside_customer_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.add_outside_customers') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('name', __('lang_v1.customer_name') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            {!! Form::text('name', null, ['class' => 'form-control','placeholder' => __('lang_v1.customer_name'), 'required']); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('mobile', __('lang_v1.customer_mobile') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-mobile"></i>
                            </span>
                            {!! Form::text('mobile', null, ['class' => 'form-control', 'required', 'placeholder' => __('lang_v1.customer_mobile')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('email', __('lang_v1.customer_email') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-envelope"></i>
                            </span>
                            {!! Form::email('email', null, ['class' => 'form-control','placeholder' => __('lang_v1.customer_email')]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        {!! Form::label('civil_id', __('lang_v1.civil_id') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            {!! Form::text('civil_id', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.civil_id')]); !!}
                        </div>
                    </div>
                </div>
                {{-- address --}}
                {{-- governorate --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('governorate', __('lang_v1.governorate') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            <select name="governorate" id="governorate" class="form-control">
                                <option value="0">@lang( 'lang_v1.governorate' )</option>
                                @foreach ($governorates as $item)
                                    <option value="{{ $item->PROVINCE_ID }}">{{ $item->PROVINCE_NAME_EN .' / '.$item->PROVINCE_NAME_AR }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                {{-- area --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('area', __('lang_v1.area') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::select('area', [], null , ['class' => 'form-control', 'id' => 'area','placeholder' => __('lang_v1.area')]); !!}
                        </div>
                    </div>
                </div>
                {{-- street --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('street', __('lang_v1.street') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('street', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.street')]); !!}
                        </div>
                    </div>
                </div>
                {{-- building --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('building', __('lang_v1.building') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('building', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.building')]); !!}
                        </div>
                    </div>
                </div>
                {{-- floor --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('floor', __('lang_v1.floor') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('floor', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.floor')]); !!}
                        </div>
                    </div>
                </div>
                {{-- apartment --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('apartment', __('lang_v1.apartment') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('apartment', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.apartment')]); !!}
                        </div>
                    </div>
                </div>
                {{-- landmark --}}
                <div class="col-md-4">
                    <div class="form-group">
                        {!! Form::label('landmark', __('lang_v1.landmark') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('landmark', null, ['class' => 'form-control', 'placeholder' => __('lang_v1.landmark')]); !!}
                        </div>
                    </div>
                </div>
                {{-- notes --}}
                <div class="col-md-8">
                    <div class="form-group">
                        {!! Form::label('notes', __('lang_v1.notes') . ':') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-map-marker"></i>
                            </span>
                            {!! Form::text('notes', null, ['class' => 'form-control','placeholder' => __('lang_v1.notes')]); !!}
                        </div>
                    </div>
                </div>
                {{-- end address --}}
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">@lang( 'messages.save' )</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
                </div>
            <div>
        </div>
        {{-- <div class="modal-footer">
        </div> --}}
        {!! Form::close() !!}
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->