@extends('app')
@section('content')

<x-breadcrumb message="About Us" mgtop="mt-107"/>

    <!-- about part start-->
    <section class="about_part about_bg">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-sm-4 col-lg-5 offset-lg-1">
                    <div class="about_img">
                        <img src="{{ Storage::url($about->image) }}" alt="">
                    </div>
                </div>
                <div class="col-sm-8 col-lg-4">
                    <div class="about_text">
                        <h5>Our History</h5>
                        <h2>{{$about->title }}</h2>
                        <h4>Satisfying people hunger for simple pleasures</h4>
                        <p>{{$about->excerpt }} </p>
                        <a href="{{ url('single-blog/'.$about->id) }}" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about part end-->
    <!--::review_part start::-->
    <section class="review_part gray_bg section_padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-5">
                    <div class="section_tittle">
                        <p>Testimonials</p>
                        <h2>Customers Feedback</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-11">
                    <div class="client_review_part owl-carousel">
                        <div class="client_review_single media">
                            <div class="client_img align-self-center">
                                <img src="img/client/client_1.png" alt="">
                            </div>
                            <div class="client_review_text media-body">
                                <p>Also made from. Give may saying meat there from heaven it lights face had is gathered
                                    god dea earth light for life may itself shall whales made they're blessed whales
                                    also made from give
                                    may saying meat. There from heaven it lights face had amazing place</p>
                                <h4>Mosan Cameron, <span>Executive of fedex</span></h4>
                            </div>
                        </div>
                        <div class="client_review_single media">
                            <div class="client_img align-self-center">
                                <img src="img/client/client_1.png " alt="">
                            </div>
                            <div class="client_review_text media-body">
                                <p>Also made from. Give may saying meat there from heaven it lights face had is gathered
                                    god dea earth light for life may itself shall whales made they're blessed whales
                                    also made from give
                                    may saying meat. There from heaven it lights face had amazing place</p>
                                <h4>Mosan Cameron, <span>Executive of fedex</span></h4>
                            </div>
                        </div>
                        <div class="client_review_single media">
                            <div class="client_img align-self-center">
                                <img src="img/client/client_1.png" alt="">
                            </div>
                            <div class="client_review_text media-body">
                                <p>Also made from. Give may saying meat there from heaven it lights face had is gathered
                                    god dea earth light for life may itself shall whales made they're blessed whales
                                    also made from give
                                    may saying meat. There from heaven it lights face had amazing place</p>
                                <h4>Mosan Cameron, <span>Executive of fedex</span></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::review_part end::-->
    <!--::chefs_part start::-->
    <section class="chefs_part blog_item_section section_padding">
        <div class="container">
            <div class="row">
                <div class="col-xl-5">
                    <div class="section_tittle">
                        <p>Team Member</p>
                        <h2>Our Experience Chefs</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ( $teams as $team )
                <div class="col-sm-6 col-lg-4">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="{{ Storage::url($team->avatar)}}" alt="">
                        </div>
                        <div class="single_blog_text text-center">
                            <h3>{{ $team->name }}</h3>
                            <p>Chef Master</p>
                            <div class="social_icon">
                                <a href="#"> <i class="ti-facebook"></i> </a>
                                <a href="#"> <i class="ti-twitter-alt"></i> </a>
                                <a href="#"> <i class="ti-instagram"></i> </a>
                                <a href="#"> <i class="ti-skype"></i> </a>
                            </div>
                        </div>
                    </div>
                </div>   
                @endforeach

            </div>
        </div>
    </section>
    <!--::chefs_part end::-->
@endsection