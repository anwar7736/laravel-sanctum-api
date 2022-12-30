<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Example2Controller;
use App\Models\User;
use App\Models\Role;

class ExampleController extends Controller
{
    public function __invoke()
    {
        // // $posts = Post::whereHas('comments', function($query){
        // //     $query->where('is_active',1);
        // // })->withCount('comments')->get();
        // // return view('users', compact('posts'));

        // $post = Post::find(1);

        // return $post->comments()->delete();

        $users = User::get()->load(['roles' => function($query){
             $query->wherePivot('expire_at', '>', now());
        }]);
        return $users;
    }
}
