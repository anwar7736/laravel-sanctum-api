<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Requests\AdminRegisterRequest;
use App\Http\Requests\AdminLoginRequest;
use Auth;

class AdminAuthController extends Controller
{
    public function register(AdminRegisterRequest $request)
    {
         $registered = Admin::create($request->all());
         if($registered)
         {
            return send_msg('success', 'Admin registration success', $registered, 200);
         }
 
         return send_msg('failed', 'Something went wrong!', 401);
 
    }

    public function login(AdminLoginRequest $request)
    {
        if(Auth::guard('admin')->attempt($request->only(['email', 'password'])))
        {
            $admin = Auth::guard('admin')->user();
            $token = $admin->createToken(rand())->plainTextToken;
            return send_msg('success', 'Admin login Success', 200, $admin, $token);
        }
        else{
            return send_msg('failed', 'Invalid Credentials', 401);
        }
    }

    public function logout()
    {
        auth()->user()->currentAccessToken()->delete();

        return send_msg('success', 'Admin logout Success', 200);
    }
}
