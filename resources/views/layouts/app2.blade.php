<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

    <title>@yield('title', setting('site.title'))</title>
    <meta name="description" content="{{ setting('site.description') }}">
    <meta name="author" content="sayed khan">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- site Favicon -->
    <link rel="icon" href="{{ Voyager::image(setting('site.icon')) }}" sizes="32x32" />
    <link rel="apple-touch-icon" href="{{ Voyager::image(setting('site.icon')) }}" />
    <meta name="msapplication-TileImage" content="{{ Voyager::image(setting('site.icon')) }}" />

    
    <link rel="preload" href="{{asset('main/assets/vendor/fontawesome-free/webfonts/fa-regular-400.woff2')}}" as="font"
        type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{{asset('main/assets/vendor/fontawesome-free/webfonts/fa-solid-900.woff2')}}" as="font"
        type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{{asset('main/assets/vendor/fontawesome-free/webfonts/fa-brands-400.woff2')}}" as="font"
        type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{{asset('main/assets/fonts/wolmart87d5.woff?png09e')}}" as="font" type="font/woff"
        crossorigin="anonymous">

    <!-- Vendor CSS -->
    <link rel="stylesheet" type="text/css" href="{{asset('main/assets/vendor/fontawesome-free/css/all.min.css')}}')}}">

    <!-- Plugins CSS -->
    <!-- <link rel="stylesheet" href="assets/vendor/swiper/swiper-bundle.min.css"> -->
    <link rel="stylesheet" type="text/css" href="{{asset('main/assets/vendor/animate/animate.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('main/assets/vendor/magnific-popup/magnific-popup.min.css')}}">
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="{{asset('main/assets/vendor/swiper/swiper-bundle.min.css')}}">

    <!-- Default CSS -->
    <link rel="stylesheet" type="text/css" href="{{asset('main/assets/css/demo1.min.css')}}">

    @yield('css')
    {{-- @include('layouts.styles') --}}


</head>

<body>
    <x-app.header />
    @yield('content')
    
    <script src="{{asset('main/assets/vendor/jquery/jquery.min.js')}}"></script>
    <script src="{{asset('main/assets/vendor/jquery.plugin/jquery.plugin.min.js')}}"></script>
    <script src="{{asset('main/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js')}}"></script>
    <script src="{{asset('main/assets/vendor/zoom/jquery.zoom.js')}}"></script>
    <script src="{{asset('main/assets/vendor/jquery.countdown/jquery.countdown.min.js')}}"></script>
    <script src="{{asset('main/assets/vendor/magnific-popup/jquery.magnific-popup.min.js')}}"></script>
    <script src="{{asset('main/assets/vendor/skrollr/skrollr.min.js')}}"></script>
    <script src="{{asset('main/assets/vendor/swiper/swiper-bundle.min.js')}}"></script>
    <script src="{{asset('main/assets/js/main.min.js')}}"></script>
</body>

</html>
