<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubscriptionPlan extends Model
{
    use SoftDeletes;
    protected $guarded = ['id'];
    protected $table = 'subscription_plans';
    
    
}
