@extends('student::layouts.master')

@section('content')
        <h1 class="text-center">All Students</h1>
        <div align="right">
            <a href="{{ route('student.create') }}" class="btn btn-success btn-sm mb-2">Add New</a>
        </div>
        @if(Session::has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> {{ Session::get('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        @endif
        <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>#Sl</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Registered At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($students as $student)
                <tr>
                    <td>{{  $loop->index + 1 }}</td>
                    <td>{{  $student->name }}</td>
                    <td>{{  $student->email }}</td>
                    <td>{{  $student->phone }}</td>
                    <td>{{  $student->created_at->format('d F, Y') }}</td>
                    <td><a href="{{ route('student.edit', $student->id) }}" class="btn btn-success btn-sm">Edit</a> | <a href="{{ route('student.destroy', $student->id) }}" onClick="return confirm('Are you sure?')" class="btn btn-danger btn-sm">Delete</a> | <a href="{{ route('student.show', $student->id) }}" class="btn btn-info btn-sm">View</a></td>
                </tr>
                @empty
                <tr>
                    <td class="text-danger text-center" colspan="5"><strong>No Data Found!</strong></td>
                </tr>
                @endforelse
                {{$students->links()}}
            </tbody>
        </table>
        </div>
@endsection
