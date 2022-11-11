<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_no');
            $table->double('amount', 8, 2);
            $table->double('shipping_charge', 8, 2);
            $table->double('discount', 8, 2);
            $table->double('total', 8, 2);
            $table->enum('status', ['ordered', 'pending', 'completed'])->nullable()->default('ordered');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchases');
    }
}
