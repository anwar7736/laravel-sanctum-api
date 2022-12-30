@extends('layouts.app')
@section('title', 'Post List')
@section('content')
    <div class="m-5 text-danger p-5 card">
        {{--
            <table class="table table-bordered table-hover bg-light d-none">
            <thead>
                <tr>
                    <th>Sl</th>
                    <th>Post Title</th>
                    <th>De</th>
                    <th>Phone</th>
                    <th>City</th>
                    <th>Post Code</th>
                </tr>
            </thead>
            <tbody>
                @foreach($users as $user)
                    <tr>
                        <td>{{$loop->index + 1}}</td>
                        <td>{{$user->name}}</td>
                        <td>{{$user->email}}</td>
                        <td>{{$user->profile->phone}}</td>
                        <td>{{$user->profile->city}}</td>
                        <td>{{$user->profile->post_code}}</td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <h3>Total User : {{$user->count()}}</h3>
            </tfoot>
        </table>
        --}}
            @foreach($posts as $post)
                <h5>Title : {{$post->title}}</h5>
                <h5>Creator : {{$post->user->name}}</h5>
                <h4>Comments <sup class="badge bg-success">{{$post->comments_count}}</sup></h4>
                @foreach($post->comments as $comment)
                    <p>Commentor : {{$comment->user->name}}</p>
                    <p>{{$comment->comments}}</p>
                @endforeach
            @endforeach
        
    </div>

@endsection