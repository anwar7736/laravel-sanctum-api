<?php
namespace App\Utils;
use App\Models\ProductStock;
class Util {

    //Increase product stock
    public function increaseProductStock($product_id, $quantity)
    {
        $product_stock  = ProductStock::find($product_id);
        $product_stock->quantity += $quantity;
        $product_stock->total +=  $product_stock->price * $quantity;
        $product_stock->save();

        return true;

    }     

    //Decrease product stock
    public function decreaseProductStock($product_id, $quantity)
    {
        $product_stock  = ProductStock::find($product_id);
        $product_stock->quantity -= $quantity;
        $product_stock->total -=  $product_stock->price * $quantity;
        $product_stock->save();

        return true;

    }
    
    //Increase/Decrease product stock
    public function updateProductStock($product_id, $new_quantity, $old_quantity)
    {
        $product_stock  = ProductStock::find($product_id);
        $diff_quantity = $new_quantity - $old_quantity;
        if($diff_quantity !== 0)
        {
            $product_stock->quantity += $diff_quantity;
            $product_stock->total +=  $product_stock->price * $diff_quantity;
            $product_stock->save();

        }

        return true;

    }    
}