@extends('layouts.app')
@section('title', 'Add Role')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="container mt-3">
    <div class="row" >
        <div class="col-md-8">
            <div class="card">
                <div class="card-header py-3 text-center text-danger">
                    <h3>Add New Role</h3>
                </div>
                <div class="card-body" style="margin-left:80px">
                    <div align="left" class="mb-2">
                        <a href="{{route('role.index')}}" class="btn btn-dark">Back</a>
                    </div>
                        <form action="{{ route('role.store') }}" method="POST" >
                        @csrf
                        <div class="form-group mt-2">
                            <label for="name"><strong>Name <span class="text-danger">*</span></strong></label>
                            <input type="text" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror" name="name" id="name" placeholder="Role Name..." >
                            @error('name')
                                <div>
                                    <span class="text-danger">{{$message}}</span>
                                </div>
                            @enderror
                        </div>
                        <div class="form-group mt-2">
                            <label><strong>Choose Permissions<span class="text-danger">*</span></strong></label>
                            <hr>
                                <div class="row">
                                @error('permissions')
                                <div>
                                    <span class="text-danger">{{$message}}</span>
                                </div>
                                @enderror
                                <label>
                                    <input type="checkbox" id="all-permission"> <strong>Choose All Permissions</strong> 
                                </label>
                                    @foreach($permissions as $permission)
                                    <div class="mt-2">
                                        <label>
                                            <input type="checkbox" name="permissions[]" value="{{ $permission->id }}" class="permission"> {{ $permission->name }}
                                        </label>
                                    </div>
                                    @endforeach
                                </div>

                        </div>                        
                      
                        <div class="form-group mt-5" align="center">
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
    $(function(){
        $("input#all-permission").change(function(){
        if($(this).prop("checked"))
         {
            $("input.permission").prop("checked", true);
         }         
         else
         {
            $("input.permission").prop("checked", false);
         }
       });       
       
       $("input.permission").change(function(){
        if($("input.permission").length == $("input.permission:checked").length)
        {
            $("input#all-permission").prop("checked", true);
         }         
         else
         {
            $("input#all-permission").prop("checked", false);
         }
       });
    });
</script>
@endpush