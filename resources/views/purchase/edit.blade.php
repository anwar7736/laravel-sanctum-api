@extends('layouts.app')
@section('title', 'Edit Purchase')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="container mt-3">
    <div class="row">
        <div class="col-md-8 offset-2">
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
                    <strong class="text-muted">
                        Total Amount : <span class="subtotal">0</span>
                     </strong>
                    <div class="table-responsive">
                        
                        <table class="table table-bordered table-hover purchase_table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <form action="#" method="POST" >
                              @csrf
                              <tbody id="purchase_data">

                              </tbody>
                              <tr>
                                 <td colspan="6"><input type="submit" value="Submit" class="btn btn-success form-control"></td>
                              </tr>
                            </form>
                            
                        </table>
                     
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
       $("#search_product").autocomplete({
         source: [
            'Apple',
            'Banana',
            'Mango'
         ],
         select: function(event, data)
         {
            alert(data.item.value);
         }
       });
    });
</script>
@endpush