@extends('layouts.app')
@section('title', 'All Role')
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
                    <h3>All Role List</h3>
                </div>
                <div class="card-body">
                <div align="left" class="">
                    <a href="{{route('user.index')}}" class="btn btn-primary btn-sm">All User List</a>
                </div>    
                <div align="right" class="mb-2">
                    <a href="{{route('role.create')}}" class="btn btn-info btn-sm">Add Role</a>
                </div>
               
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped purchase_table">
                            <thead class="bg-dark text-light">
                                <tr>
                                    <th>#Sl</th>
                                    <th>Name</th>
                                    <th>Permissions</th>
                               
                                    <th>Edit</th>
                               
                                 
                                    <th>Delete</th>
                                  
                                </tr>
                            </thead>
                            <tbody id="prooduct_data">
                                @forelse($roles as $role)
                                    <tr id="">
                                        <td>{{$loop->index + 1}}</td>
                                        <td >{{$role->name}}</td>
                                        <td>
                                            @foreach($role->permissions as $permission)
                                            <span class="badge badge-sm bg-success pb-2">{{$permission->name}}</span>
                                            @endforeach

                                        </td>
                                       
                                        <td>
                                            <a href="{{route('role.edit', $role->id)}}" class="btn btn-sm btn-success edit">Edit</a>
                                        </td>
                                       
                                        
                                        <td>
                                            <form action="{{ route('role.destroy', $role->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" data-id="{{$role->id}}" onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                        </td>
                                        
                                    </tr>
                                    @empty
                                    <tr>
                                        <td colspan="6">
                                            <div class="text-danger text-center">
                                                <h5>No Data Found!!</h5>
                                            </div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                            
                        </table>
                        {{ $roles->links() }}
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