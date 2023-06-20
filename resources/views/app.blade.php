<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />

        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css')}}">
        <link rel="stylesheet" href="{{ asset('css/animate.css')}}">
        <link rel="stylesheet" href="{{ asset('css/owl.carousel.min.css')}}">
        <link rel="stylesheet" href="{{ asset('css/themify-icons.css')}}">
        <link rel="stylesheet" href="{{ asset('css/flaticon.css')}}">
        <link rel="stylesheet" href="{{ asset('css/magnific-popup.css')}}">
        <link rel="stylesheet" href="{{ asset('css/slick.css')}}">
        <link rel="stylesheet" href="{{ asset('css/gijgo.min.css')}}">
        <link rel="stylesheet" href="{{ asset('css/slick.css')}}">
        <link rel="stylesheet" href="{{ asset('css/nice-select.css')}}">
        <link rel="stylesheet" href="{{ asset('css/style.css')}}">
        <link rel="stylesheet" href="{{ asset('css/all.css')}}">

        @yield('css')
    </head>
    <body>

        <x-header/>
         @yield('content')
        <x-footer/>

        <script src="{{asset('js/jquery-1.12.1.min.js')}}"></script>
        <!-- popper js -->
        <script src="{{asset('js/popper.min.js')}}"></script>
        <!-- bootstrap js -->
        <script src="{{asset('js/bootstrap.min.js')}}"></script>
        <!-- easing js -->
        <script src="{{asset('js/jquery.magnific-popup.js')}}"></script>
        <!-- swiper js -->
        <script src="{{asset('js/swiper.min.js')}}"></script>
        <!-- swiper js -->
        <script src="{{asset('js/masonry.pkgd.js')}}"></script>
        <!-- particles js -->
        <script src="{{asset('js/owl.carousel.min.js')}}"></script>
        <!-- swiper js -->
        <script src="{{asset('js/slick.min.js')}}"></script>
        <script src="{{asset('js/gijgo.min.js')}}"></script>
        <script src="{{asset('js/jquery.nice-select.min.js')}}"></script>
        <!-- custom js -->
        <script src="{{asset('js/custom.js')}}"></script>
        @yield('js')
    </body>
</html>
