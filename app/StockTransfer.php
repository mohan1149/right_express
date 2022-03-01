<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StockTransfer extends Model
{
    //Transaction types = ['purchase','sell','expense','stock_adjustment','sell_transfer','purchase_transfer','opening_stock','sell_return','opening_balance','purchase_return', 'payroll']
    
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    
    public function items()
    {
        return $this->hasMany(\App\StockTransferProduct::class);
    }

    public function location()
    {
        return $this->belongsTo(\App\BusinessLocation::class, 'location_id');
    }

    public function business()
    {
        return $this->belongsTo(\App\Business::class, 'business_id');
    }


    public function sales_person()
    {
        return $this->belongsTo(\App\User::class, 'created_by');
    }

    
    
}
