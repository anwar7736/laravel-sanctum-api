<table class="table table-bordered table-hover product_stock_table text-center">
        <thead class="bg-secondary">
            <tr>
                <th>#Sl</th>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity (pcs)</th>
                <th>Discount</th>
                <th>Total Amount</th>
            </tr>
        </thead>
        <tbody id="product_stock_data">
            @forelse($product_stocks as $stock)
                <tr>
                    <td>{{$loop->index + 1}}</td>
                    <td style="text-align:left !important">{{$stock->products['name']}}</td>
                    <td>{{$stock->price}}</td>
                    <td>
                        @if($stock->quantity == 0)  
                            <span class="badge bg-danger">Out of stock</span>
                        @else
                            <span>{{$stock->quantity}}</span>
                        @endif
                    </td>
                    <td>
                        @if($stock->products->discount == 0)  
                            <span class="badge bg-danger">Not Available</span>
                        @else
                        <span class="badge bg-success">{{$stock->products->discount}}</span>
                        @endif
                    </td>
                    <td>{{$stock->total}}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="7">
                        <div class="text-danger text-center">
                            <h5>No Data Found!!</h5>
                        </div>
                    </td>
                </tr>
            @endforelse 
            
        </tbody>
        
    </table> 
    {{$product_stocks->links()}}