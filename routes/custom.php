<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\ExampleController;

Route::prefix('custom')->group(function(){
    Route::get('users', ExampleController::class);
});