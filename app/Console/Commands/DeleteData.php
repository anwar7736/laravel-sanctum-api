<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;

class DeleteData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:data {length?}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove record from your database';

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
        $length = $length ?? 1;
        for($i = 0; $i<$length; $i++)
        {
            User::whereNull('email_verified_at')->first()->delete();
        }
       

        $this->info("User has been deleted!");
    }
}
