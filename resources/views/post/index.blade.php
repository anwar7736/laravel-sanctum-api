@extends('layouts.app')
@section('content')
<div class="container card mt-3">
    <h4>All Posts</h4>
    <div align="right">
        <a href="{{ route('post.create') }}" class="btn btn-success btn-sm">Add New</a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>#Sl</th>
                    <th>Title</th>
                    <th>Slug</th>
                    <th>Description</th>
                    <th>Author</th>
                    <th>Published At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($posts as $key=> $post)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $post->title }}</td>
                        <td>{{ $post->slug }}</td>
                        <td>{{ $post->body }}</td>
                        <td>{{ $post->user->name }}</td>
                        <td>{{ $post->created_at->diffForHumans() }}</td>
                        <td>
                            <a href="{{ route('post.edit', $post->slug) }}" class="btn btn-info btn-sm">Edit</a>
                            <a href="{{ route('post.show', $post->slug) }}" class="btn btn-warning btn-sm">View</a>                            
                            <form  onSubmit="return confirm('Are you sure?')" action="{{ route('post.destroy', $post->slug) }}" method="POST">
                                @csrf
                                @method("DELETE")
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                @empty
                <tr>
                    <td class="text-danger text-center" colspan="7">No Data Found!</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection