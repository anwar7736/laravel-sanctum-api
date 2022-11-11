<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductStock;

class ProductStockSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Lactogen 180gm
        for($i = 1; $i <= 4; $i++)
        {
            $product = Product::create([
                'name' => 'Lactogen ' .$i. ' 180gm',
                'price' => 245,
                'discount' => 0,
            ]);

            if($product)
            {
                $stock = ProductStock::create([
                    'product_id' => $product->id,
                    'price' => $product->price,
                    'quantity' => 0,
                    'total' => 0,
                ]);
            }
        }
        //Lactogen 350gm
        for($i = 1; $i <= 4; $i++)
        {
            $product = Product::create([
                'name' => 'Lactogen ' .$i. ' 350gm',
                'price' => 478,
                'discount' => 0,
            ]);

            if($product)
            {
                $stock = ProductStock::create([
                    'product_id' => $product->id,
                    'price' => $product->price,
                    'quantity' => 0,
                    'total' => 0,
                ]);
            }
        }
        //Lactogen Tin 400gm
        for($i = 1; $i <= 3; $i++)
        {
            $product = Product::create([
                'name' => 'Lactogen ' .$i. ' Tin 400gm',
                'price' => 600,
                'discount' => 0,
            ]);

            if($product)
            {
                $stock = ProductStock::create([
                    'product_id' => $product->id,
                    'price' => $product->price,
                    'quantity' => 0,
                    'total' => 0,
                ]);
            }
        }
    }
}
