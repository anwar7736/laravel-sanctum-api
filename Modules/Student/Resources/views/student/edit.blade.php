@extends('student::layouts.master')
@section('title', 'Update Student')
@section('content')
   <div class="row col-6 offset-4 mt-2">
   <div align="right">
        <a href="{{ route('student.index') }}" class="btn btn-secondary btn-sm">Back</a>
    </div>
    <form action="{{ route('student.update', $student->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group mt-2">
                <input type="text" name="name"  value="{{ $student->name }}" placeholder="Name..." class="form-control @error('name') is-invalid @enderror">
                @error('name')
                    <span  class="text-danger">{{ $message }}</span>
                @enderror
            </div>            
            <div class="form-group mt-2">
                <input type="email" name="email"  value="{{ $student->email }}" placeholder="Email..." class="form-control @error('email') is-invalid @enderror">
                @error('email')
                    <span  class="text-danger">{{ $message }}</span>
                @enderror
            </div>            
            <div class="form-group mt-2">
                <input type="text" name="phone"  value="{{ $student->phone }}" placeholder="Phone..." class="form-control @error('phone') is-invalid @enderror">
                @error('phone')
                    <span  class="text-danger">{{ $message }}</span>
                @enderror
            </div>            
            <div class="form-group mt-2" align="center">
                <button type="submit" class="btn btn-success">Update Student</button>
            </div>
        </form>
   </div>
@endsection