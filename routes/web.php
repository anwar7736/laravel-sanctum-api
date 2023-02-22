<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;
use Illuminate\Http\Request;
use App\Http\Controllers\ExampleController;
use App\Http\Controllers\Example2Controller;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\ProductStockController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RoleController;
use App\Events\UserDeleted;
use App\Events\MyEvent;
use App\Models\Profile;
use App\Models\User;
use Illuminate\Support\Str;

// Route::get('/', function(){
	
// 	$users = Cache::rememberForever('users' , function(){
// 		return User::all();
// 	});
// 	return view('welcome', compact('users'));
// });

// Route::get('/delete', function(){

// 	//return User::destroy(185,186,187);
// 	$user = User::findOrFail(1);
// 	$user->name = 'Md Anwar Hossain';
// 	$user->save();
// 	//event(new UserDeleted());
// });

Route::redirect('/', '/purchase');

//Product CRUD
Route::resource('product', ProductController::class);


//Purchase CRUD
Route::resource('purchase', PurchaseController::class);

//Product Stock
Route::resource('product_stock', ProductStockController::class);

//Get product search list
Route::get('/getProductList', [PurchaseController::class, 'getProductList'])->name('product.search');
// Route::get('/purchase/destroy/{id}', [PurchaseController::class, 'destroy']);

// Route::view('send-message', 'send-message');
Route::post('/send-message', [Example2Controller::class, 'sendMessage'])->name('send.message');

Route::view('remote-database-connection', 'remote_database');

Route::get('/send-message', [Example2Controller::class, 'getUsers'])->name('user.list');

Route::get('/test', function(){
    $users = App\Models\Country::withCount('posts')->get();
    return $users;
   
});

Route::get('/create-user/{length}', function($length){
    \Artisan::call('insert:data '.$length);
});




Route::resource('user', UserController::class);

Route::resource('role', RoleController::class);

Route::resource('post', PostController::class);

Route::get('/', function(){
    return view('welcome');
});

require __DIR__.'/custom.php';
