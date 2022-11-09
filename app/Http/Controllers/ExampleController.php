<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Example2Controller;

class ExampleController extends Controller
{
    function trial()
    {
    	return redirect()->action([Example2Controller::class]);
    }
}
