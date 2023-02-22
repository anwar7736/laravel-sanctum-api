@extends('layouts.app')
@section('title', 'Product Stock')
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
                    <h3>Product Current Stock</h3>
                </div>
                <div class="card-body">
                <div align="left" class="mb-2">
                        <a href="{{route('purchase.index')}}" class="btn btn-dark">Back</a><br><br>
                        <select name="paginate" id="paginate" class="px-2">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                    </div>                    
                    <div align="right" class="mb-2">
                        <input type="text" class="" id="search" placeholder="Search...">
                    </div>
                    <div class="table-responsive stock_table">
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
        fetch();
        function fetch(page = 1){
            let query = $("input#search").val();
            let paginate = $("#paginate").val();
            $.ajax({
                url: "{{route('product_stock.index')}}",
                method: "GET",
                data: {page, query, paginate},
                success: function(res){
                    $('div.stock_table').html(res);
                }
            });
        }

        $(document).on('keyup', 'input#search', function(e){
            e.preventDefault();
            fetch();
        });           
        
        $(document).on('change', '#paginate', function(e){
            e.preventDefault();
            fetch();
        });        
        
        $(document).on('click', 'a.page-link', function(e){
            e.preventDefault();
            let page = $(this).attr('href').split('page=')[1];
            fetch(page);
        });
   });
</script>
@endpush