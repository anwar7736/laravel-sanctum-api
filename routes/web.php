<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;
use Illuminate\Http\Request;
use App\Http\Controllers\ExampleController;
use App\Events\UserDeleted;
use App\Models\User;


Route::get('/', function(){
	
	$users = Cache::rememberForever('users' , function(){
		return User::all();
	});
	return view('welcome', compact('users'));
});

Route::get('/delete', function(){

	//return User::destroy(185,186,187);
	$user = User::findOrFail(1);
	$user->name = 'Md Anwar Hossain';
	$user->save();
	//event(new UserDeleted());
});