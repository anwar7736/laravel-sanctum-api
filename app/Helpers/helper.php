<?php
use Illuminate\Support\Facades\DB;

function send_msg($status, $message, $code, $data = null, $token = null)
{
    return response()->json([
        'status' => $status,
        'message' => $message,
        'data' => $data,
        'token' => $token,
    ], $code);
}

function can($permission)
{
    $permission_id = DB::table('permissions')->whereName($permission)->value('id');
    $role_id = DB::table('role_user')->where('user_id',  Auth::id())->value('role_id') ?? 9;
    $result = DB::table('role_has_permissions')
                ->where(['role_id'=>$role_id, 'permission_id'=>$permission_id])
                ->first();
    return $result ? true : false;
}