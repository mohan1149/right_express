<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
class SubscriptionRegister extends Model
{
    use SoftDeletes;
    protected $guarded = ['id'];
    protected $table = 'subscription_registers';
    protected $appends = array('IsActive','IsPaused','IsSuspended','IsAvaliable','IsStarted','StatusText');
    protected $dates = [
        'date_start',
        'date_end',
        'date_paused',
        'date_resumed',
        'date_suspended',
    ];

    public function plan()
    {
        return $this->belongsTo(\App\SubscriptionPlan::class, 'plan_id');
    }

    public function contact()
    {
        return $this->belongsTo(\App\Contact::class, 'contact_id');
    }


    public function getIsStartedAttribute()
    {   
        return (bool)(!$this->date_start==null);
    }


    public function getIsAvaliableAttribute()
    {   
        return (bool)(($this->IsActive || $this->date_start==null) && !$this->IsSuspended);
    }


    public function getIsActiveAttribute()
    {   
        $today = Carbon::parse(Carbon::now()->format('Y-m-d'));
        $date_end = $this->date_end;
        return (bool)(($date_end>= $today));
    }


    public function getIsPausedAttribute()
    {   
        return (bool)!($this->date_paused==null || $this->date_paused !=null && $this->date_resumed !=null);
    }

    public function getIsSuspendedAttribute()
    {   
        return (bool)($this->date_suspended!=null);
    }


    public function getStatusTextAttribute()
    {   
        
        if($this->IsSuspended)
        {
            return "Suspended";
        }
        else if($this->IsPaused)
        {

            return "Paused";
        }
        elseif(!$this->IsStarted)
        {
            return "Not Started";
        }
        else if($this->IsActive)
        {
           return "Active";

        }
        else
        {
            return "Not Active";
 
        }


    }
}
