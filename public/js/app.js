$(document).ready(function () {
    $(".print_customer_membership").on('click', () => {
        let id = $('.print_customer_membership').attr('id');
        $.ajax({
            url: '/customer-membership/print/' + id,
            success: function (result) {
                if (result.success == true) {
                    var mywindow = window.open('', 'PRINT');
                    mywindow.document.write(result.html_content);
                    mywindow.document.close();
                    mywindow.focus(); 
                    mywindow.print();
                    mywindow.close();
                    return true;
                } else {
                    toastr.error(result.msg);
                }
            },
        });

    });
    $('body').on('click', 'label', function (e) {
        var field_id = $(this).attr('for');
        if (field_id) {
            if ($('#' + field_id).hasClass('select2')) {
                $('#' + field_id).select2('open');
                return false;
            }
        }
    });
    fileinput_setting = {
        showUpload: false,
        showPreview: false,
        browseLabel: LANG.file_browse_label,
        removeLabel: LANG.remove,
    };
    $(document).ajaxStart(function () {
        Pace.restart();
    });

    __select2($('.select2'));

    // popover
    $('body').on('mouseover', '[data-toggle="popover"]', function () {
        if ($(this).hasClass('popover-default')) {
            return false;
        }
        $(this).popover('show');
    });

    //Date picker
    $('.start-date-picker').datepicker({
        autoclose: true,
        endDate: 'today',
    });
    $(document).on('click', '.btn-modal', function (e) {
        e.preventDefault();
        var container = $(this).data('container');

        $.ajax({
            url: $(this).data('href'),
            dataType: 'html',
            success: function (result) {
                $(container)
                    .html(result)
                    .modal('show');
            },
        });
    });

    $(document).on('submit', 'form#brand_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.brands_modal').modal('hide');
                    toastr.success(result.msg);
                    brands_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    //Brands table
    var brands_table = $('#brands_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/brands',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
    });

    $(document).on('click', 'button.edit_brand_button', function () {
        $('div.brands_modal').load($(this).data('href'), function () {
            $(this).modal('show');

            $('form#brand_edit_form').submit(function (e) {
                e.preventDefault();
                $(this)
                    .find('button[type="submit"]')
                    .attr('disabled', true);
                var data = $(this).serialize();

                $.ajax({
                    method: 'POST',
                    url: $(this).attr('action'),
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            $('div.brands_modal').modal('hide');
                            toastr.success(result.msg);
                            brands_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            });
        });
    });

    $(document).on('click', 'button.delete_brand_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_brand,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            brands_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    //Start: CRUD for tax Rate

    //Tax Rates table
    var tax_rates_table = $('#tax_rates_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/tax-rates',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
    });

    $(document).on('submit', 'form#tax_rate_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.tax_rate_modal').modal('hide');
                    toastr.success(result.msg);
                    tax_rates_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    $(document).on('click', 'button.edit_tax_rate_button', function () {
        $('div.tax_rate_modal').load($(this).data('href'), function () {
            $(this).modal('show');

            $('form#tax_rate_edit_form').submit(function (e) {
                e.preventDefault();
                $(this)
                    .find('button[type="submit"]')
                    .attr('disabled', true);
                var data = $(this).serialize();

                $.ajax({
                    method: 'POST',
                    url: $(this).attr('action'),
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            $('div.tax_rate_modal').modal('hide');
                            toastr.success(result.msg);
                            tax_rates_table.ajax.reload();
                            tax_groups_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            });
        });
    });

    $(document).on('click', 'button.delete_tax_rate_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_tax_rate,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            tax_rates_table.ajax.reload();
                            tax_groups_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    //End: CRUD for tax Rate

    //Start: CRUD for unit
    //Unit table
    var units_table = $('#unit_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/units',
        columnDefs: [
            {
                targets: 3,
                orderable: false,
                searchable: false,
            },
        ],
        columns: [
            { data: 'actual_name', name: 'actual_name' },
            { data: 'short_name', name: 'short_name' },
            { data: 'allow_decimal', name: 'allow_decimal' },
            { data: 'action', name: 'action' },
        ],
    });

    var today_profits_table = $("#today_profits_table").DataTable({
        processing: true,
        serverSide: true,
        ajax: '/reports/today/profits',
        columns: [
            { data: 'invoice_no', name: 'invoice_no' },
            { data: 'final_total', name: 'final_total' },
            { data: 'g', name: 'g' },
            { data: 'd', name: 'd' },
        ],
    });
    $(document).on('submit', 'form#unit_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.unit_modal').modal('hide');
                    toastr.success(result.msg);
                    units_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    $(document).on('click', 'button.edit_unit_button', function () {
        $('div.unit_modal').load($(this).data('href'), function () {
            $(this).modal('show');

            $('form#unit_edit_form').submit(function (e) {
                e.preventDefault();
                $(this)
                    .find('button[type="submit"]')
                    .attr('disabled', true);
                var data = $(this).serialize();

                $.ajax({
                    method: 'POST',
                    url: $(this).attr('action'),
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            $('div.unit_modal').modal('hide');
                            toastr.success(result.msg);
                            units_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            });
        });
    });

    $(document).on('click', 'button.delete_unit_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_unit,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            units_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });


    // OUTSIDE_ORDER_START
    $('.outside_order_list_filter_date_range').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('.outside_order_list_filter_date_range').val(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
            outside_orders_table.ajax.reload();
        }
    );
    // $('#outside_order_list_filter_date_range').on('cancel.daterangepicker', function (ev, picker) {
    //     $('#outside_order_list_filter_date_range').val('');
    //     outside_orders_table.ajax.reload();
    // });

    //regular customers
    var regular_customers_table_colums = [
        { data: 'name', name: 'name' },
        { data: 'mobile', name: 'mobile' },
        { data: 'actions', name: 'actions' },
    ];
    var regular_customers_table = $('#regular_customers_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '/contacts?type=regular',
            data: function (d) {
                // var start = $('.outside_order_list_filter_date_range').data('daterangepicker').startDate.format('YYYY-MM-DD');
                // var end = $('.outside_order_list_filter_date_range').data('daterangepicker').endDate.format('YYYY-MM-DD');
                // d.start_date = start;
                // d.end_date = end;
                return d;
            }
        },
        columns: regular_customers_table_colums,
        fnDrawCallback: function (oSettings) {
            // var order_total = sum_table_col($('#outside_orders_table'), 'final_total');
            // $('#footer_outside_order_total').text(order_total);
            // __currency_convert_recursively($('#outside_orders_table'));
        },

    });
    //end
    var outside_orders_table_colums = [

        { data: 'invoice_no', name: 'invoice_no' },
        { data: 'customer_name', name: 'customer_name' },
        { data: 'driver_name', name: 'driver_name' },
        { data: 'order_status', name: 'order_status' },
        { data: 'payment_type', name: 'payment_type' },
        { data: 'order_date', name: 'order_date' },
        { data: 'final_total', name: 'final_total' },
        { data: 'actions', name: 'actions' },
    ];
    var outside_orders_table = $('#outside_orders_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '/outside-orders',
            data: function (d) {
                var start = $('.outside_order_list_filter_date_range').data('daterangepicker').startDate.format('YYYY-MM-DD');
                var end = $('.outside_order_list_filter_date_range').data('daterangepicker').endDate.format('YYYY-MM-DD');
                d.start_date = start;
                d.end_date = end;
                return d;
            }
        },
        columns: outside_orders_table_colums,
        fnDrawCallback: function (oSettings) {
            var order_total = sum_table_col($('#outside_orders_table'), 'final_total');
            $('#footer_outside_order_total').text(order_total);
            __currency_convert_recursively($('#outside_orders_table'));
        },

    });
    var outside_customer_table_columns = [
        { data: 'customer_name', name: 'customer_name' },
        { data: 'customer_phone', name: 'customer_phone' },
        { data: 'customer_email', name: 'customer_email' },
        { data: 'governorate', name: 'governorate' },
        { data: 'actions', name: 'actions' },
    ];
    var outside_customer_table = $('#outside_customer_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/outside-customers',
        columns: outside_customer_table_columns,
        fnDrawCallback: function (oSettings) {
            //var total_due = sum_table_col($('#outside_customer_table'), 'contact_due');
            //$('#footer_contact_due').text(total_due);

            //var total_return_due = sum_table_col($('#contact_table'), 'return_due');
            //$('#footer_contact_return_due').text(total_return_due);
            __currency_convert_recursively($('#outside_customer_table'));
        },
    });

    $('.outside_customer_modal').on('shown.bs.modal', function (e) {
        $('.outside_order_modal').modal('hide');
        $('#governorate').on('change', (e) => {
            $('#area').empty();
            $.ajax({
                method: 'GET',
                url: '/api/get/areas/' + $('#governorate').val(),
                success: function (result) {
                    console.log(result);
                    result.map((item) => {
                        let option = "<option value=" + item.AREA_ID + ">" + item.AREA_NAME_EN + ' / ' + item.AREA_NAME_AR + "</option>";
                        $('#area').append(option);
                    });

                },
            });
        });
        $('#add_outside_customer_form,#update_outside_customer_form').on('submit', (e) => {
            e.preventDefault();
            var data = $(e.target).serialize();
            $(e.target).find('button[type="submit"]').attr('disabled', true);
            $.ajax({
                method: 'POST',
                url: $(e.target).attr('action'),
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        $('div.outside_customer_modal').modal('hide');
                        toastr.success(result.msg);
                        outside_customer_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        });
    });

    var driver_table_columns = [
        { data: 'driver_name', name: 'driver_name' },
        { data: 'driver_mobile', name: 'driver_mobile' },
        { data: 'driver_email', name: 'driver_email' },
        // { data: 'driver_password', name: 'driver_password' },
        { data: 'driver_civil_id', name: 'driver_civil_id' },
        { data: 'driver_company', name: 'driver_company' },
        { data: 'actions', name: 'actions' },
    ];
    var drivers_table = $('#drivers_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/drivers',
        columns: driver_table_columns,
        // fnDrawCallback: function(oSettings) {
        //     var total_due = sum_table_col($('#contact_table'), 'contact_due');
        //     $('#footer_contact_due').text(total_due);

        //     var total_return_due = sum_table_col($('#contact_table'), 'return_due');
        //     $('#footer_contact_return_due').text(total_return_due);
        //     __currency_convert_recursively($('#contact_table'));
        // },
    });
    
    var renews_table_columns = [
        { data: 'name', name: 'name' },
        { data: 'mobile', name: 'mobile' },
        { data: 'renewed_amount', name: 'renewed_amount' },
        { data: 'renewed_on', name: 'renewed_on' },
    ];
    $('.renews_list_filter_date_range').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('.renews_list_filter_date_range').val(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
            renews_table.ajax.reload();
        }
    );
    var renews_table = $('#renews').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '/renews',
            data: function (d) {
                var start = $('.renews_list_filter_date_range').data('daterangepicker').startDate.format('YYYY-MM-DD');
                var end = $('.renews_list_filter_date_range').data('daterangepicker').endDate.format('YYYY-MM-DD');
                d.s_date = start;
                d.e_date = end;
                return d;
            }
        },

        columns: renews_table_columns,
        fnDrawCallback: function(oSettings) {
            var total_due = sum_table_col($('#renews'), 'renewed_amount');
            $('#footer_renews_total').text(total_due.toFixed(3));
        },
    });
    
    

    $('.driver_modal').on('shown.bs.modal', function (e) {
        $('#add_driver_form,#update_driver_form').on('submit', (e) => {
            e.preventDefault();
            var data = $(e.target).serialize();
            $(e.target).find('button[type="submit"]').attr('disabled', true);
            $.ajax({
                method: 'POST',
                url: $(e.target).attr('action'),
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        $('div.driver_modal').modal('hide');
                        toastr.success(result.msg);
                        drivers_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        });
    });

    // gift vouchers
    var gift_redeems_columns = [
        { data: 'customer_name', name: 'customer_name' },
        { data: 'to_contact_id', name: 'to_contact_id' },
        { data: 'voucher_name', name: 'voucher_name' },
        { data: 'voucher_value', name: 'voucher_value' },
        { data: 'expire_date', name: 'voucher_expire' },
        { data: 'added_on', name: 'added_on' },
        { data: 'redeemed', name: 'redeemed' },
        { data: 'left', name: 'left' },
        { data: 'actions', name: 'actions' },
    ];
    var gift_redeems_table = $('#gift_redeems_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/gift-redeems',
        columns: gift_redeems_columns,
        fnDrawCallback: function (oSettings) {
            __currency_convert_recursively($('#gift_redeems_table'));
        },
    });

    var gift_vouchers_columns = [
        { data: 'voucher_name', name: 'voucher_name' },
        { data: 'voucher_value', name: 'voucher_value' },
        { data: 'expire_date', name: 'expire_date' },
        { data: 'count', name: 'count' },
        { data: 'sale', name: 'sale' },
        { data: 'notes', name: 'notes' },
        { data: 'actions', name: 'actions' },
    ];
    var gift_vouchers_table = $('#gift_vouchers_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/gift-vouchers',
        columns: gift_vouchers_columns,
        fnDrawCallback: function (oSettings) {
            var sale_total = sum_table_col($('#gift_vouchers_table'), 'voucher_value');
            $('#sale_total').text(sale_total);
            __currency_convert_recursively($('#gift_vouchers_table'));
        },
    });

    $('.gift_voucher_modal').on('shown.bs.modal', function (e) {
        //customer select
        $('#customer_id').select2({
            dropdownParent: $('.gift_voucher_modal'),
            ajax: {
                url: '/contacts/customers',
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term, // search term
                        page: params.page,
                    };
                },
                processResults: function (data) {
                    return {
                        results: data,
                    };
                },
            },
            templateResult: function (data) {
                var template = data.text + "<br>" + LANG.mobile + ": " + data.mobile;
                if (typeof (data.total_rp) != "undefined") {
                    var rp = data.total_rp ? data.total_rp : 0;
                    template += "<br><i class='fa fa-gift text-success'></i> " + rp;
                }

                return template;
            },
            minimumInputLength: 1,
            language: {
                noResults: function () {
                    var name = $('#customer_id')
                        .data('select2')
                        .dropdown.$search.val();
                    return (
                        '<h6>N/A</h6>'
                    );
                },
            },
            escapeMarkup: function (markup) {
                return markup;
            },
        });
        $('#to_contact_id').select2({
            dropdownParent: $('.gift_voucher_modal'),
            ajax: {
                url: '/contacts/customers',
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term, // search term
                        page: params.page,
                    };
                },
                processResults: function (data) {
                    return {
                        results: data,
                    };
                },
            },
            templateResult: function (data) {
                var template = data.text + "<br>" + LANG.mobile + ": " + data.mobile;
                if (typeof (data.total_rp) != "undefined") {
                    var rp = data.total_rp ? data.total_rp : 0;
                    template += "<br><i class='fa fa-gift text-success'></i> " + rp;
                }

                return template;
            },
            minimumInputLength: 1,
            language: {
                noResults: function () {
                    var name = $('#to_contact_id')
                        .data('select2')
                        .dropdown.$search.val();
                    return (
                        '<h6>N/A</h6>'
                    );
                },
            },
            escapeMarkup: function (markup) {
                return markup;
            },
        });
        //end
        $('#add_voucher_form,#edit_voucher_form,#assign_voucher_form,#redeem_gift_form').on('submit', (e) => {
            e.preventDefault();
            var data = $(e.target).serialize();
            $(e.target).find('button[type="submit"]').attr('disabled', true);
            $.ajax({
                method: 'POST',
                url: $(e.target).attr('action'),
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        $('div.gift_voucher_modal').modal('hide');
                        toastr.success(result.msg);
                        gift_vouchers_table.ajax.reload();
                        gift_redeems_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                        $('div.gift_voucher_modal').modal('hide');
                    }
                },
            });
        });
    });
    $(document).on('click', '.delete_redeem_button', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_contact,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            gift_redeems_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });
    $(document).on('click', '.delete_gift_voucher_button', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_contact,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            gift_vouchers_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });
    //end

    $('.update_order_status_modal').on('shown.bs.modal', function (event) {
        $('#update_outside_order_form').on('submit', (e) => {
            e.preventDefault();
            var data = $(e.target).serialize();
            $(e.target).find('button[type="submit"]').attr('disabled', true);
            $.ajax({
                method: 'POST',
                url: $(e.target).attr('action'),
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        $('div.update_order_status_modal').modal('hide');
                        toastr.success(result.msg);
                        outside_orders_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        });
    });
    $(document).on('click', '.delete_driver_button', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_contact,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            drivers_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });
    $(document).on('click', '.delete_outside_customer_button', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_contact,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            outside_customer_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });
    $(document).on('click', '.delete_outside_order_button', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_contact,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                var data = $(this).serialize();
                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            outside_orders_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    $('.contact_list_filter_date_range').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('.contact_list_filter_date_range').val(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
            contact_table.ajax.reload();
        }
    )


    $(document).on('click', 'a.print-outside-order-invoice', function (e) {
        e.preventDefault();
        var href = $(this).data('href');

        $.ajax({
            method: 'GET',
            url: href,
            dataType: 'json',
            success: function (result) {
                if (result.html_content != '') {
                    $('#receipt_section').html(result.html_content);
                    __currency_convert_recursively($('#receipt_section'));
                    __print_receipt('receipt_section');
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    // OUTSIDE_ORDER_END


    //Start: CRUD for Contacts
    //contacts table
    var contact_table_type = $('#contact_type').val();
    if (contact_table_type == 'supplier') {
        var columns = [
            { data: 'contact_id', name: 'contact_id' },
            { data: 'supplier_business_name', name: 'supplier_business_name' },
            { data: 'name', name: 'name' },
            { data: 'created_at', name: 'contacts.created_at' },
            { data: 'mobile', name: 'mobile' },
            { data: 'due', searchable: false, orderable: false },
            { data: 'return_due', searchable: false, orderable: false },
            { data: 'action', searchable: false, orderable: false },
        ];
    } else if (contact_table_type == 'customer') {
        var columns = [
            { data: 'contact_id', name: 'contact_id' },
            { data: 'name', name: 'name' },
            { data: 'created_at', name: 'contacts.created_at' },
            { data: 'renewal_count', name: 'contacts.renewal_count' }
        ];
        Array.prototype.push.apply(columns, [
            { data: 'customer_group', name: 'cg.name' },
            { data: 'address', name: 'address', orderable: false },
            { data: 'mobile', name: 'mobile' },
            { data: 'total_paid_value', name: 'total_paid_value' },
            { data: 'custom_field1', name: 'custom_field1' },
            { data: 'custom_field2', name: 'custom_field2' },
            { data: 'custom_field3', name: 'custom_field3' },
            { data: 'status', name: 'status' },
            { data: 'action', searchable: false, orderable: false }]);
    }

    var contact_table = $('#contact_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '/contacts?type=' + $('#contact_type').val(),
            data: function (d) {
                var start = $('.contact_list_filter_date_range').data('daterangepicker').startDate.format('YYYY-MM-DD');
                var end = $('.contact_list_filter_date_range').data('daterangepicker').endDate.format('YYYY-MM-DD');
                d.start_date = start;
                d.end_date = end;
                return d;
            }
        },
        columns: columns,
        fnDrawCallback: function (oSettings) {
            var total_due = sum_table_col($('#contact_table'), 'contact_due');
            $('#footer_contact_due').text(total_due);

            var total_return_due = sum_table_col($('#contact_table'), 'return_due');
            $('#footer_contact_return_due').text(total_return_due);
            var total_subscription = sum_table_col($('#contact_table'), 'total_paid_value');
            $('#footer_subscription_total').text(total_subscription);
            __currency_convert_recursively($('#contact_table'));

        },
    });

    //On display of add contact modal
    $('.contact_modal').on('shown.bs.modal', function (e) {
        if ($('select#contact_type').val() == 'customer') {
            $('div.supplier_fields').hide();
            $('div.customer_fields').show();
        } else if ($('select#contact_type').val() == 'supplier') {
            $('div.supplier_fields').show();
            $('div.customer_fields').hide();
        }

        $('select#contact_type').change(function () {
            var t = $(this).val();

            if (t == 'supplier') {
                $('div.supplier_fields').fadeIn();
                $('div.customer_fields').fadeOut();
            } else if (t == 'both') {
                $('div.supplier_fields').fadeIn();
                $('div.customer_fields').fadeIn();
            } else if (t == 'customer') {
                $('div.customer_fields').fadeIn();
                $('div.supplier_fields').fadeOut();
            }
        });

        $('form#contact_add_form, form#contact_edit_form')
            .submit(function (e) {
                e.preventDefault();
            })
            .validate({
                rules: {
                    contact_id: {
                        remote: {
                            url: '/contacts/check-contact-id',
                            type: 'post',
                            data: {
                                contact_id: function () {
                                    return $('#contact_id').val();
                                },
                                hidden_id: function () {
                                    if ($('#hidden_id').length) {
                                        return $('#hidden_id').val();
                                    } else {
                                        return '';
                                    }
                                },
                            },
                        },
                    },
                },
                messages: {
                    contact_id: {
                        remote: LANG.contact_id_already_exists,
                    },
                },
                submitHandler: function (form) {
                    e.preventDefault();
                    var data = $(form).serialize();
                    $(form)
                        .find('button[type="submit"]')
                        .attr('disabled', true);
                    $.ajax({
                        method: 'POST',
                        url: $(form).attr('action'),
                        dataType: 'json',
                        data: data,
                        success: function (result) {
                            if (result.success == true) {
                                $('div.contact_modal').modal('hide');
                                toastr.success(result.msg);
                                contact_table.ajax.reload();
                            } else {
                                toastr.error(result.msg);
                            }
                        },
                    });
                },
            });
    });

    $(document).on('click', '.edit_contact_button', function (e) {
        e.preventDefault();
        $('div.contact_modal').load($(this).attr('href'), function () {
            $(this).modal('show');
        });
    });

    $(document).on('click', '.delete_contact_button', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_contact,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            contact_table.ajax.reload();
                            regular_customers_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    //Start: CRUD for category
    //Category table
    var category_table = $('#category_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/categories',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
    });
    $(document).on('submit', 'form#category_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success === true) {
                    $('div.category_modal').modal('hide');
                    toastr.success(result.msg);
                    category_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });
    $(document).on('click', 'button.edit_category_button', function () {
        $('div.category_modal').load($(this).data('href'), function () {
            $(this).modal('show');

            $('form#category_edit_form').submit(function (e) {
                e.preventDefault();
                $(this)
                    .find('button[type="submit"]')
                    .attr('disabled', true);
                var data = $(this).serialize();

                $.ajax({
                    method: 'POST',
                    url: $(this).attr('action'),
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            $('div.category_modal').modal('hide');
                            toastr.success(result.msg);
                            category_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            });
        });
    });

    $(document).on('click', 'button.delete_category_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_category,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            toastr.success(result.msg);
                            category_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });
    //End: CRUD for category

    //Start: CRUD for product variations
    //Variations table
    var variation_table = $('#variation_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/variation-templates',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
    });
    $(document).on('click', '#add_variation_values', function () {
        var html =
            '<div class="form-group"><div class="col-sm-7 col-sm-offset-3"><input type="text" name="variation_values[]" class="form-control" required></div><div class="col-sm-2"><button type="button" class="btn btn-danger delete_variation_value">-</button></div></div>';
        $('#variation_values').append(html);
    });
    $(document).on('click', '.delete_variation_value', function () {
        $(this)
            .closest('.form-group')
            .remove();
    });
    $(document).on('submit', 'form#variation_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success === true) {
                    $('div.variation_modal').modal('hide');
                    toastr.success(result.msg);
                    variation_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    $(document).on('click', 'button.edit_variation_button', function () {
        $('div.variation_modal').load($(this).data('href'), function () {
            $(this).modal('show');

            $('form#variation_edit_form').submit(function (e) {
                $(this)
                    .find('button[type="submit"]')
                    .attr('disabled', true);
                e.preventDefault();
                var data = $(this).serialize();

                $.ajax({
                    method: 'POST',
                    url: $(this).attr('action'),
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            $('div.variation_modal').modal('hide');
                            toastr.success(result.msg);
                            variation_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            });
        });
    });

    $(document).on('click', 'button.delete_variation_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_variation,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            toastr.success(result.msg);
                            variation_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    var active = false;
    $(document).on('mousedown', '.drag-select', function (ev) {
        active = true;
        $('.active-cell').removeClass('active-cell'); // clear previous selection

        $(this).addClass('active-cell');
        cell_value = $(this)
            .find('input')
            .val();
    });
    $(document).on('mousemove', '.drag-select', function (ev) {
        if (active) {
            $(this).addClass('active-cell');
            $(this)
                .find('input')
                .val(cell_value);
        }
    });

    $(document).mouseup(function (ev) {
        active = false;
        if (
            !$(ev.target).hasClass('drag-select') &&
            !$(ev.target).hasClass('dpp') &&
            !$(ev.target).hasClass('dsp')
        ) {
            $('.active-cell').each(function () {
                $(this).removeClass('active-cell');
            });
        }
    });

    //End: CRUD for product variations
    $(document).on('change', '.toggler', function () {
        var parent_id = $(this).attr('data-toggle_id');
        if ($(this).is(':checked')) {
            $('#' + parent_id).removeClass('hide');
        } else {
            $('#' + parent_id).addClass('hide');
        }
    });
    //Start: CRUD for products
    $('#category_id').change(function () {
        get_sub_categories();
    });
    $(document).on('change', '#unit_id', function () {
        get_sub_units();
    });
    if ($('.product_form').length && !$('.product_form').hasClass('create')) {
        show_product_type_form();
    }
    $('#type').change(function () {
        show_product_type_form();
    });

    $(document).on('click', '#add_variation', function () {
        var row_index = $('#variation_counter').val();
        var action = $(this).attr('data-action');
        $.ajax({
            method: 'POST',
            url: '/products/get_product_variation_row',
            data: { row_index: row_index, action: action },
            dataType: 'html',
            success: function (result) {
                if (result) {
                    $('#product_variation_form_part  > tbody').append(result);
                    $('#variation_counter').val(parseInt(row_index) + 1);
                    toggle_dsp_input();
                }
            },
        });
    });
    //End: CRUD for products

    //bussiness settings start

    if ($('form#bussiness_edit_form').length > 0) {
        $('form#bussiness_edit_form').validate({
            ignore: [],
        });

        // logo upload
        $('#business_logo').fileinput(fileinput_setting);

        //Purchase currency
        $('input#purchase_in_diff_currency').on('ifChecked', function (event) {
            $('div#settings_purchase_currency_div, div#settings_currency_exchange_div').removeClass(
                'hide'
            );
        });
        $('input#purchase_in_diff_currency').on('ifUnchecked', function (event) {
            $('div#settings_purchase_currency_div, div#settings_currency_exchange_div').addClass(
                'hide'
            );
        });

        //Product expiry
        $('input#enable_product_expiry').change(function () {
            if ($(this).is(':checked')) {
                $('select#expiry_type').attr('disabled', false);
                $('div#on_expiry_div').removeClass('hide');
            } else {
                $('select#expiry_type').attr('disabled', true);
                $('div#on_expiry_div').addClass('hide');
            }
        });

        $('select#on_product_expiry').change(function () {
            if ($(this).val() == 'stop_selling') {
                $('input#stop_selling_before').attr('disabled', false);
                $('input#stop_selling_before')
                    .focus()
                    .select();
            } else {
                $('input#stop_selling_before').attr('disabled', true);
            }
        });

        //enable_category
        $('input#enable_category').on('ifChecked', function (event) {
            $('div.enable_sub_category').removeClass('hide');
        });
        $('input#enable_category').on('ifUnchecked', function (event) {
            $('div.enable_sub_category').addClass('hide');
        });
    }
    //bussiness settings end

    $('#upload_document').fileinput(fileinput_setting);

    //user profile
    $('form#edit_user_profile_form').validate();
    $('form#edit_password_form').validate({
        rules: {
            current_password: {
                required: true,
                minlength: 5,
            },
            new_password: {
                required: true,
                minlength: 5,
            },
            confirm_password: {
                equalTo: '#new_password',
            },
        },
    });

    //Tax Rates table
    var tax_groups_table = $('#tax_groups_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/group-taxes',
        columnDefs: [
            {
                targets: [2, 3],
                orderable: false,
                searchable: false,
            },
        ],
        columns: [
            { data: 'name', name: 'name' },
            { data: 'amount', name: 'amount' },
            { data: 'sub_taxes', name: 'sub_taxes' },
            { data: 'action', name: 'action' },
        ],
    });
    $('.tax_group_modal').on('shown.bs.modal', function () {
        $('.tax_group_modal')
            .find('.select2')
            .each(function () {
                __select2($(this));
            });
    });

    $(document).on('submit', 'form#tax_group_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.tax_group_modal').modal('hide');
                    toastr.success(result.msg);
                    tax_groups_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    $(document).on('submit', 'form#tax_group_edit_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.tax_group_modal').modal('hide');
                    toastr.success(result.msg);
                    tax_groups_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    $(document).on('click', 'button.delete_tax_group_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_tax_group,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            tax_groups_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    //option-div
    $(document).on('click', '.option-div-group .option-div', function () {
        $(this)
            .closest('.option-div-group')
            .find('.option-div')
            .each(function () {
                $(this).removeClass('active');
            });
        $(this).addClass('active');
        $(this)
            .find('input:radio')
            .prop('checked', true)
            .change();
    });

    $(document).on('change', 'input[type=radio][name=scheme_type]', function () {
        $('#invoice_format_settings').removeClass('hide');
        var scheme_type = $(this).val();
        if (scheme_type == 'blank') {
            $('#prefix')
                .val('')
                .attr('placeholder', 'XXXX')
                .prop('disabled', false);
        } else if (scheme_type == 'year') {
            var d = new Date();
            var this_year = d.getFullYear();
            $('#prefix')
                .val(this_year + '-')
                .attr('placeholder', '')
                .prop('disabled', true);
        }
        show_invoice_preview();
    });
    $(document).on('change', '#prefix', function () {
        show_invoice_preview();
    });
    $(document).on('keyup', '#prefix', function () {
        show_invoice_preview();
    });
    $(document).on('keyup', '#start_number', function () {
        show_invoice_preview();
    });
    $(document).on('change', '#total_digits', function () {
        show_invoice_preview();
    });
    var invoice_table = $('#invoice_table').DataTable({
        processing: true,
        serverSide: true,
        bPaginate: false,
        buttons: [],
        ajax: '/invoice-schemes',
        columnDefs: [
            {
                targets: 4,
                orderable: false,
                searchable: false,
            },
        ],
    });
    $(document).on('submit', 'form#invoice_scheme_add_form', function (e) {
        e.preventDefault();
        $(this)
            .find('button[type="submit"]')
            .attr('disabled', true);
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.invoice_modal').modal('hide');
                    $('div.invoice_edit_modal').modal('hide');
                    toastr.success(result.msg);
                    invoice_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });
    $(document).on('click', 'button.set_default_invoice', function () {
        var href = $(this).data('href');
        var data = $(this).serialize();

        $.ajax({
            method: 'get',
            url: href,
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success === true) {
                    toastr.success(result.msg);
                    invoice_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });
    $('.invoice_edit_modal').on('shown.bs.modal', function () {
        show_invoice_preview();
    });
    $(document).on('click', 'button.delete_invoice_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.delete_invoice_confirm,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            toastr.success(result.msg);
                            invoice_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    $('#add_barcode_settings_form').validate();
    $(document).on('change', '#is_continuous', function () {
        if ($(this).is(':checked')) {
            $('.stickers_per_sheet_div').addClass('hide');
            $('.paper_height_div').addClass('hide');
        } else {
            $('.stickers_per_sheet_div').removeClass('hide');
            $('.paper_height_div').removeClass('hide');
        }
    });

    //initialize iCheck
    $('input[type="checkbox"].input-icheck, input[type="radio"].input-icheck').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
    });
    $(document).on('ifChecked', '.check_all', function () {
        $(this)
            .closest('.check_group')
            .find('.input-icheck')
            .each(function () {
                $(this).iCheck('check');
            });
    });
    $(document).on('ifUnchecked', '.check_all', function () {
        $(this)
            .closest('.check_group')
            .find('.input-icheck')
            .each(function () {
                $(this).iCheck('uncheck');
            });
    });
    $('.check_all').each(function () {
        var length = 0;
        var checked_length = 0;
        $(this)
            .closest('.check_group')
            .find('.input-icheck')
            .each(function () {
                length += 1;
                if ($(this).iCheck('update')[0].checked) {
                    checked_length += 1;
                }
            });
        length = length - 1;
        if (checked_length != 0 && length == checked_length) {
            $(this).iCheck('check');
        }
    });

    //Business locations CRUD
    business_locations = $('#business_location_table').DataTable({
        processing: true,
        serverSide: true,
        bPaginate: false,
        buttons: [],
        ajax: '/business-location',
        columnDefs: [
            {
                targets: 10,
                orderable: false,
                searchable: false,
            },
        ],
    });
    $('.location_add_modal, .location_edit_modal').on('shown.bs.modal', function (e) {
        $('form#business_location_add_form')
            .submit(function (e) {
                e.preventDefault();
            })
            .validate({
                rules: {
                    location_id: {
                        remote: {
                            url: '/business-location/check-location-id',
                            type: 'post',
                            data: {
                                location_id: function () {
                                    return $('#location_id').val();
                                },
                                hidden_id: function () {
                                    if ($('#hidden_id').length) {
                                        return $('#hidden_id').val();
                                    } else {
                                        return '';
                                    }
                                },
                            },
                        },
                    },
                },
                messages: {
                    location_id: {
                        remote: LANG.location_id_already_exists,
                    },
                },
                submitHandler: function (form) {
                    e.preventDefault();
                    $(form)
                        .find('button[type="submit"]')
                        .attr('disabled', true);
                    var data = $(form).serialize();

                    $.ajax({
                        method: 'POST',
                        url: $(form).attr('action'),
                        dataType: 'json',
                        data: data,
                        success: function (result) {
                            if (result.success == true) {
                                $('div.location_add_modal').modal('hide');
                                $('div.location_edit_modal').modal('hide');
                                toastr.success(result.msg);
                                business_locations.ajax.reload();
                            } else {
                                toastr.error(result.msg);
                            }
                        },
                    });
                },
            });
    });

    if ($('#header_text').length) {
        CKEDITOR.replace('header_text');
    }
    if ($('#footer_text').length) {
        CKEDITOR.replace('footer_text');
    }

    //Start: CRUD for expense category
    //Expense category table
    var expense_cat_table = $('#expense_category_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/expense-categories',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
    });
    $(document).on('submit', 'form#expense_category_add_form', function (e) {
        e.preventDefault();
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success === true) {
                    $('div.expense_category_modal').modal('hide');
                    toastr.success(result.msg);
                    expense_cat_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });
    $(document).on('click', 'button.delete_expense_category', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_expense_category,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            toastr.success(result.msg);
                            expense_cat_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    //date filter for expense table
    if ($('#expense_date_range').length == 1) {
        $('#expense_date_range').daterangepicker(dateRangeSettings, function (start, end) {
            $('#expense_date_range').val(
                start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format)
            );
            expense_table.ajax.reload();
        });
        $('#expense_date_range').on('cancel.daterangepicker', function (ev, picker) {
            $('#product_sr_date_filter').val('');
            expense_table.ajax.reload();
        });
        $('#expense_date_range')
            .data('daterangepicker')
            .setStartDate(moment().startOf('month'));
        $('#expense_date_range')
            .data('daterangepicker')
            .setEndDate(moment().endOf('month'));
    }

    //Expense table
    expense_table = $('#expense_table').DataTable({
        processing: true,
        serverSide: true,
        aaSorting: [[1, 'desc']],
        ajax: {
            url: '/expenses',
            data: function (d) {
                d.expense_for = $('select#expense_for').val();
                d.location_id = $('select#location_id').val();
                d.expense_category_id = $('select#expense_category_id').val();
                d.payment_status = $('select#expense_payment_status').val();
                d.start_date = $('input#expense_date_range')
                    .data('daterangepicker')
                    .startDate.format('YYYY-MM-DD');
                d.end_date = $('input#expense_date_range')
                    .data('daterangepicker')
                    .endDate.format('YYYY-MM-DD');
            },
        },
        columns: [
            { data: 'action', name: 'action', orderable: false, searchable: false },
            { data: 'transaction_date', name: 'transaction_date' },
            { data: 'ref_no', name: 'ref_no' },
            { data: 'category', name: 'ec.name' },
            { data: 'location_name', name: 'bl.name' },
            { data: 'payment_status', name: 'payment_status', orderable: false },
            { data: 'tax', name: 'tr.name' },
            { data: 'final_total', name: 'final_total' },
            { data: 'payment_due', name: 'payment_due' },
            { data: 'expense_for', name: 'expense_for' },
            { data: 'additional_notes', name: 'additional_notes' },
            { data: 'added_by', name: 'usr.first_name' },
        ],
        fnDrawCallback: function (oSettings) {
            var expense_total = sum_table_col($('#expense_table'), 'final-total');
            $('#footer_expense_total').text(expense_total);
            var total_due = sum_table_col($('#expense_table'), 'payment_due');
            $('#footer_total_due').text(total_due);

            $('#footer_payment_status_count').html(
                __sum_status_html($('#expense_table'), 'payment-status')
            );

            __currency_convert_recursively($('#expense_table'));
        },
        createdRow: function (row, data, dataIndex) {
            $(row)
                .find('td:eq(4)')
                .attr('class', 'clickable_td');
        },
    });

    $('select#location_id, select#expense_for, select#expense_category_id, select#expense_payment_status').on(
        'change',
        function () {
            expense_table.ajax.reload();
        }
    );

    //Date picker
    $('#expense_transaction_date').datetimepicker({
        format: moment_date_format + ' ' + moment_time_format,
        ignoreReadonly: true,
    });

    $(document).on('click', 'a.delete_expense', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_expense,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success === true) {
                            toastr.success(result.msg);
                            expense_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    $(document).on('change', '.payment_types_dropdown', function () {
        var payment_type = $(this).val();
        var to_show = null;

        $(this)
            .closest('.payment_row')
            .find('.payment_details_div')
            .each(function () {
                if ($(this).attr('data-type') == payment_type) {
                    to_show = $(this);
                } else {
                    if (!$(this).hasClass('hide')) {
                        $(this).addClass('hide');
                    }
                }
            });

        if (to_show && to_show.hasClass('hide')) {
            to_show.removeClass('hide');
            to_show
                .find('input')
                .filter(':visible:first')
                .focus();
        }
    });

    //Expense Report
    expense_table_v2 = $('#expense_table_v2').DataTable({
        processing: true,
        serverSide: true,
        aaSorting: [[1, 'desc']],
        ajax: {
            url: '/reports/expense-report',
            data: function (d) {
                d.expense_for = $('select#expense_for').val();
                d.location_id = $('select#location_id').val();
                d.expense_category_id = $('select#expense_category_id').val();
                d.payment_status = $('select#expense_payment_status').val();
                d.start_date = $('input#expense_date_range')
                    .data('daterangepicker')
                    .startDate.format('YYYY-MM-DD');
                d.end_date = $('input#expense_date_range')
                    .data('daterangepicker')
                    .endDate.format('YYYY-MM-DD');
            },
        },
        columns: [

            { data: 'id', name: 'id' },
            { data: 'transaction_date', name: 'transaction_date' },
            { data: 'ref_no', name: 'ref_no' },
            { data: 'category', name: 'ec.name' },
            { data: 'location_name', name: 'bl.name' },
            { data: 'payment_status', name: 'payment_status', orderable: false },
            { data: 'tax', name: 'tr.name' },
            { data: 'final_total', name: 'final_total' },
            { data: 'payment_due', name: 'payment_due' },
            { data: 'expense_for', name: 'expense_for' },
            { data: 'additional_notes', name: 'additional_notes' },
            { data: 'added_by', name: 'usr.first_name' },
        ],
        fnDrawCallback: function (oSettings) {
            var expense_total = sum_table_col($('#expense_table_v2'), 'final-total');
            $('#footer_expense_total').text(expense_total);
            var total_due = sum_table_col($('#expense_table_v2'), 'payment_due');
            $('#footer_total_due').text(total_due);

            $('#footer_payment_status_count').html(
                __sum_status_html($('#expense_table_v2'), 'payment-status')
            );

            __currency_convert_recursively($('#expense_table_v2'));
        },
        createdRow: function (row, data, dataIndex) {
            $(row)
                .find('td:eq(4)')
                .attr('class', 'clickable_td');
        },
    });

    $('select#location_id, select#expense_for, select#expense_category_id, select#expense_payment_status').on(
        'change',
        function () {
            expense_table_v2.ajax.reload();
        }
    );

    //Start: CRUD operation for printers

    //Add Printer
    if ($('form#add_printer_form').length == 1) {
        printer_connection_type_field($('select#connection_type').val());
        $('select#connection_type').change(function () {
            var ctype = $(this).val();
            printer_connection_type_field(ctype);
        });

        $('form#add_printer_form').validate();
    }

    //Business Location Receipt setting
    if ($('form#bl_receipt_setting_form').length == 1) {
        if ($('select#receipt_printer_type').val() == 'printer') {
            $('div#location_printer_div').removeClass('hide');
        } else {
            $('div#location_printer_div').addClass('hide');
        }

        $('select#receipt_printer_type').change(function () {
            var printer_type = $(this).val();
            if (printer_type == 'printer') {
                $('div#location_printer_div').removeClass('hide');
            } else {
                $('div#location_printer_div').addClass('hide');
            }
        });

        $('form#bl_receipt_setting_form').validate();
    }

    $(document).on('click', 'a.pay_purchase_due, a.pay_sale_due', function (e) {
        e.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            dataType: 'html',
            success: function (result) {
                $('.pay_contact_due_modal')
                    .html(result)
                    .modal('show');
                __currency_convert_recursively($('.pay_contact_due_modal'));
                $('#paid_on').datetimepicker({
                    format: moment_date_format + ' ' + moment_time_format,
                    ignoreReadonly: true,
                });
                $('.pay_contact_due_modal')
                    .find('form#pay_contact_due_form')
                    .validate();
            },
        });
    });

    //Todays profit modal
    $('#view_todays_profit').click(function () {
        $('#todays_profit_modal').modal('show');
    });
    $('#todays_profit_modal').on('shown.bs.modal', function () {
        var start = $('#modal_today').val();
        var end = start;
        var location_id = '';

        updateProfitLoss(start, end, location_id);
    });

    //Used for Purchase & Sell invoice.
    $(document).on('click', 'a.print-invoice', function (e) {
        e.preventDefault();
        var href = $(this).data('href');

        $.ajax({
            method: 'GET',
            url: href,
            dataType: 'json',
            success: function (result) {
                if (result.success == 1 && result.receipt.html_content != '') {
                    $('#receipt_section').html(result.receipt.html_content);
                    __currency_convert_recursively($('#receipt_section'));
                    __print_receipt('receipt_section');
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    //Sales commission agent
    var sales_commission_agent_table = $('#sales_commission_agent_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/sales-commission-agents',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
        columns: [
            { data: 'full_name' },
            { data: 'email' },
            { data: 'contact_no' },
            { data: 'address' },
            { data: 'cmmsn_percent' },
            { data: 'action' },
        ],
    });
    $('div.commission_agent_modal').on('shown.bs.modal', function (e) {
        $('form#sale_commission_agent_form')
            .submit(function (e) {
                e.preventDefault();
            })
            .validate({
                submitHandler: function (form) {
                    e.preventDefault();
                    var data = $(form).serialize();

                    $.ajax({
                        method: $(form).attr('method'),
                        url: $(form).attr('action'),
                        dataType: 'json',
                        data: data,
                        success: function (result) {
                            if (result.success == true) {
                                $('div.commission_agent_modal').modal('hide');
                                toastr.success(result.msg);
                                sales_commission_agent_table.ajax.reload();
                            } else {
                                toastr.error(result.msg);
                            }
                        },
                    });
                },
            });
    });
    $(document).on('click', 'button.delete_commsn_agnt_button', function () {
        swal({
            title: LANG.sure,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();
                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            sales_commission_agent_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    $('button#full_screen').click(function (e) {
        element = document.documentElement;
        if (screenfull.enabled) {
            screenfull.toggle(element);
        }
    });

    $(document).on('submit', 'form#customer_group_add_form', function (e) {
        e.preventDefault();
        var data = $(this).serialize();

        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.success == true) {
                    $('div.customer_groups_modal').modal('hide');
                    toastr.success(result.msg);
                    customer_groups_table.ajax.reload();
                } else {
                    toastr.error(result.msg);
                }
            },
        });
    });

    //Customer Group table
    var customer_groups_table = $('#customer_groups_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/customer-group',
        columnDefs: [
            {
                targets: 2,
                orderable: false,
                searchable: false,
            },
        ],
    });

    $(document).on('click', 'button.edit_customer_group_button', function () {
        $('div.customer_groups_modal').load($(this).data('href'), function () {
            $(this).modal('show');
            $('form#customer_group_edit_form').submit(function (e) {
                e.preventDefault();
                var data = $(this).serialize();

                $.ajax({
                    method: 'POST',
                    url: $(this).attr('action'),
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            $('div.customer_groups_modal').modal('hide');
                            toastr.success(result.msg);
                            customer_groups_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            });
        });
    });

    $(document).on('click', 'button.delete_customer_group_button', function () {
        swal({
            title: LANG.sure,
            text: LANG.confirm_delete_customer_group,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).data('href');
                var data = $(this).serialize();

                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    data: data,
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            customer_groups_table.ajax.reload();
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    //Delete Sale
    $(document).on('click', '.delete-sale', function (e) {
        e.preventDefault();
        swal({
            title: LANG.sure,
            icon: 'warning',
            buttons: true,
            dangerMode: true,
        }).then(willDelete => {
            if (willDelete) {
                var href = $(this).attr('href');
                $.ajax({
                    method: 'DELETE',
                    url: href,
                    dataType: 'json',
                    success: function (result) {
                        if (result.success == true) {
                            toastr.success(result.msg);
                            if (typeof sell_table !== 'undefined') {
                                sell_table.ajax.reload();
                            }
                            //Displays list of recent transactions
                            if (typeof get_recent_transactions !== 'undefined') {
                                get_recent_transactions('final', $('div#tab_final'));
                                get_recent_transactions('draft', $('div#tab_draft'));
                                get_draft_transactions();
                            }
                        } else {
                            toastr.error(result.msg);
                        }
                    },
                });
            }
        });
    });

    if ($('form#add_invoice_layout_form').length > 0) {
        $('select#design').change(function () {
            if ($(this).val() == 'columnize-taxes') {
                $('div#columnize-taxes').removeClass('hide');
                $('div#columnize-taxes')
                    .find('input')
                    .removeAttr('disabled', 'false');
            } else {
                $('div#columnize-taxes').addClass('hide');
                $('div#columnize-taxes')
                    .find('input')
                    .attr('disabled', 'true');
            }
        });
    }

    $(document).on('keyup', 'form#unit_add_form input#actual_name', function () {
        $('form#unit_add_form span#unit_name').text($(this).val());
    });
    $(document).on('keyup', 'form#unit_edit_form input#actual_name', function () {
        $('form#unit_edit_form span#unit_name').text($(this).val());
    });

    $('#user_dob').datepicker({
        autoclose: true
    });
});

$('.quick_add_product_modal').on('shown.bs.modal', function () {
    $('.quick_add_product_modal')
        .find('.select2')
        .each(function () {
            var $p = $(this).parent();
            $(this).select2({ dropdownParent: $p });
        });
    $('.quick_add_product_modal')
        .find('input[type="checkbox"].input-icheck')
        .each(function () {
            $(this).iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
            });
        });
});

discounts_table = $('#discounts_table').DataTable({
    processing: true,
    serverSide: true,
    ajax: base_path + '/discount',
    columnDefs: [
        {
            targets: [0, 8],
            orderable: false,
            searchable: false,
        },
    ],
    aaSorting: [1, 'asc'],
    columns: [
        { data: 'row_select' },
        { data: 'name', name: 'discounts.name' },
        { data: 'starts_at', name: 'starts_at' },
        { data: 'ends_at', name: 'ends_at' },
        { data: 'priority', name: 'priority' },
        { data: 'brand', name: 'b.name' },
        { data: 'category', name: 'c.name' },
        { data: 'location', name: 'l.name' },
        { data: 'action', name: 'action' },
    ],
});

$('.discount_modal').on('shown.bs.modal', function () {
    $('.discount_modal')
        .find('.select2')
        .each(function () {
            var $p = $(this).parent();
            $(this).select2({ dropdownParent: $p });
        });
    $('.discount_modal')
        .find('input[type="checkbox"].input-icheck')
        .each(function () {
            $(this).iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
            });
        });
    //Datetime picker
    $('.discount_modal .discount_date').datetimepicker({
        format: moment_date_format + ' ' + moment_time_format,
        ignoreReadonly: true,
    });
    $('form#discount_form').validate();
});

$(document).on('submit', 'form#discount_form', function (e) {
    e.preventDefault();
    var data = $(this).serialize();

    $.ajax({
        method: $(this).attr('method'),
        url: $(this).attr('action'),
        dataType: 'json',
        data: data,
        success: function (result) {
            if (result.success == true) {
                $('div.discount_modal').modal('hide');
                toastr.success(result.msg);
                discounts_table.ajax.reload();
            } else {
                toastr.error(result.msg);
            }
        },
    });
});

$(document).on('click', 'button.delete_discount_button', function () {
    swal({
        title: LANG.sure,
        icon: 'warning',
        buttons: true,
        dangerMode: true,
    }).then(willDelete => {
        if (willDelete) {
            var href = $(this).data('href');
            var data = $(this).serialize();

            $.ajax({
                method: 'DELETE',
                url: href,
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        toastr.success(result.msg);
                        discounts_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        }
    });
});

function printer_connection_type_field(ctype) {
    if (ctype == 'network') {
        $('div#path_div').addClass('hide');
        $('div#ip_address_div, div#port_div').removeClass('hide');
    } else if (ctype == 'windows' || ctype == 'linux') {
        $('div#path_div').removeClass('hide');
        $('div#ip_address_div, div#port_div').addClass('hide');
    }
}

function show_invoice_preview() {
    var prefix = $('#prefix').val();
    var start_number = $('#start_number').val();
    var total_digits = $('#total_digits').val();
    var preview = prefix + pad_zero(start_number, total_digits);
    $('#preview_format').text('#' + preview);
}
function pad_zero(str, max) {
    str = str.toString();
    return str.length < max ? pad_zero('0' + str, max) : str;
}
function get_sub_categories() {
    var cat = $('#category_id').val();
    $.ajax({
        method: 'POST',
        url: '/products/get_sub_categories',
        dataType: 'html',
        data: { cat_id: cat },
        success: function (result) {
            if (result) {
                $('#sub_category_id').html(result);
            }
        },
    });
}
function get_sub_units() {
    //Add dropdown for sub units if sub unit field is visible
    if ($('#sub_unit_ids').is(':visible')) {
        var unit_id = $('#unit_id').val();
        $.ajax({
            method: 'GET',
            url: '/products/get_sub_units',
            dataType: 'html',
            data: { unit_id: unit_id },
            success: function (result) {
                if (result) {
                    $('#sub_unit_ids').html(result);
                }
            },
        });
    }
}
function show_product_type_form() {

    //Disable Stock management & Woocommmerce sync if type combo
    if ($('#type').val() == 'combo') {
        $('#enable_stock').iCheck('uncheck');
        $('input[name="woocommerce_disable_sync"]').iCheck('check');
    }

    var action = $('#type').attr('data-action');
    var product_id = $('#type').attr('data-product_id');
    $.ajax({
        method: 'POST',
        url: '/products/product_form_part',
        dataType: 'html',
        data: { type: $('#type').val(), product_id: product_id, action: action },
        success: function (result) {
            if (result) {
                $('#product_form_part').html(result);
                toggle_dsp_input();
            }
        },
    });
}

$(document).on('click', 'table.ajax_view tbody tr', function (e) {
    if (
        !$(e.target).is('td.selectable_td input[type=checkbox]') &&
        !$(e.target).is('td.selectable_td') &&
        !$(e.target).is('td.clickable_td') &&
        !$(e.target).is('a') &&
        !$(e.target).is('button') &&
        !$(e.target).hasClass('label') &&
        !$(e.target).is('li') &&
        $(this).data('href') &&
        !$(e.target).is('i')
    ) {
        $.ajax({
            url: $(this).data('href'),
            dataType: 'html',
            success: function (result) {
                $('.view_modal')
                    .html(result)
                    .modal('show');
            },
        });
    }
});
$(document).on('click', 'td.clickable_td', function (e) {
    e.preventDefault();
    e.stopPropagation();
    if (e.target.tagName == 'SPAN') {
        return false;
    }
    var link = $(this).find('a');
    if (link.length) {
        if (!link.hasClass('no-ajax')) {
            var href = link.attr('href');
            var container = $('.payment_modal');

            $.ajax({
                url: href,
                dataType: 'html',
                success: function (result) {
                    $(container)
                        .html(result)
                        .modal('show');
                    __currency_convert_recursively(container);
                },
            });
        }
    }
});

$(document).on('click', 'button.select-all', function () {
    var this_select = $(this)
        .closest('.form-group')
        .find('select');
    this_select.find('option').each(function () {
        $(this).prop('selected', 'selected');
    });
    this_select.trigger('change');
});
$(document).on('click', 'button.deselect-all', function () {
    var this_select = $(this)
        .closest('.form-group')
        .find('select');
    this_select.find('option').each(function () {
        $(this).prop('selected', '');
    });
    this_select.trigger('change');
});

$(document).on('change', 'input.row-select', function () {
    if (this.checked) {
        $(this)
            .closest('tr')
            .addClass('selected');
    } else {
        $(this)
            .closest('tr')
            .removeClass('selected');
    }
});

$(document).on('click', '#select-all-row', function (e) {
    if (this.checked) {
        $(this)
            .closest('table')
            .find('tbody')
            .find('input.row-select')
            .each(function () {
                if (!this.checked) {
                    $(this)
                        .prop('checked', true)
                        .change();
                }
            });
    } else {
        $(this)
            .closest('table')
            .find('tbody')
            .find('input.row-select')
            .each(function () {
                if (this.checked) {
                    $(this)
                        .prop('checked', false)
                        .change();
                }
            });
    }
});

$(document).on('click', 'a.view_purchase_return_payment_modal', function (e) {
    e.preventDefault();
    e.stopPropagation();
    var href = $(this).attr('href');
    var container = $('.payment_modal');

    $.ajax({
        url: href,
        dataType: 'html',
        success: function (result) {
            $(container)
                .html(result)
                .modal('show');
            __currency_convert_recursively(container);
        },
    });
});

$(document).on('click', 'a.view_invoice_url', function (e) {
    e.preventDefault();
    $('div.view_modal').load($(this).attr('href'), function () {
        $(this).modal('show');
    });
    return false;
});
$(document).on('click', '.load_more_notifications', function (e) {
    e.preventDefault();
    var this_link = $(this);
    this_link.text(LANG.loading + '...');
    this_link.attr('disabled', true);
    var page = parseInt($('input#notification_page').val()) + 1;
    var href = '/load-more-notifications?page=' + page;
    $.ajax({
        url: href,
        dataType: 'html',
        success: function (result) {
            if ($('li.no-notification').length == 0) {
                $(result).insertBefore(this_link.closest('li'));
            }

            this_link.text(LANG.load_more);
            this_link.removeAttr('disabled');
            $('input#notification_page').val(page);
        },
    });
    return false;
});

$(document).on('click', 'a.load_notifications', function (e) {
    if (!$(this).data('loaded')) {
        e.preventDefault();
        $('li.load_more_li').addClass('hide');
        var this_link = $(this);
        var href = '/load-more-notifications?page=1';
        $('span.notifications_count').html(__fa_awesome());
        $.ajax({
            url: href,
            dataType: 'html',
            success: function (result) {
                $('ul#notifications_list').prepend(result);
                $('span.notifications_count').text('');
                this_link.data('loaded', true);
                $('li.load_more_li').removeClass('hide');
            },
        });
    }
});

$(document).on('click', 'a.delete_purchase_return', function (e) {
    e.preventDefault();
    swal({
        title: LANG.sure,
        icon: 'warning',
        buttons: true,
        dangerMode: true,
    }).then(willDelete => {
        if (willDelete) {
            var href = $(this).attr('href');
            var data = $(this).serialize();

            $.ajax({
                method: 'DELETE',
                url: href,
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        toastr.success(result.msg);
                        purchase_return_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        }
    });
});

$(document).on('submit', 'form#types_of_service_form', function (e) {
    e.preventDefault();
    var data = $(this).serialize();
    $(this).find('button[type="submit"]').attr('disabled', true);
    $.ajax({
        method: $(this).attr('method'),
        url: $(this).attr('action'),
        dataType: 'json',
        data: data,
        success: function (result) {
            if (result.success == true) {
                $('div.type_of_service_modal').modal('hide');
                toastr.success(result.msg);
                types_of_service_table.ajax.reload();
            } else {
                toastr.error(result.msg);
            }
        },
    });
});

types_of_service_table = $('#types_of_service_table').DataTable({
    processing: true,
    serverSide: true,
    ajax: base_path + '/types-of-service',
    columnDefs: [
        {
            targets: [3],
            orderable: false,
            searchable: false,
        },
    ],
    aaSorting: [1, 'asc'],
    columns: [
        { data: 'name', name: 'name' },
        { data: 'description', name: 'description' },
        { data: 'packing_charge', name: 'packing_charge' },
        { data: 'action', name: 'action' },
    ],
    fnDrawCallback: function (oSettings) {
        __currency_convert_recursively($('#types_of_service_table'));
    },
});

$(document).on('click', 'button.delete_type_of_service', function (e) {
    e.preventDefault();
    swal({
        title: LANG.sure,
        icon: 'warning',
        buttons: true,
        dangerMode: true,
    }).then(willDelete => {
        if (willDelete) {
            var href = $(this).data('href');
            var data = $(this).serialize();

            $.ajax({
                method: 'DELETE',
                url: href,
                dataType: 'json',
                data: data,
                success: function (result) {
                    if (result.success == true) {
                        toastr.success(result.msg);
                        types_of_service_table.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        }
    });
});

$(document).on('submit', 'form#edit_shipping_form', function (e) {
    e.preventDefault();
    var data = $(this).serialize();
    $(this)
        .find('button[type="submit"]')
        .attr('disabled', true);
    $.ajax({
        method: $(this).attr('method'),
        url: $(this).attr('action'),
        dataType: 'json',
        data: data,
        success: function (result) {
            if (result.success == true) {
                $('div.view_modal').modal('hide');
                toastr.success(result.msg);
                sell_table.ajax.reload();
            } else {
                toastr.error(result.msg);
            }
        },
    });
});

$(document).on('show.bs.modal', '.register_details_modal, .close_register_modal', function () {
    __currency_convert_recursively($(this));
});

function updateProfitLoss(start = null, end = null, location_id = null) {
    if (start == null) {
        var start = $('#profit_loss_date_filter')
            .data('daterangepicker')
            .startDate.format('YYYY-MM-DD');
    }

    if (end == null) {
        var end = $('#profit_loss_date_filter')
            .data('daterangepicker')
            .endDate.format('YYYY-MM-DD');
    }

    if (location_id == null) {
        var location_id = $('#profit_loss_location_filter').val();
    }

    var data = { start_date: start, end_date: end, location_id: location_id };

    var loader = __fa_awesome();
    var pl_span = $('span#pl_span');

    pl_span.find(
        '.opening_stock, .total_transfer_shipping_charges, .closing_stock, .total_sell, .total_purchase, \
        .total_expense, .net_profit, .total_adjustment, .total_recovered, .total_sell_discount, \
        .total_purchase_discount, .total_purchase_return, .total_sell_return, .gross_profit, \
        .total_reward_amount, .total_payroll,#profit_loss_payments'
    ).html(loader);


    $.ajax({
        method: 'GET',
        url: '/reports/profit-loss',
        dataType: 'json',
        data: data,
        success: function (data) {
            pl_span.find('.opening_stock').html(__currency_trans_from_en(data.opening_stock, true));
            pl_span.find('.closing_stock').html(__currency_trans_from_en(data.closing_stock, true));
            pl_span.find('.total_sell').html(__currency_trans_from_en(data.total_sell, true));
            pl_span.find('.total_purchase').html(__currency_trans_from_en(data.total_purchase, true));
            pl_span.find('.total_expense').html(__currency_trans_from_en(data.total_expense, true));

            if ($('.total_payroll').length > 0) {
                pl_span.find('.total_payroll').html(__currency_trans_from_en(data.total_payroll, true));
            }

            if ($('.total_production_cost').length > 0) {
                pl_span.find('.total_production_cost').html(__currency_trans_from_en(data.total_production_cost, true));
            }

            pl_span.find('.net_profit').html(__currency_trans_from_en(data.net_profit, true));
            pl_span.find('.gross_profit').html(__currency_trans_from_en(data.gross_profit, true));
            pl_span.find('.total_adjustment').html(__currency_trans_from_en(data.total_adjustment, true));
            pl_span.find('.total_recovered').html(__currency_trans_from_en(data.total_recovered, true));
            pl_span.find('.total_purchase_return').html(
                __currency_trans_from_en(data.total_purchase_return, true)
            );
            pl_span.find('.total_transfer_shipping_charges').html(
                __currency_trans_from_en(data.total_transfer_shipping_charges, true)
            );
            pl_span.find('.total_purchase_discount').html(
                __currency_trans_from_en(data.total_purchase_discount, true)
            );
            pl_span.find('.total_sell_discount').html(
                __currency_trans_from_en(data.total_sell_discount, true)
            );
            pl_span.find('.total_reward_amount').html(
                __currency_trans_from_en(data.total_reward_amount, true)
            );
            pl_span.find('.total_sell_return').html(__currency_trans_from_en(data.total_sell_return, true));
            __highlight(data.net_profit, pl_span.find('.net_profit'));
            __highlight(data.net_profit, pl_span.find('.gross_profit'));
        },
    });



}





$(document).on('click', 'button.activate-deactivate-location', function () {
    swal({
        title: LANG.sure,
        icon: 'warning',
        buttons: true,
        dangerMode: true,
    }).then(willDelete => {
        if (willDelete) {
            $.ajax({
                url: $(this).data('href'),
                dataType: 'json',
                success: function (result) {
                    if (result.success == true) {
                        toastr.success(result.msg);
                        business_locations.ajax.reload();
                    } else {
                        toastr.error(result.msg);
                    }
                },
            });
        }
    });
});