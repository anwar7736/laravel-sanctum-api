@extends('layouts.app')
@section('title', 'All Purchase')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="container mt-3">
    <div class="row">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header py-3 text-center text-danger">
                    <h3>All Purchase List</h3>
                </div>
                <div class="card-body">
                <div align="left" class="mb-2">
                        <a href="{{route('product_stock.index')}}" class="btn btn-dark">View Product Stock</a>
                </div>
                <div align="left" class="mb-2">
                    <a href="{{route('product.index')}}" class="btn btn-info">View Product List</a>
                </div>
                <div align="right" class="mb-2">
                    <a href="{{route('purchase.create')}}" class="btn btn-primary">Add Purchase</a>
                </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover purchase_table">
                            <thead class="bg-success">
                                <tr>
                                    <th>#Sl</th>
                                    <th>Invoice No</th>
                                    <th>Amount</th>
                                    <th>Shipping Cost</th>
                                    <th>Discount</th>
                                    <th>Total Amount</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody id="purchase_data">
                                @forelse($purchases as $purchase)
                                    <tr>
                                        <td>{{$loop->index + 1}}</td>
                                        <td>{{$purchase->invoice_no}}</td>
                                        <td>{{$purchase->amount}}</td>
                                        <td>{{$purchase->shipping_charge}}</td>
                                        <td>{{$purchase->discount}}</td>
                                        <td>{{$purchase->total}}</td>
                                        <td>
                                            <a href="{{route('purchase.edit', $purchase->id)}}" class="btn btn-sm btn-success edit">Edit</a>
                                        </td>
                                        <td>
                                            <form action="{{ route('purchase.destroy', $purchase->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger delete" data-id="{{$purchase->id}}" onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                        </td>
                                    </tr>
                                    @empty
                                    <tr>
                                        <td colspan="8">
                                            <div class="text-danger text-center">
                                                <h5>No Data Found!!</h5>
                                            </div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                            
                        </table>
                        {{$purchases->links()}}
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
        const status = "{{Session::get('status')}}";
        const message = "{{Session::get('message')}}";
        if(status == 'success')
        {
            toastr.success(message);
        } 
        else if(status == 'failed')
        {
            toastr.error(message);
        }

        // $(document).on('click', '.delete', function(){
        //     let purchase_id = $(this).attr('data-id');
        //     if(confirm('Are you sure?'))
        //     {
        //         $.ajax({
        //                 url:  "/purchase/destroy/" + purchase_id,
        //                 method: 'get',
        //                 dataType: 'json',
        //                 success: function(response)
        //                 {
        //                     toastr.success(response);
        //                 }
        //             });
        //     }   

        // });
   });
</script>
@endpush