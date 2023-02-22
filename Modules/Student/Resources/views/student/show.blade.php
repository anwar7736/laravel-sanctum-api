@extends('student::layouts.master')
@section('title', 'View Student')
@section('content')
   <div class="row col-6 offset-4 mt-2">
            <div align="right">
                <a href="{{ route('student.index') }}" class="btn btn-secondary btn-sm">Back</a>
            </div>
            <div class="form-group mt-2">
                <input type="text" name="name"  value="{{ $student->name }}" disabled placeholder="Name..." class="form-control @error('name') is-invalid @enderror">
            </div>            
            <div class="form-group mt-2">
                <input type="email" name="email"  value="{{ $student->email }}" disabled placeholder="Email..." class="form-control @error('email') is-invalid @enderror">
            </div>            
            <div class="form-group mt-2">
                <input type="text" name="phone"  value="{{ $student->phone }}" disabled placeholder="Phone..." class="form-control @error('phone') is-invalid @enderror">
            </div>            
        </form>
   </div>
@endsection