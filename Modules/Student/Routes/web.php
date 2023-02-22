<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::prefix('student')->group(function() {
    Route::get('/', 'StudentController@index')->name('student.index');
    Route::get('/destroy/{id}', 'StudentController@destroy')->name('student.destroy');
    Route::get('/{id}/edit', 'StudentController@edit')->name('student.edit');
    Route::put('/{id}', 'StudentController@update')->name('student.update');
    Route::get('/{id}', 'StudentController@show')->name('student.show');
    Route::get('/new/create', 'StudentController@create')->name('student.create');
    Route::post('/store', 'StudentController@store')->name('student.store');
    
});
