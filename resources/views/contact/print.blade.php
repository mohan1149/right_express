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
    </tr>
</table>
<div class="hr"></div>
<h2>Customer Receipt - Membership</h2>
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
            </table>
        </td>
        <td class="right">
            <table style="width: 100%">
                <tr>
                    <td>{{ __("lang_v1.start_balance") }}</td>
                    <td>{{ $data->subscription_pieces }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.used_balance") }}</td>
                    <td>{{ $data->custom_field2 }}</td>
                </tr>
                <tr>
                    <td>{{ __("lang_v1.available_balance") }}</td>
                    <td>{{ $data->custom_field3 }}</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div class="hr"></div>

<style>
	@media print{
        .header{
            width: 50%;
        }
        .hr{
            border-bottom: 2px solid black;
            height: 2px;
        }
        table.main{
            width: 50%;
        }
        td.left{
            border: 2px solid black;
        }

        td.right{
            border: 2px solid black;
        }
	}
</style>