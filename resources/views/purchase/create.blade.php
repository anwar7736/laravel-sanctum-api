@extends('layouts.app')
@section('title', 'Add Purchase')
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
                    <h3>Add New Purchase</h3>
                </div>
                <div class="card-body">
                    <div align="right" class="mb-2">
                        <a href="{{route('purchase.index')}}" class="btn btn-secondary">Back >></a>
                    </div>
                    <div>
                     <input type="search" id="search_product" class="form-control mb-2" placeholder="Search product...">
                    </div>
                    <form action="{{ route('purchase.store') }}" method="POST" >
                    @csrf
                    <strong class="text-muted">
                        Total Amount : <input type="text" value="0" name="total_price" class="total_price" readonly>
                     </strong>
                     <strong class="text-muted">
                        Total Discount : <input type="text" value="0" name="total_discount" class="total_discount" readonly>
                     </strong>
                     <strong class="text-muted">
                        Subtotal : <input type="text" value="0" name="subtotal" class="subtotal" readonly>
                     </strong>
                     <br><br>
                    <div class="table-responsive">
                        
                        <table class="table table-bordered table-hover purchase_table">
                            <thead>
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

                              </tbody>
                              <tr align="center">
                                 <td colspan="6">
                                    <input type="submit" value="Submit" class="btn btn-success px-5" disabled id="submitBtn">
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
                    if(data.length == 0)
                    {
                        toastr.error('Product not found!');
                        $('#search_product').val('');
                        
                    }

                    else if(data.length == 1)
                    {
                        productAppend(data[0]);
                    }

                    else if(data.length > 1)
                    {
                        response(data);
                    }

                    $('#search_product').val('');

                   
                }
            });
         },
         select: function(event, data)
         {
                productAppend(data.item);
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
                html+="<td><input type='hidden' name='product_id[]' class='product_id' value='"+item.id+"'></td>";
                html+="<td><button class='btn btn-danger btn-sm remove' data-id='"+item.id+"'>X</button></td>";
                html+="</tr>";

                $("tbody#purchase_data").append(html);
                calculateTotal();
                products.push(item.id);
                $('#search_product').val('');
                $("#submitBtn").attr('disabled', false);

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
            if(products.length == 0)
            {
                $("#submitBtn").attr('disabled', true);
            }
       });
       $(document).on('keyup change', '.quantity', function(){
            calculateTotal();
       });
 
    });
</script>
@endpush