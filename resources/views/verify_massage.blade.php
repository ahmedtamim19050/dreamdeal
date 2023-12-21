@extends('layouts.app')
@section('content')
<x-app.header />
<h3 class="text-center my-5 py-5">
    Thank you for registering!
    Please confirm your email! <br>
    <a href="{{route('again.verify.token')}}" class="btn btn-dark me-auto mt-4">Resend email</a>
</h3>

@endsection