<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\ExampleController;
use App\Events\MyEvent;
use App\Models\User;
class Example2Controller extends Controller
{
   function about()
   {
   	 return "Example2";
   }
   function sendMessage(Request $request)
   {
      $validated = $request->validate([
         'author' => ['required'],
         'message' => ['required'],
      ]);

      try
      {
         event(new MyEvent($validated));
         return response()->json(['success'=>true, 'msg'=>'Message has been sent!']);
      }
      catch(\Exception $e)
      {
         return response()->json(['success'=>false, 'msg'=>'Something went wrong!']);
      }

   }

   function getUsers()
   {

      if(request()->ajax())
      {
         $query = request()->get('query');
         $search = request()->get('search');
         $users = [];
         if(!empty($search))
         {
            $users = User::where('name', 'like', '%'.$search.'%')->get();
         }
         else if(!empty($query))
         {
            $users = User::where('name', 'like', '%'.$query.'%')->get();
         }
         else{
            $users = User::all();
         }

         $html = view('user', compact('users'))->render();
         return response()->json(['html'=>$html]);

      }
      return view('send-message');
   }
}
