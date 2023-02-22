<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{

    public function index()
    {
        $roles = Role::with('permissions')->latest()->select('id', 'name')->paginate(10);

        return view('role.index', compact('roles'));
    }


    public function create()
    {
        $permissions = Permission::select('id', 'name')->get();

        return view('role.create', compact('permissions'));
    }


    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'unique:roles,name'],
            'permissions' => ['required'],
        ]);

        $role = Role::create($data);

        $role->permissions()->attach($data['permissions']);

        return redirect()->route('role.index')->with(['status'=>'success', 'message'=>'New role has been created!']);

    }


    public function show(Role $role)
    {
        //
    }


    public function edit($id)
    {
        $role = Role::with('permissions')->select('id', 'name')->find($id);
        $permissions = Permission::select('id', 'name')->get();
        return view('role.edit', compact('role', 'permissions'));
    }


    public function update(Request $request, Role $role)
    {
        $data = $request->validate([
            'name' => ['required', 'unique:roles,name,'.$role->id],
            'permissions' => ['required'],
        ]);

        $role->update($data);

        $role->permissions()->sync($request->permissions);

        return redirect()->route('role.index')->with(['status'=>'success', 'message'=>'Role has been updated!']);
    }


    public function destroy(Role $role)
    {
        $role->users()->delete();
        $role->delete();
    
        return redirect()->route('role.index')->with(['status'=>'success', 'message'=>'Role has been deleted!']);
    }
}
