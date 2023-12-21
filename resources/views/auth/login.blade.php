@extends('layouts.app')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/style.css') }}" />
    {{-- <link rel="stylesheet" href="{{ asset('assets/frontend-assets/css/plugins/slick.min.css') }}" /> --}}
    <link rel="stylesheet" href="{{ asset('assets/frontend-assetss/responsive.css') }}" />
    <link rel="stylesheet" id="bg-switcher-css" href="{{ asset('assets/frontend-assetss/css/backgrounds/bg-4.css') }}">
    {{-- <link rel="stylesheet" href="{{ asset('assets/css/checkout.css') }}"> --}}
@endsection
@section('content')
    <x-app.header />

    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="section-title">
                        {{-- <h2 class="ec-bg-title">Log In</h2> --}}
                        <h2 class="ec-title">{{ __('Welcome back!') }}</h2>
                        <p class="sub-title mb-3">{{ __('Login to your account') }}</p>
                    </div>
                </div>
                <div class="ec-login-wrapper">
                    <div class="ec-login-container" style="border: none">
                        <div class="ec-login-form">
                            <form method="POST" action="{{ route('login') }}">
                                @csrf
                                <span class="ec-login-wrap">
                                    <label for="email">Email Address<span class="text-danger">*</span></label>
                                    <input id="email" type="email" placeholder="{{ __('Email Address') }}"
                                        class="form-control bg-light @error('email') is-invalid @enderror" name="email"
                                        value="{{ old('email') }}" required autocomplete="email" autofocus>

                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </span>
                                <span class="ec-login-wrap">
                                    <label for="password">Password<span class="text-danger">*</span></label>
                                    <input id="password" type="password" placeholder="{{ __('Password') }}"
                                        class="form-control bg-light @error('password') is-invalid @enderror"
                                        name="password" required autocomplete="current-password">

                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </span>
                                <span class="ec-login-wrap ec-login-fp d-flex justify-content-end">
                                    @if (Route::has('password.request'))
                                        <a class="text-success " href="{{ route('password.request') }}">
                                            {{ __('Recover Password') }}
                                        </a>
                                    @endif
                                </span>
                                <span class="ec-login-wrap ec-login-btn">
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <button type="submit" class="btn btn-dark rounded rounded-4">
                                                {{ __('Login') }}
                                            </button>
                                        </div>
                                        <div class="col-md-6 mt-3">
                                            <span>Don't Have an account ? <a class="text-success"
                                                    href="{{ route('register') }}"> Create</a></span>
                                        </div>

                                    </div>

                                </span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('js')
    <script src="{{ asset('assets/frontend-assets/js/vendor/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('assets/frontend-assets/js/plugins/jquery.sticky-sidebar.js') }}"></script>

    <script src="{{ asset('assets/frontend-assets/js/main.js') }}"></script>
@endsection
