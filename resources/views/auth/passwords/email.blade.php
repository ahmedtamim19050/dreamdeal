@extends('layouts.app')
@section('css')


@endsection
@section('content')

<x-app.header />
    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="section-title">

                        <h2 class="ec-title">Reset Password</h2>

                    </div>
                </div>
                <div class="ec-login-wrapper">
                    <div class="ec-login-container" style="border: none">
                        <div class="ec-login-form">
                            <form method="POST" action="{{ route('password.email') }}">
                                @csrf
                                <span class="ec-login-wrap">

                                    <input id="email" type="email" placeholder="{{ __('Email Address') }}"
                                        class="form-control bg-light @error('email') is-invalid @enderror" name="email"
                                        value="{{ old('email') }}" required autocomplete="email" autofocus>

                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </span>

                                <span class="ec-login-wrap ec-login-btn">
                                    <div class="col-md-12 ">
                                        <button type="submit" class="btn btn-dark rounded rounded-4 w-100" style="font-size:14px">
                                          Send Password reset link
                                        </button>

                                </span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
