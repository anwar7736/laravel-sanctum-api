<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use App\Models\Country;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with(['roles', 'country'])->select('id', 'name', 'email', 'country_id')->latest()->paginate(10);

        return view('user.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::select('id', 'name')->get();
        $countries = Country::select('id', 'name')->get();
        
        return view('user.create', compact('roles', 'countries'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'min:3'],
            'email' => ['required', 'unique:users,email'],
            'password' => ['required', 'min:4'],
            'role_id' => ['required'],
            'country_id' => ['required'],
        ], 
        [
            'role_id.required' => 'Role field is required.',
            'country_id.required' => 'Country field is required.',
        ]);

        $input_fields = $request->except('role_id');
        $user = User::create($input_fields);
        $user->roles()->attach($data['role_id']);

        return redirect()->route('user.index')->with(['status'=>'success', 'message'=>'New user has been created!']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::with('roles')->select('id', 'name', 'email', 'country_id')->find($id);
        $roles = Role::select('id', 'name')->get();
        $countries = Country::select('id', 'name')->get();
        
        return view('user.edit', compact('user', 'roles', 'countries'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'name' => ['required', 'min:3'],
            'email' => ['required', 'unique:users,email,'.$user->id],
            'role_id' => ['required'],
            'country_id' => ['required'],
        ], 
        [
            'country_id.required' => 'Country field is required.',
        ]);

        $input_fields = $request->except('role_id');
        $user->update($input_fields);
        $user->roles()->sync($data['role_id']);

        return redirect()->route('user.index')->with(['status'=>'success', 'message'=>'User has been updated!']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();

        return redirect()->route('user.index')->with(['status'=>'success', 'message'=>'User has been deleted!']);
    }
}
