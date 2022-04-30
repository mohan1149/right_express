
@extends('layouts.app')
@section('title', __('lang_v1.renews'))

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1> @lang('lang_v1.renews')
    </h1>
</section>
<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'lang_v1.renews', ['outside_customers' => __('lang_v1.outside_customers') ])])
            <div class="table-responsive">
                {!! Form::text('renews_list_filter_date_range', null, ['placeholder' => __('lang_v1.select_a_date_range'), 'class' => 'form-control renews_list_filter_date_range', 'readonly']); !!}

                <table class="table table-bordered table-striped" id="renews">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.customer_name')</th>
                            <th>@lang('lang_v1.customer_phone')</th>
                            <th>@lang('lang_v1.amount')</th>
                            <th>@lang('lang_v1.date')</th>

                        </tr>
                    </thead>
                    <tfoot>
                        <tr class="bg-gray font-17 text-center footer-total">
                            <td colspan="2">@lang('lang_v1.total')</td>
                            <td><span class="display_currency" id="footer_renews_total" data-currency_symbol ="true"></span></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

    @endcomponent
</section>
<!-- /.content -->

@endsection
