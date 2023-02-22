<?php
    $data = \DB::table('users')->select('name')->get();
    print_r($data);
?> 