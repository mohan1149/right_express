<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    <div class="container-fluid">
        <div style="text-align:center;">
            <img src="/img/default.png" alt="" srcset="" width="40%">
        </div>
        <h3>@lang('lang_v1.outside_order_invoice')</h3>
        <table class="table table-bordered table-striped">
            <tr>
                <th>@lang('lang_v1.product_name')</th>
                <th>@lang('lang_v1.unit_price')</th>
                <th>@lang('lang_v1.quntity')</th>
                <th>@lang('lang_v1.price')</th>
            </tr>
            <tbody>
                @foreach ($data['transaction'] as $record)
                    <tr>
                        <td>{{ $record->name }}</td>
                        <td><span class="display_currency" data-currency_symbol ="true">{{ $record->unit_price }}</span></td>
                        <td>{{ $record->quantity }}</td>
                        <td><span class="display_currency" data-currency_symbol ="true">{{ $record->quantity * $record->unit_price }}</span></td>
                    </tr>
                @endforeach
                <tr>
                    <td><h4>@lang('lang_v1.grand_total')</h4></td>
                    <td></td>
                    <td></td>
                    <td><span class="display_currency" data-currency_symbol ="true">{{ $data['transaction'][0]->final_total }}</span></td>
                </tr>
            </tbody>
        </table>
        <table class="table table-bordered">
            <tr>
                <td style="text-align: left">
                    <h3>@lang('lang_v1.billing_information')</h3>
                    <br>
                    <h4>@lang('lang_v1.invoice_no') : {{ $data['transaction'][0]->invoice_no }}</h4>
                    <h4>@lang('lang_v1.customer_name')       : {{ $data['customer_data']->customer_name }}</h4>
                    <h4>@lang('lang_v1.customer_phone')      : {{ $data['customer_data']->customer_phone }}</h4>
                    <h4>@lang('lang_v1.customer_email')      : {{ $data['customer_data']->customer_email }}</h4>
                    <h4>@lang('lang_v1.order_date')  : {{ $data['transaction'][0]->transaction_date }}</h4>
                    
                </td>
                <td style="text-align: left">
                    <h3>@lang('lang_v1.shipping_address')</h3>
                    <br>
                    <h5>@lang('lang_v1.governorate') : {{ $data['customer_data']->PROVINCE_NAME_EN.' / '.$data['customer_data']->PROVINCE_NAME_AR  }}</h5>
                    <h5>@lang('lang_v1.area')        : {{ $data['customer_data']->AREA_NAME_EN.' / '.$data['customer_data']->AREA_NAME_AR  }}</h5>
                    <h5>@lang('lang_v1.street')      : {{ $data['customer_data']->street }}</h5>
                    <h5>@lang('lang_v1.building')    : {{ $data['customer_data']->building }}</h5>
                    <h5>@lang('lang_v1.floor')       : {{ $data['customer_data']->floor }}</h5>
                    <h5>@lang('lang_v1.apartment')   : {{ $data['customer_data']->apartment }}</h5>
                    <h5>@lang('lang_v1.landmark')    : {{ $data['customer_data']->landmark }}</h5>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>