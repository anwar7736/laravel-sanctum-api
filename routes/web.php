<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;
use Illuminate\Http\Request;
use App\Http\Controllers\ExampleController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\ProductStockController;
use App\Events\UserDeleted;
use App\Models\User;


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



require __DIR__.'/custom.php';