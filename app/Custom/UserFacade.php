<?php
namespace App\Custom;
use Illuminate\Support\Facades\Facade;
class UserFacade extends Facade{
    protected static function getFacadeAccessor()
    {
        return "user";
    }
}