<?php

namespace App\Http\Controllers;

use App\Models\ProductStock;
use Illuminate\Http\Request;

class ProductStockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       if(request()->ajax())
       {
            $query = ProductStock::with('products');
            $search_query = request('query');
            $paginate = request('paginate');

            if(!empty($search_query)){
                $query->whereHas('products', function($q) use($search_query) {
                    $q->where('name', 'like', '%'.$search_query.'%')
                     ->orWhere('price', 'like', '%'.$search_query.'%');
                });
            }            
    
            $product_stocks = $query->latest()->paginate($paginate);

            return view('product_stock.stock_data', compact('product_stocks'))->render();
       }

        return view('product_stock.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ProductStock  $productStock
     * @return \Illuminate\Http\Response
     */
    public function show(ProductStock $productStock)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ProductStock  $productStock
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductStock $productStock)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ProductStock  $productStock
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductStock $productStock)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProductStock  $productStock
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductStock $productStock)
    {
        //
    }
}
