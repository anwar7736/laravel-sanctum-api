<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Custom\Test;
class ApplicationServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        app()->bind('invoice', function(){
            return new Test();
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
