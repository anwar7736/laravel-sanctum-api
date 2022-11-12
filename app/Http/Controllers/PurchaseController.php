<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Purchase;
use App\Models\PurchaseLine;
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
            'invoice_no' => 'INV#'.rand(11111111,99999999),
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
        $purchase->update([
            'amount' => $request->total_price,
            'discount' => $request->total_discount,
            'total' => $request->subtotal,
        ]);

        if(isset($request->line_id))
        {
            $delete_line = PurchaseLine::where('purchase_id', $purchase->id)
                                        ->whereNotIn('id', $request->line_id)
                                        ->get();

            if($delete_line->count())
            {
                foreach($delete_line as $key => $line)
                {
                    $this->util->decreaseProductStock($line->product_id, $line->quantity);
                    $line->delete();
                }
            }

        }
        else{
            foreach($purchase->lines as $key => $line)
            {
                $this->util->decreaseProductStock($line->product_id, $line->quantity);
                $line->delete();
                
            }

            $purchase->delete();
        }

        if(isset($request->product_id))
        {
            $data = [];

            foreach($request->product_id as $key => $product_id)
            {

                $new_quantity = $request->quantity[$key];

                if(isset($request->line_id[$key]))
                {
                    $purchase_line_id = $request->line_id[$key];
                    $purchase_line = PurchaseLine::find($purchase_line_id);
                    $old_quantity = $purchase_line->quantity;

                    $this->util->updateProductStock($product_id, $new_quantity, $old_quantity);

                    $purchase_line->quantity = $new_quantity;
                    $purchase_line->total = $request->total[$key];
                    $purchase_line->save();
                    
                    
                }

                else {

                    $data [] = [
                        'purchase_id' => $purchase->id,
                        'product_id' => $product_id,
                        'price' => $request->price[$key],
                        'quantity' => $new_quantity,
                        'discount' => $request->discount[$key],
                        'total' => $request->total[$key],
                    ];

                    $this->util->increaseProductStock($product_id, $new_quantity);
                    
                }
            }

            if(!empty($data))
            {
                $purchase->lines()->createMany($data);
            }
        }

        return redirect()->route('purchase.index')->with(['status'=>'success', 'message'=>'Purchase has been updated!']);
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
