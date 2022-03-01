{{-- mohan_customer_add_modal --}}
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        {!! Form::open(['url' => action('OutsideOrderController@store'), 'method' => 'post', 'id' => 'add_outside_order_form' ]) !!}
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.outside_orders') </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group" style="width: 100% !important">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            {!! Form::select('outside_customer_id', 
                                [], null, ['class' => 'form-control mousetrap outside_customer_id', 'id' => 'outside_customer_id', 'placeholder' => 'Enter Customer name / phone', 'required', 'style' => 'width: 100%;']); !!}
                            <span class="input-group-btn">
                                <button 
                                    type="button" 
                                    class="btn btn-primary btn-modal" 
                                    data-href="{{action('OutsideCustomerController@create')}}" 
                                    data-container=".outside_customer_modal"
                                >
                                    @lang('lang_v1.add_customer')
                                </button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group" style="width: 100% !important">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-car"></i>
                            </span>
                            {!! Form::select('driver_id', 
                                [], null, ['class' => 'form-control mousetrap driver_id', 'id' => 'driver_id', 'placeholder' => 'Enter Customer name / phone', 'required', 'style' => 'width: 100%;']); !!}
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        {!! Form::label('payment_method', __('lang_v1.payment_method') . ':*') !!}
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-money"></i>
                            </span>
                            <select name="payment_method" id="payment_method" class="form-control">
                                <option value="cash">CASH</option>
                                <option value="other">KNET</option>
                            </select>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="trans_id" id="outside_order_trans_id" value="">
            <div> 
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">@lang( 'messages.save' )</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
        </div>
        {!! Form::close() !!}
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
