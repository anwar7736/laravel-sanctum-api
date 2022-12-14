@extends('layouts.app')
@section('title', 'Edit Purchase')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="container mt-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header py-3 text-center text-danger">
                    <h3>Edit Purchase</h3>
                </div>
                <div class="card-body">
                    <div align="left" class="mb-2">
                        <a href="{{route('purchase.index')}}" class="btn btn-dark">Back</a>
                    </div>
                     <input type="search" id="search_product" class="form-control mb-2" placeholder="Search product...">
                    </div>
                    <div align="center" class="mb-3">
                        <strong class="text-muted">
                            Invoice No : <input type="text" value="{{$purchase->invoice_no}}" name="" class="" disabled>
                        </strong>
                    </div>
                    <form action="{{ route('purchase.update', $purchase->id) }}" method="POST" >
                    @csrf
                    @method('PUT')
                    <div class="row">
                        <div class="text-muted col-md-4 mt-3">
                            Total Amount : <input type="text" value="{{$purchase->amount}}" name="total_price" class="total_price" readonly>
                        </div>
                        <div class="text-muted col-md-4 mt-3">
                            Total Discount : <input type="text" value="{{$purchase->discount}}" name="total_discount" class="total_discount" readonly>
                        </div>
                        <div class="text-muted col-md-4 mt-3">
                            Subtotal : <input type="text" value="{{$purchase->total}}" name="subtotal" class="subtotal" readonly>
                        </div>
                   </div>
                     <br><br>
                    <div class="table-responsive">
                        
                        <table class="table table-bordered table-hover purchase_table">
                            <thead class="text-center bg-info">
                                <tr>
                                    <th>Product</th>
                                    <th width='10px'>Price</th>
                                    <th width='10px'>Discount</th>
                                    <th width='10px'>Quantity</th>
                                    <th width='10px'>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                              <tbody id="purchase_data">
                                @forelse($purchase->lines as $line)
                                <tr>
                                    <td>{{$line->products->name}}</td>
                                    <td><input type='text' name='price[]' class='price' value='{{$line->price}}' readonly></td>
                                    <td><input type='text' name='discount[]' class='discount' value='{{$line->discount}}' readonly></td>
                                    <td><input type='number' name='quantity[]' class='quantity' value='{{$line->quantity}}' min=1></td>
                                    <td><input type='text' name='total[]' class='total' value='{{$line->total}}' readonly></td>
                                    <input type='hidden' name='product_id[]' class='product_id' value='{{$line->product_id}}'>
                                    <input type='hidden' name='line_id[]' class='line_id' value='{{$line->id}}'>
                                    <td><button class='btn btn-danger btn-sm remove' data-id='"+item.id+"'>X</button></td>
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
                              <tr align="center">
                                 <td colspan="6">
                                    <input type="submit" value="Update" class="btn btn-success px-5" id="updateBtn">
                                </td>
                              </tr>
                         
                            
                        </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
 $(document).ready(function(){
       const url = "{{ route('product.search') }}";
       const products = [];
       
       $('#search_product').autocomplete({
        minLength: 2,
         source: function(request, response)
         {
            $.ajax({
                url: url,
                dataType: 'json',
                data: {query: request.term},
                success: function(data)
                {
                    let result;
                    if(data.length == 0)
                    {
                        toastr.error('Product not found!');
                        //$('#search_product').val('');
                        
                    }

                    else if(data.length == 1)
                    {
                        productAppend(data[0]);
                    }

                    else if(data.length > 1)
                    {
                        result = $.map(data, function(item){
                            return {
                                label: item.name,
                                value: item.name,
                                data: item,
                            }
                        });
                       
                    }
                    
                    response(result);
                    //$('#search_product').val('');

                   
                }
            });
         },
         select: function(event, selectedItem)
         {
                productAppend(selectedItem.item.data);
                return false;
         }
       });

       function productAppend(item)
       {
            if(products.indexOf(item.id) == -1)
            {
                let html = "<tr>";
                html+="<td>"+item.name+"</td>";
                html+="<td><input type='text' name='price[]' class='price' value='"+item.price+"' readonly></td>";
                html+="<td><input type='text' name='discount[]' class='discount' value='"+item.discount+"' readonly></td>";
                html+="<td><input type='number' name='quantity[]' class='quantity' value='1' min=1></td>";
                html+="<td><input type='text' name='total[]' class='total' value='"+item.price+"' readonly></td>";
                html+="<input type='hidden' name='product_id[]' class='product_id' value='"+item.id+"'>";
                html+="<td><button class='btn btn-danger btn-sm remove' data-id='"+item.id+"'>X</button></td>";
                html+="</tr>";

                $("tbody#purchase_data").append(html);
                calculateTotal();
                products.push(item.id);
                $('#search_product').val('');
                // $("#updateBtn").attr('disabled', false);

            }
       }

       function calculateTotal()
       {
            let tblRows = $(".purchase_table tbody#purchase_data tr");
            let totalPrice = 0;
            let totalDiscount = 0;
            let subTotal = 0;
            tblRows.each(function(row) {
                let tblRow = $(this);
                let price = Number(tblRow.find('td input.price').val());
                let quantity = Number(tblRow.find('td input.quantity').val());
                let discount = Number(tblRow.find('td input.discount').val());
                let total = (price * quantity) - discount;
                tblRow.find('td input.total').val(total);
                totalPrice += price * quantity;
                totalDiscount += discount;
                subTotal += total;
            });

            $("input.total_price").val(totalPrice);
            $("input.total_discount").val(totalDiscount);
            $("input.subtotal").val(subTotal);
       }

       $(document).on('click', '.remove', function(){
            $(this).closest('tr').remove();
            let index = products.indexOf($(this).data('id'));
            products.splice(index,1);
            calculateTotal();
            // if(products.length == 0)
            // {
            //     $("#updateBtn").attr('disabled', true);
            // }
       });
       $(document).on('keyup change', '.quantity', function(){
            calculateTotal();
       });
 
    });
</script>
@endpush