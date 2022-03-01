<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GiftVoucher extends Model
{
    //
    protected $fillable = [
        'business_id',
        'voucher_name',
        'voucher_value',
        'expire_date',
        'notes',
    ];
}
