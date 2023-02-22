<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductStock;
use App\Models\Purchase;
use App\Models\PurchaseLine;
use Illuminate\Http\Request;
use App\Events\ProductCreated;
use App\Events\ProductUpdated;
use App\Events\ProductDeleted;
use Cache;
class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $products = Cache::rememberForever('products', function () {
            return Product::orderBy('id', 'desc')->simplePaginate(10);
        });
        
        return view('product.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if(!can('product.create'))
        {
            abort(403, 'Unauthorized');
        }
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
        if(!can('product.create'))
        {
            abort(403, 'Unauthorized');
        }

        $data = $request->validate([
            'name' => ['required', 'min:3', 'unique:products,name'],
            'price' => ['required'],
            'discount' => '',
        ]);

        $product = Product::create($data);
        $this->cache_reset();
        event(new ProductCreated($product));
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
        if(!can('product.update'))
        {
            abort(403, 'Unauthorized');
        }
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
        if(!can('product.update'))
        {
            abort(403, 'Unauthorized');
        }

        $data = $request->validate([
            'name' => ['required', 'min:3', 'unique:products,name,'.$product->id],
            'price' => ['required'],
            'discount' => '',
        ]);

        $updated = $product->update($data);
        event(new ProductUpdated($product));


        if($updated)
        {
         
            $stock = ProductStock::find($product->id);
            if($stock){
                $stock->update([
                    'price' => $data['price'],
                    'total' => $data['price'] * $stock->quantity,
                ]);
            }
            else{
                ProductStock::create([
                    'product_id' => $product->id,
                    'price' => $data['price'],
                    'total' => 0,
                ]);
            }

           $this->cache_reset();
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
        if(!can('product.delete'))
        {
            abort(403, 'Unauthorized');
        }

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


       event(new ProductDeleted($product));
       $product->delete();
       $this->cache_reset();
       return redirect()->route('product.index')->with(['status'=>'success', 'message'=>'Product has been deleted!']);
    }

    public function cache_reset(){
        Cache::forget('products');
        Cache::rememberForever('products', function () {
            return Product::orderBy('id', 'desc')->simplePaginate(10);
        });
    }
}
