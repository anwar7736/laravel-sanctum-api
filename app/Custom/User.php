<?php
namespace App\Custom;
use App\Models\User as UserModel;
class User {
    public function total_user()
    {
        return UserModel::count();
    }
    public function first_user()
    {
        return UserModel::first();
    }    
    
    public function last_user()
    {
        return UserModel::get()->last();
    }
}