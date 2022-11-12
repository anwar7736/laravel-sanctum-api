@extends('layouts.app')
@section('title', 'Add Product')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="container mt-3">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header py-3 text-center text-danger">
                    <h3>Add New Product</h3>
                </div>
                <div class="card-body">
                    <div align="left" class="mb-2">
                        <a href="{{route('product.index')}}" class="btn btn-dark">Back</a>
                    </div>
                    <div class="d-none">
                     <input type="search" id="search_product" class="form-control mb-2" placeholder="Search product...">
                    </div>
                        <form action="{{ route('product.store') }}" method="POST" >
                        @csrf
                        <div class="form-group mt-2">
                            <label for="name">Product Name*</label>
                            <input type="text" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror" name="name" id="name" placeholder="Product name..." >
                            @error('name')
                                <div>
                                    <span class="text-danger">{{$message}}</span>
                                </div>
                            @enderror
                        </div>
                        <div class="form-group mt-2">
                            <label for="price">Product Price*</label>
                            <input type="number" value="{{ old('price') }}" min="1" class="form-control @error('price') is-invalid @enderror" value="" name="price" id="price" placeholder="Product price..." >
                            @error('price')
                                <div>
                                    <span class="text-danger">{{$message}}</span>
                                </div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="discount">Product Discount (optional)</label>
                            <input type="number" value="{{ old('discount') }}" min="1" class="form-control" name="discount" id="discount" placeholder="Product discount..." >
                        </div>                        
                        <div class="form-group mt-3" align="center">
                            <input type="submit" class="btn btn-success px-5" value="Submit" >
                        </div>
                

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