@extends('layouts.app')
@section('title', __('subscriptions.add_subscribe'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang('subscriptions.add_subscribe')</h1>
</section>

<!-- Main content -->
<section class="content">
{!! Form::open(['url' => action('SubscriptionController@insert'), 'method' => 'post', 'id' => 'subscription_add_form' ]) !!}
		
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">

				<div class="col-sm-6">
					     <div class="form-group">
        {!! Form::label('client_name', __( 'subscriptions.client_name' ) . ':*') !!}
          {!! Form::text('client_name', null, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_name' )]); !!}
	</div>
							 
					<div class="form-group">
		<label>@lang( 'subscriptions.gender' ) :*</label>
		{!! Form::select('client_gender', ['male'=>'subscriptions.gender_male' , 'female'=>'subscriptions.gender_female'], null, ['class' => 'form-control select2','required']); !!}
					</div>
							 
														 
       <div class="form-group">
        {!! Form::label('client_mobile', __( 'subscriptions.client_mobile' ) . ':*') !!}
          {!! Form::text('client_mobile', null, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_mobile' )]); !!}
			</div>																		 
         
					<div class="form-group">
        {!! Form::label('client_weight', __( 'subscriptions.client_weight' ) . ':*') !!}
          {!! Form::text('client_weight', null, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_weight' )]); !!}
																												 
				</div>																						 					    
						<div class="form-group">
        {!! Form::label('client_height', __( 'subscriptions.client_height' ) . ':*') !!}
          {!! Form::text('client_height',null, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_height' )]); !!}
						</div>																													 
																																			 					     <div class="form-group">
        {!! Form::label('client_state', __( 'subscriptions.client_state' ) . ':*') !!}
          {!! Form::text('client_state', null, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_state' )]); !!}
		  </div>
					
		  					     <div class="form-group">
        {!! Form::label('client_address', __( 'subscriptions.client_address' ) . ':*') !!}
          {!! Form::text('client_address', null, ['class' => 'form-control', 'required', 'placeholder' => __( 'subscriptions.client_address' )]); !!}
							 
      </div>
					
				</div>
				<div class="col-sm-6">
					<div class="form-group">
		<label for="expense_category_id">@lang( 'subscriptions.plan' ) :</label>
		{!! Form::select('plan_id', $plans, null, ['class' => 'form-control select2','required']); !!}

					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.payment_method' ) :</label>
		{!! Form::select('payment_method', ['cash'=>'Cash','online'=>'Online'], null, ['class' => 'form-control select2','required']); !!}					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.payment_status' ) :</label>
		{!! Form::select('payment_status', ['pending'=>'Pending','paid'=>'Paid'], null, ['class' => 'form-control select2','required']); !!}					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.start_date' ) :*</label>
		<input type="date" name="date_start" class="form-control" required="" value="{{/*!empty($data->date_start) ? $user->date_start->format('yy-m-d') : null*/ null}}">

						
						
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
