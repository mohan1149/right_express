<div class="box box-widget">
    <div class="box-header with-border">
      <div class="row">
        <div class="col col-lg-6">
          <span style="display: none" class="badge subs_paid_badge">@lang('lang_v1.paid')</span>
          <span style="display: none" class="badge subs_unpaid_badge">@lang('lang_v1.unpaid')</span>
        </div>
        <div class="col col-lg-6">
          <button type="button" data-toggle="modal" data-target="#renewSubsModal" class="btn btn-primary">@lang('lang_v1.renew')</button>
        </div>
      </div>
      {{-- renew modal --}}
      <div class="modal fade" id="renewSubsModal" tabindex="-1" role="dialog" aria-labelledby="renewSubsModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="renewSubsModalLabel">@lang('lang_v1.renew_subscription_plan')</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-check">
                <input type="text" class="form-control" name="paid_for_renewal" id="paid_for_renewal">
                <label class="form-check-label" for="paid_for_renewal">@lang('lang_v1.paid_for_renewal')</label>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" data-dismiss="modal" class="btn btn-primary renewCustomerSubscriptionPlan">@lang('lang_v1.renew')</button>
            </div>
          </div>
        </div>
      </div>

        <h4>@lang('lang_v1.customer_group') : <strong class="subscription_name"></strong></h4>
        <h4>@lang('lang_v1.subscription_pieces') : <strong class="subscription_pieces"></strong></h4>
        <h4>@lang('lang_v1.subscription_cost') : <strong class="subscription_cost"></strong></h4>
        <hr>
        <h4>@lang('lang_v1.quota_used') : <strong class="quota_used"></strong></h4>
        <h4>@lang('lang_v1.quota_left') : <strong class="quota_left"></strong></h4>
    </div>
    <div class="box-body">
        <div class="update_subscription">
            <div class="form-group">
                <label for="">@lang('lang_v1.brought_today')</label>
                <input id="final_total_input" class="form-control brought_today_count" type="text">
            </div>
            <div class="form-group">
                <input class="form-control btn btn-primary save_tranasaction" data-toggle="modal" data-target="#ajaxModal" type="submit" name="" id="" value="@lang('lang_v1.save')">  
            </div>
        </form>
    </div>
    <div id="ajaxModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">
            
            <div class="modal-body">
              <p>@lang('lang_v1.wait_while_processing')</p>
            </div>
            
          </div>
      
        </div>
      </div>
    <div id="print_transaction_content" style="display: none">
        <style>
            th,td,table,td{
                text-align: center;
            }
        </style>
        <div style="display:flex;justify-content: center">
            <img src="/img/default.png" alt="Logo" width="50%">
        </div>
        <table class="table">
            <caption>@lang('lang_v1.subscription_report')</caption>
            <thead>
              <tr>
                <th scope="col">@lang('lang_v1.customer_group')</th>
                <th scope="col">@lang('lang_v1.subscription_pieces')</th>
                <th scope="col">@lang('lang_v1.subscription_cost')</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><span class="p_subscription_name"></span></td>
                <td><span class="p_subscription_pieces"></span></td>
                <td><span class="p_subscription_cost"></span></td>
              </tr>
            </tbody>
          </table>
          <table class="table">
            <caption>@lang('lang_v1.transaction_report')  # {{date('l - d/m/y')}}</caption>
            <thead>
              <tr>
                <th scope="col">@lang('lang_v1.quota_left')</th>
                <th scope="col">@lang('lang_v1.quota_used')</th>
                <th scope="col">@lang('lang_v1.brought_today')</th>
                <th scope="col">@lang('lang_v1.net_available')</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><span class="quota_left"></span></td>
                <td><span class="quota_used"></span></td>
                <td><span class="brought_today"></span></td>
                <td><span class="net_available"></span></td>
              </tr>
            </tbody>
          </table>
    </div>
</div>