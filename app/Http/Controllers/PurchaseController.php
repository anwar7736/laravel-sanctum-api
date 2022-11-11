<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Purchase;
use App\Utils\Util;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    public $util;

    public function __construct(Util $util)
    {
        $this->util = $util;
    }

    public function getProductList(Request $request)
    {
        $products = Product::where('name', 'like', '%'.$request->get('query').'%')
                            ->get();
                            
        return response()->json($products);
    }

    public function index()
    {
        $purchases = Purchase::latest()->simplePaginate(10);

        return view('purchase.index', compact('purchases'));
    }


    public function create()
    {
        return view('purchase.create');
    }


    public function store(Request $request)
    {
        $purchase = Purchase::create([
            'invoice_no' => 'INV#'.rand(111111,999999),
            'amount' => $request->total_price,
            'shipping_charge' => 0,
            'discount' => $request->total_discount,
            'total' => $request->subtotal,
        ]);

        if($purchase)
        {
            if(isset($request->product_id))
            {
                $data = [];
                foreach($request->product_id as $key => $id)
                {
                    $quantity = $request->quantity[$key];
                    $data[] = [
                        'purchase_id' => $purchase->id,
                        'product_id' => $id,
                        'price' => $request->price[$key],
                        'quantity' => $quantity,
                        'discount' => $request->discount[$key],
                        'total' => $request->total[$key],
                    ];

                    $this->util->increaseProductStock($id, $quantity);
                }

                $purchase->lines()->createMany($data);
            }
        }

        return redirect()->route('purchase.index')->with(['status'=>'success', 'message'=>'Purchase has been created!']);
    }


    public function show(Purchase $purchase)
    {
        //
    }


    public function edit(Purchase $purchase)
    {
        
        return view('purchase.edit', compact('purchase'));
    }


    public function update(Request $request, Purchase $purchase)
    {
        //
    }


    public function destroy(Purchase $purchase)
    {
        foreach($purchase->lines as $key => $line)
        {
            $this->util->decreaseProductStock($line->product_id, $line->quantity);
            $line->delete();
        }

        $purchase->delete();

        return redirect()->route('purchase.index')->with(['status'=>'success', 'message'=>'Purchase has been deleted!']);
    }
}
