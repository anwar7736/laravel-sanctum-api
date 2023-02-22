@extends('student::layouts.master')
@section('title', 'Add New Student')
@section('content')
   <div class="row col-6 offset-4 mt-2">
   <div align="right">
        <a href="{{ route('student.index') }}" class="btn btn-secondary btn-sm">Back</a>
    </div>
    <form action="{{ route('student.store') }}" method="POST">
            @csrf
            <div class="form-group mt-2">
                <input type="text" name="name"  value="{{ old('name') }}" placeholder="Name..." class="form-control @error('name') is-invalid @enderror">
                @error('name')
                    <span  class="text-danger">{{ $message }}</span>
                @enderror
            </div>            
            <div class="form-group mt-2">
                <input type="email" name="email"  value="{{ old('email') }}" placeholder="Email..." class="form-control @error('email') is-invalid @enderror">
                @error('email')
                    <span  class="text-danger">{{ $message }}</span>
                @enderror
            </div>            
            <div class="form-group mt-2">
                <input type="text" name="phone"  value="{{ old('phone') }}" placeholder="Phone..." class="form-control @error('phone') is-invalid @enderror">
                @error('phone')
                    <span  class="text-danger">{{ $message }}</span>
                @enderror
            </div>            
            <div class="form-group mt-2" align="center">
                <button type="submit" class="btn btn-success">Add Student</button>
            </div>
        </form>
   </div>
@endsection