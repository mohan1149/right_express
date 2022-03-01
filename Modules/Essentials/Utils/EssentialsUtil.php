<?php
namespace Modules\Essentials\Utils;

use App\Utils\Util;
use DB;
use Modules\Essentials\Entities\EssentialsAllowanceAndDeduction;
use Modules\Essentials\Entities\EssentialsAttendance;

class EssentialsUtil extends Util
{
    /**
     * Function to calculate total work duration of a user for a period of time
     * @param  string $unit
     * @param  integer $user_id
     * @param  integer $business_id
     * @param  integer $start_date = null
     * @param  integer $end_date = null
     */


    public function getTotalWorkDuration(
        $unit,
        $user_id,
        $business_id,
        $start_date = null,
        $end_date = null
    ) {
        $total_work_duration = 0;
        if ($unit == 'hour') {
            $query = EssentialsAttendance::where('business_id', $business_id)
                                        ->where('user_id', $user_id)
                                        ->whereNotNull('clock_out_time');

            if (!empty($start_date) && !empty($end_date)) {
                $query->whereDate('clock_in_time', '>=', $start_date)
                            ->whereDate('clock_in_time', '<=', $end_date);
            }

            $hours = $query->select(DB::raw('SUM(TIMESTAMPDIFF(HOUR, clock_in_time, clock_out_time)) as hours'))->first();
            $total_work_duration = !empty($hours->hours) ? $hours->hours : 0;
        }

        return $total_work_duration;
    }

    /**
     * Parses month and year from date
     * @param  string $month_year
     */
    public function getDateFromMonthYear($month_year)
    {
        $month_year_arr = explode('/', $month_year);
        $month = $month_year_arr[0];
        $year = $month_year_arr[1];

        $transaction_date = $year . '-' . $month . '-01';

        return $transaction_date;
    }

    /**
     * Retrieves all allowances and deductions of an employeee
     * @param  int $business_id
     * @param  int $user_id
     * @param  string $start_date = null
     * @param  string $end_date = null
     */
    public function getEmployeeAllowancesAndDeductions($business_id, $user_id, $start_date = null, $end_date = null)
    {
        $query = EssentialsAllowanceAndDeduction::join('essentials_user_allowance_and_deductions as euad', 'euad.allowance_deduction_id', '=', 'essentials_allowances_and_deductions.id')
                ->where('business_id', $business_id)
                ->where('euad.user_id', $user_id);

        //Filter if applicable one
        if (!empty($start_date) && !empty($end_date)) {
            $query->where(function ($q) use ($start_date, $end_date) {
                $q->whereNull('applicable_date')
                    ->orWhereBetween('applicable_date', [$start_date, $end_date]);
            });
        }
        $allowances_and_deductions = $query->get();

        return $allowances_and_deductions;
    }
}
