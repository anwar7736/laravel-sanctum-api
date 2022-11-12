<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductStock;
use App\Models\Purchase;
use App\Models\PurchaseLine;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $products = Product::latest()->simplePaginate(10);

        return view('product.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('product.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'min:3', 'unique:products,name'],
            'price' => ['required'],
            'discount' => '',
        ]);

        $product = Product::create($request->all());

        if($product)
        {
            $product_stock = ProductStock::create([
                'product_id' => $product->id,
                'price' => $request->price,
                'quantity' => 0,
                'total' => 0,
            ]);
        }

        return redirect()->route('product.index')->with(['status'=>'success', 'message'=>'Product has been created!']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        return view('product.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => ['required', 'min:3', 'unique:products,name,'.$product->id],
            'price' => ['required'],
            'discount' => '',
        ]);

        $updated = $product->update($request->all());

        if($updated)
        {
            $product_stock = ProductStock::find($product->id);
            
           $product_stock->price = $request->price;
           $product_stock->total = $request->price * $product_stock->quantity;
           $product_stock->save();
        }

        return redirect()->route('product.index')->with(['status'=>'success', 'message'=>'Product has been updated!']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
       $lines =  PurchaseLine::where('product_id', $product->id)->get();
       if($lines->count())
       {
           foreach($lines as $key => $line)
           {
                $purchase = Purchase::find($line->purchase_id);

                $purchase->amount -= $line->total - $line->discount;
                $purchase->discount -= $line->discount;
                $purchase->total -= $line->total;
                $purchase->save();
           }
       }
       $product->delete();

       return redirect()->route('product.index')->with(['status'=>'success', 'message'=>'Product has been deleted!']);
    }
}
