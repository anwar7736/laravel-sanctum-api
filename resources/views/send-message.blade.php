@extends('layouts.app')
@section('title', 'Send Message')
@section('css')
<style>
    
</style>
@endsection
@section('content')
<div class="text-center mt-3 col-5 offset-4">
    <form action="{{ route('send.message') }}" method="POST" id="sendForm">
        @csrf
       <div class="form-group">
            <input type="text" name="author" class="form-control" placeholder="Enter your name...">
       </div>
       <div class="form-group">
            <input type="text" name="message" class="form-control mt-2" style="height:100px" placeholder="Enter your message">
        </div>        
        <div class="form-group">
            <button type="submit" class="btn btn-dark mt-2 form-control sendBtn">SEND</button>
        </div>
    </form>    
    <input type="text" class="form-control mt-2" onKeyPress="handle(event)" autofocus>
    <a href="{{ route('user.list', ['query'=> 'Md','email'=>'anwar']) }}" class="btn btn-success btn-sm m-3">GO</a>
    <a href="{{ route('user.list') }}" class="btn btn-dark btn-sm m-3">Refresh</a>
    <div class="data-section">

    </div>

</div>
@endsection
@push('scripts')
  <script>
    function handle(e)
    {
        let value = e.target.value;
        if(value.length > 0)
        {
            if(e.keyCode === 13)
            {
                location.href = "send-message?search_key="+value;
            }
        }
        else return;
    }
    $(function(){
        const urlParams = new URLSearchParams(window.location.search);
        const query = urlParams.get('query');
        const search = urlParams.get('search_key');
        $.ajax({
            url: "{{route('user.list')}}",
            method: "GET",
            data: {query, search},
            success: function(res){
                $("div.data-section").html(res.html);
            }
        });
    });
    $("form#sendForm").submit(function(e){
        e.preventDefault();
        $('.error').text('');
        let url = $(this).attr('action');
        let method = $(this).attr('method');
        let data = new FormData(this);
        $.ajax({
            url,
            method,
            data, 
            contentType: false,
            processData: false,
            beforeSend: function()
            {
                $(".sendBtn").attr('disabled', true);
            },
            success: function(res)
            {
                $(".sendBtn").attr('disabled', false);
                if(res.success)
                {
                    toastr.success(res.msg);
                    $("form#sendForm")[0].reset();
                }
                else
                {
                    toastr.error(res.msg);
                }
            },
            error: function(err)
            {
                $(".sendBtn").attr('disabled', false);
                $.each(err.responseJSON.errors, function(name, text){
                    $(`input[name=${name}]`).after(`<span class="text-danger error">${text}</span>`);
                })
            }
        })
    })
  </script>
@endpush