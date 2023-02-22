@extends('layouts.app')
@section('title', 'Get User Message')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="text-center mt-3">
    <h4 class="text-white">Author: <span class="author"></span></h4>
    <p class="text-white message">Message: <span class="message"></span></p>
</div>
@endsection
@push('scripts')
<script src="https://js.pusher.com/7.2/pusher.min.js"></script>
  <script>

    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;

    var pusher = new Pusher('174bb2e9b77af7af36d8', {
      cluster: 'ap2'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
      $('span.author').text(data['author']);
      $('span.message').text(data['message']);
    });
  </script>
@endpush