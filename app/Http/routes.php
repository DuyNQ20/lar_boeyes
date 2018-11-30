<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
 */


Route::get('/', function () {
	return view('fontend.home');
});




// Phần Doctor
Route::group(['prefix' => 'doctor'], function () {
	Route::get('/', "backend\Doctor\DoctorController@index");
	Route::get('/student-one', "Backend\Doctor\DoctorController@studentOne");
	Route::get('/class-one', "Backend\Doctor\DoctorController@classOne");

	// Phần get dữ liệu vào combox
	Route::group(['prefix' => 'data'], function () {
		Route::get('/schools', "Backend\DataController@getSchools");
		Route::get('/student-eyesight',['as'=>'getStudentEyesight','uses' => "Backend\DataController@getStudentEyesight"]);
		Route::get('/getAcademics', "Backend\DataController@getAcademics");
		Route::get('/getClass', "Backend\DataController@getClass");
		Route::get('/getClassEyesight', "Backend\DataController@getClassEyesight");
		Route::get('/getEyesight', "Backend\DataController@getEyesight");
	});


});




Route::resource('hocsinh', "HocSinhController");

Route::auth();

Route::get('/home', 'HomeController@index');

Route::get('/hash', function () {
	return Hash::make(12345);
});
