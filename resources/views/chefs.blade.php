@extends('app')  
@section('content')
<x-breadcrumb message="Experienced Chefs" mgtop="mt-107"/>
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

    <!-- intro_video_bg start-->
    <section class="intro_video_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro_video_iner text-center">
                        <h2>Expect The Best</h2>
                        <div class="intro_video_icon">
                            <a id="play-video_1" class="video-play-button popup-youtube"
                                href="https://www.youtube.com/watch?v=pBFQdxA-apI">
                                <span class="ti-control-play"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- intro_video_bg part start-->
@endsection