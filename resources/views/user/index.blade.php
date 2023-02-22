@extends('layouts.app')
@section('title', 'All User')
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
                    <h3>All User List</h3>
                </div>
                <div class="card-body">
                
                <div align="left" class="">
                    <a href="{{route('role.index')}}" class="btn btn-dark btn-sm">All Role List</a>
                </div>                
                <div align="right" class="mb-2">
                    <a href="{{route('user.create')}}" class="btn btn-info btn-sm">Add User</a>
                </div>
               
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover purchase_table">
                            <thead class="bg-success">
                                <tr>
                                    <th>#Sl</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Country</th>
                                   
                                    <th>Edit</th>
                                   
                                  
                                    <th>Delete</th>
                               
                                </tr>
                            </thead>
                            <tbody id="prooduct_data">
                                @forelse($users as $user)
                                    <tr id="">
                                        <td>{{$loop->index + 1}}</td>
                                        <td >{{$user->name}}</td>
                                        <td>{{$user->email}}</td>
                                        <td>{{ucfirst($user->roles[0]->name)}}</td>
                                        <td>{{$user->country->name}}</td>
                                        
                                        <td>
                                            <a href="{{route('user.edit', $user->id)}}" class="btn btn-sm btn-success edit">Edit</a>
                                        </td>
                                     
                                       
                                        <td>
                                            <form action="{{ route('user.destroy', $user->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" data-id="{{$user->id}}" onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                        </td>
                                       
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
                        {{ $users->links() }}
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

        $(document).on('click', '.delete', function(){
            let purchase_id = $(this).attr('data-id');
            if(confirm('Are you sure?'))
            {
                $.ajax({
                        url:  "/purchase/destroy/" + purchase_id,
                        method: 'get',
                        dataType: 'json',
                        success: function(response)
                        {
                            toastr.success(response);
                        }
                    });
            }   

        });

        

        $(document).on('click', '.delete', function(){
            let purchase_id = $(this).attr('data-id');
            if(confirm('Are you sure?'))
            {
                $.ajax({
                        url:  "/purchase/destroy/" + purchase_id,
                        method: 'get',
                        dataType: 'json',
                        success: function(response)
                        {
                            toastr.success(response);
                        }
                    });
            }   
        });
   });

</script>
@endpush