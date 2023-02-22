<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Custom\User;
class CustomServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
       app()->bind('user', function(){
            return new User;
       });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
