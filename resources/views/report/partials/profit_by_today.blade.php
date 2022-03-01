
@extends('layouts.app')
@section('title', __('lang_v1.daily_profits'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1> @lang('lang_v1.daily_profits')
    </h1>
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'lang_v1.today_profit', ['today_profit' => __('lang_v1.today_profit') ])])
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="today_profits_table">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.invoice_number')</th>
                            <th>@lang('lang_v1.amount')</th>
                            <th>G</th>
                            <th>D</th>
                        </tr>
                    </thead>
                </table>
            </div>
    @endcomponent
</section>
<!-- /.content -->

@endsection
