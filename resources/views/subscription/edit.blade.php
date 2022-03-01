@extends('layouts.app')
@section('title', __('subscriptions.edit_subscribe'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang('subscriptions.edit_subscribe')</h1>
</section>

<!-- Main content -->
<section class="content">
{!! Form::open(['url' => action('SubscriptionController@update', [$data->id]), 'method' => 'post', 'id' => 'subscription_add_form' ]) !!}
		
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">

				<div class="col-sm-6">
					     <div class="form-group">
        {!! Form::label('client_name', __( 'subscriptions.client_name' ) . ':*') !!}
          {!! Form::text('client_name', $data->client_name, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_name' )]); !!}
	</div>
							 
					<div class="form-group">
		<label>@lang( 'subscriptions.gender' ) :*</label>
		{!! Form::select('client_gender', ['male'=>'subscriptions.gender_male' , 'female'=>'subscriptions.gender_female'], $data->client_gender, ['class' => 'form-control select2','required']); !!}
					</div>
							 
														 
       <div class="form-group">
        {!! Form::label('client_mobile', __( 'subscriptions.client_mobile' ) . ':*') !!}
          {!! Form::text('client_mobile', $data->client_mobile, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_mobile' )]); !!}
			</div>																		 
         
					<div class="form-group">
        {!! Form::label('client_weight', __( 'subscriptions.client_weight' ) . ':*') !!}
          {!! Form::text('client_weight', $data->client_weight, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_weight' )]); !!}
																												 
				</div>																						 					    
						<div class="form-group">
        {!! Form::label('client_height', __( 'subscriptions.client_height' ) . ':*') !!}
          {!! Form::text('client_height', $data->client_height, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_height' )]); !!}
						</div>																													 
																																			 					     <div class="form-group">
        {!! Form::label('client_state', __( 'subscriptions.client_state' ) . ':*') !!}
          {!! Form::text('client_state', $data->client_state, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_state' )]); !!}
		  </div>
					
		  					     <div class="form-group">
        {!! Form::label('client_address', __( 'subscriptions.client_address' ) . ':*') !!}
          {!! Form::text('client_address', $data->client_address, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_address' )]); !!}
							 
      </div>
					
				</div>

				<div class="col-sm-6">
					<div class="form-group">
		<label for="expense_category_id">@lang( 'subscriptions.plan' ) :</label>
		{!! Form::select('plan_id', $plans, $data->plan_id, ['class' => 'form-control select2','required']); !!}

					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.payment_method' ) :</label>
		{!! Form::select('payment_method', ['cash'=>'Cash','online'=>'Online'], $data->payment_method, ['class' => 'form-control select2','required']); !!}					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.payment_status' ) :</label>
		{!! Form::select('payment_status', ['pending'=>'Pending','paid'=>'Paid'], $data->payment_status, ['class' => 'form-control select2','required']); !!}					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.start_date' ) :*</label>
		<input type="date" name="date_start" class="form-control" required="" value="{{!empty($data->date_start) ? $data->date_start->format('yy-m-d') : null}}">

						
						
					</div>
				</div>
				<div class="clearfix"></div>


				<div class="col-sm-12">
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</div>
			</div>
		</div>
	</div> <!--box end-->

	{!! Form::close() !!}
</section>

@endsection
