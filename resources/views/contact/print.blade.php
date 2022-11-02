<table class="header">
    <tr>
        <td>
            <img src="/img/default.png" style="width: 75%">
        </td>
        <td>
            <h6>Kaifan, Block -2, Kifan Commercial Complex</h6>
            <h6>Tel :: (+965) 29415416</h6>
            <h6>Delivery :: (+965) 66444477</h6>
        </td>
        <td>
            <img src="/img/default.png" style="width: 75%">
        </td>
        <td>
            <h6>Kaifan, Block -2, Kifan Commercial Complex</h6>
            <h6>Tel :: (+965) 29415416</h6>
            <h6>Delivery :: (+965) 66444477</h6>
        </td>
    </tr>
    <tr>
        <td>
            <h2>Office Receipt - Membership</h2>
            <h3>Paid Amount : {{ number_format($data->total_paid_value,3) }}</h3>
        </td>
        <td></td>
        <td>
            <h2>Customer Receipt - Membership</h2>
            <h3>Paid Amount : {{ number_format($data->total_paid_value,3) }}</h3>
        </td>
        <td>
        </td>
    </tr>
</table>
<table class="main">
    <tr>
        <td class="left">
            <table style="width: 100%">
                <tr>
                    <td>{{ __("lang_v1.name") }}</td>
                    <td>{{ $data->name }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.address") }}</td>
                    <td>{{ $data->custom_field4.','.$data->city.','.$data->state.','.$data->country }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.contact") }}</td>
                    <td>{{ $data->mobile }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.member_from") }}</td>
                    <td>{{ $from_date }}</td>
                </tr>
            </table>
        </td>
        <td class="right">
            <table style="width: 100%">
                <tr>
                    <td>{{ __("lang_v1.start_balance") }}</td>
                    <td>{{ number_format($data->subscription_pieces,3) }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.used_balance") }}</td>
                    <td>{{ number_format($data->custom_field2,3) }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.available_balance") }}</td>
                    <td>{{ number_format($data->custom_field3,3) }}</td>
                </tr>
            </table>
        </td>
        <td class="left">
            <table style="width: 100%">
                <tr>
                    <td>{{ __("lang_v1.name") }}</td>
                    <td>{{ $data->name }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.address") }}</td>
                    <td>{{ $data->custom_field4.','.$data->city.','.$data->state.','.$data->country }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.contact") }}</td>
                    <td>{{ $data->mobile }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.member_from") }}</td>
                    <td>{{ $from_date }}</td>
                </tr>
            </table>
        </td>
        <td class="right">
            <table style="width: 100%">
                <tr>
                    <td>{{ __("lang_v1.start_balance") }}</td>
                    <td>{{ number_format($data->subscription_pieces,3) }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.used_balance") }}</td>
                    <td>{{ number_format($data->custom_field2,3) }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.available_balance") }}</td>
                    <td>{{ number_format($data->custom_field3,3) }}</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div class="hr"></div>

<style>
	@media print{
        .header{
            width: 100%;
        }
        .hr{
            border-bottom: 2px solid black;
            height: 2px;
        }
        table.main{
            width: 100%;
        }
        td.left{
            border: 2px solid black;
        }

        td.right{
            border: 2px solid black;
        }
	}
</style>
