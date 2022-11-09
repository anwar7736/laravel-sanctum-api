<?php

function send_msg($status, $message, $code, $data = null, $token = null)
{
    return response()->json([
        'status' => $status,
        'message' => $message,
        'data' => $data,
        'token' => $token,
    ], $code);
}