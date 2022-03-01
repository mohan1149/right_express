@extends('layouts.app')
@section('title', __('subscriptions.add_plan'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>@lang('subscriptions.add_plan')</h1>
</section>

<!-- Main content -->
<section class="content">
	<!--form method="POST" action="/subscriptions/plans/insert" accept-charset="UTF-8" id="" enctype="multipart/form-data"-->
	{!! Form::open(['url' => action('SubscriptionController@plansInsert'), 'method' => 'post', 'id' => 'plans_add_form' ]) !!}
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">

				<div class="col-sm-6">
					<div class="form-group">
		<label>@lang( 'subscriptions.plans_title' ) :*</label>
		<input class="form-control" name="plan_title" type="text" id="plan_title" placeholder="@lang( 'subscriptions.plans_title' )" required="">
					</div>
				</div>

				<div class="col-sm-6">
					<div class="form-group">
		<label for="expense_category_id">@lang( 'subscriptions.plans_gender' ) :</label>
		{!! Form::select('gender', ['male'=>'Male','female'=>'Female'], null, ['class' => 'form-control select2','required']); !!}

					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.meals_no' ) :*</label>
		<input class="form-control" name="meals_no" type="text" id="meals_no" placeholder="@lang( 'subscriptions.meals_no' )" required="">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label>@lang( 'subscriptions.snacks_no' ) :*</label>
		<input class="form-control" name="snacks_no" type="text" id="snacks_no" placeholder="@lang( 'subscriptions.snacks_no' )" required="">
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
		<label for="final_total">@lang( 'subscriptions.plans_price' ) :*</label>
		<input class="form-control input_number" placeholder="@lang( 'subscriptions.plans_price' )" required="" name="plan_price" type="text" id="">
					</div>
				</div>

				<div class="col-sm-12">
					<div class="form-group">
		<label for="additional_notes">@lang( 'subscriptions.plan_note' ) :</label>
		<textarea class="form-control" rows="3" name="additional_notes" cols="50" id="additional_notes"></textarea>
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
<!--form-->
</section>

@endsection
