@extends('layouts.app')
@section('content')
 <div class="container card mt-3">
    <div class="row">
        <div class="col-md-5">
            <form action="{{ route('post.store') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="title">Title:</label>
                        <input type="text"  value="{{ old('title') }}" name="title" placeholder="Title..." id="title" class="form-control">
                        @error('title')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                </div>
                <div class="form-group">
                    <label for="desc">Description:</label>
                        <textarea name="body"  value="{{ old('body') }}" placeholder="Title..." id="desc" class="form-control">
                        </textarea>
                        @error('body')
                            <span class="text-danger">{{ $message }}</span>
                        @enderror
                </div>                
                <div class="form-group">
                    <label for="author">Author:</label>
                        <select name="user_id" id="author" class="form-control select2">
                            @foreach($users as $user)
                            <option value="{{ $user->id }}">{{ $user->name }}</option>
                            @endforeach
                        </select>
                </div>                
                <div class="form-group my-3" align="center">
                   <button type="submit" class="btn btn-success">Submit</button>
                </div>

            </form>
        </div>
    </div>
 </div>
@endsection