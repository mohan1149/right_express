<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content container-fluid">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">@lang('lang_v1.vallet') </h4>
        </div>
        <div class="modal-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="vallet_table">
                    <thead>
                        <tr>
                            <th>@lang('lang_v1.name')</th>
                            <th>@lang('contact.mobile')</th>
                            <th>@lang('lang_v1.vallet_credit')</th>
                            <th>@lang('lang_v1.added_on')</th>
                            <th>@lang('lang_v1.notes')</th>
                            <th>@lang('lang_v1.actions')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($vallets as $vallet)
                            <tr>
                                <td>{{ $vallet->name }}</td>
                                <td>{{ $vallet->mobile }}</td>
                                <td>{{ $vallet->credit_amount }}</td>
                                <td>{{ $vallet->added_on }}</td>
                                <td>{{ $vallet->notes }}</td>
                                <td>
                                    <button wid = {{ $vallet->id }} data-dismiss="modal" aria-label="Close" class="btn btn-primary finish_wallet">{{ __('lang_v1.finish') }}</button>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    {{-- <tfoot>
                        <tr class="bg-gray font-17 text-center footer-total">
                            <td colspan="4"></td>
                            <td><span class="display_currency" id="sale_total" data-currency_symbol ="true"></span></td>
                            <td colspan="2"></td>
                        </tr>
                    </tfoot> --}}
                </table>
            </div>
        </div>
        
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->