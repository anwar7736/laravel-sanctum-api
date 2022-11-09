<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\UserRegisterRequest;
use App\Http\Requests\UserLoginRequest;
use Auth;

class AuthController extends Controller
{
    public function register(UserRegisterRequest $request)
    {
         $registered = User::create($request->all());
         if($registered)
         {
            return send_msg('success', 'User registration success', $registered, 200);
         }
 
         return send_msg('failed', 'Something went wrong!', 401);
 
    }

    public function login(UserLoginRequest $request)
    {
        if(Auth::attempt($request->only(['email', 'password'])))
        {
            $user = Auth::user();
            $token = $user->createToken(rand())->plainTextToken;
            return send_msg('success', 'Login Success', 200, $user, $token);
        }
        else{
            return send_msg('failed', 'Invalid Credentials', 401);
        }
    }

    public function logout()
    {
        auth()->user()->currentAccessToken()->delete();

        return send_msg('success', 'Logout Success', 200);
    }
}
