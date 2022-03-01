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
        <h3 class="text-center">@lang('lang_v1.vallet')</h3>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h2>{{ __('lang_v1.customer').' # '.$print_data['name'] }}</h2>
                <h2>{{ __('lang_v1.vallet_credit').' # '.$print_data['amount'] }}</h2>
                <h4>{{ __('lang_v1.notes').' # '.$print_data['notes'] }}</h4>
            </div>
        </div>
    </div>
</body>
</html>