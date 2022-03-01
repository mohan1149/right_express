<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/get/customer-subscription-details/{cid}', 'ContactController@getCustomerSubscriptionInfo');
Route::post('/updateCustomerSubscriptionInfo', 'ContactController@updateCustomerSubscriptionInfo');
Route::post('/renewCustomerSubscriptionPlan', 'ContactController@renewCustomerSubscriptionPlan');

Route::get('/get/customers','OutsideCustomerController@getCustomers');
Route::get('/get/drivers','DriverController@getDrivers');
Route::get('/get/areas/{pid}','OutsideCustomerController@getAreas');