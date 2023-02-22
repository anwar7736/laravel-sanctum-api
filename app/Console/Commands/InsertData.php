<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Country;
use App\Models\User;
use Str;
class InsertData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */

    protected $signature = 'insert:data {length?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Insert a new record in your database';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
    $length = "";
    $length = $this->argument('length');
    if(!$length)
    {
       $length = $this->ask("How many users ");

    }
        try{
           for($i = 0; $i<$length; $i++)
           {
            $isCreated =  User::create([
                'name'=> Str::random(10),
                'email'=> Str::random(10)."@gmail.com",
                'password'=> bcrypt('password'),
                'country_id'=> Country::inRandomOrder()->value('id')
            ]);
           }

           $status = $length > 1 ? "users" : "user";
            $this->info("New $length $status has been created!");
        }
        catch(\Exception $e){
            $this->info("Something went wrong!");
        }
    }

    
}
