<?php

use Illuminate\http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminAuthController;

Route::prefix('admin')->group(function(){
    Route::middleware('auth:sanctum,admin')->group(function () {
        Route::post('logout', [AdminAuthController::class,'logout']);
    });

    Route::get('login', function(){
        return "Unauthenticated";
    })->name('login');

    Route::controller(AdminAuthController::class)->group(function(){
        Route::post('register', 'register');
        Route::post('login', 'login');
    });
    
});