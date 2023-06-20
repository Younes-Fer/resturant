@extends('app')
@section('content')
<!-- banner part start-->
<section class="banner_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <div class="banner_text">
                    <div class="banner_text_iner">
                        <h5>Expensive but the best</h5>
                        <h1>Deliciousness jumping into the mouth</h1>
                        <p>Together creeping heaven upon third dominion be upon won't darkness rule land
                            behold it created good saw after she'd Our set living. Signs midst dominion
                            creepeth morning</p>
                        <div class="banner_btn">
                            <div class="banner_btn_iner">
                                <a href="/#reservation " class="btn_2">Reservation <img src="img/icon/left_1.svg" alt=""></a>
                            </div>
                            <a href="https://www.youtube.com/watch?v=pBFQdxA-apI" class="popup-youtube video_popup">
                                <span><img src="img/icon/play.svg" alt=""></span> Watch our story</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- banner part start-->

<!--::exclusive_item_part start::-->
<section class="exclusive_item_part blog_item_section">
    <div class="container">
        <div class="row">
            <div class="col-xl-5">
                <div class="section_tittle">
                    <p>Popular Dishes</p>
                    <h2>Our Exclusive Items</h2>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach ($popular_posts as $popular )


            <div class="col-sm-6 col-lg-4">
                <div class="single_blog_item">
                    <div class="single_blog_img">
                        <img src="{{ Storage::url($popular->image)}}" alt="">
                    </div>
                    <div class="single_blog_text">
                        <h3>{{$popular->title}}</h3>
                        <p>{{$popular->excerpt}} </p>
                        <a href="{{ url('single-blog/'.$popular->id) }}" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--::exclusive_item_part end::-->

<!-- about part start-->
<section class="about_part">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-sm-4 col-lg-5 offset-lg-1">
                <div class="about_img">
                    <img src="{{ Storage::url($post_about->image)}}" alt="{{ $post_about->title }}" loading="lazy">
                </div>
            </div>
            <div class="col-sm-8 col-lg-4">
                <div class="about_text">
                    <h5>Our History</h5>
                    <h2>{{ $post_about->title }}</h2>
                    <h4>Satisfying people hunger for simple pleasures</h4>
                    {{ $post_about->excerpt }}
                    <a href="{{ url('/single-blog/'.$post_about->id) }}" class="btn_3">Read More <img src="img/icon/left_2.svg" alt="" loading="lazy"></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- about part end-->

<!-- intro_video_bg start-->
<section class="intro_video_bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="intro_video_iner text-center">
                    <h2>Expect The Best</h2>
                    <div class="intro_video_icon">
                        <a id="play-video_1" class="video-play-button popup-youtube" href="https://www.youtube.com/watch?v=pBFQdxA-apI">
                            <span class="ti-control-play"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- intro_video_bg part start-->

<!-- food_menu start-->
<section class="food_menu gray_bg">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="section_tittle">
                    <p>Popular Menu</p>
                    <h2>Delicious Food Menu</h2>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="nav nav-tabs food_menu_nav" id="myTab" role="tablist">
                    <a class="active" id="Special-tab" data-toggle="tab" href="#Special" role="tab" aria-controls="Special" aria-selected="false">Special <img src="img/icon/play.svg" alt="play"></a>
                    <a id="Breakfast-tab" data-toggle="tab" href="#Breakfast" role="tab" aria-controls="Breakfast" aria-selected="false">Breakfast <img src="img/icon/play.svg" alt="play"></a>
                    <a id="Launch-tab" data-toggle="tab" href="#Launch" role="tab" aria-controls="Launch" aria-selected="false">Launch <img src="img/icon/play.svg" alt="play"></a>
                    <a id="Dinner-tab" data-toggle="tab" href="#Dinner" role="tab" aria-controls="Dinner" aria-selected="false">Dinner <img src="img/icon/play.svg" alt="play"> </a>
                    <a id="Sneaks-tab" data-toggle="tab" href="#Sneaks" role="tab" aria-controls="Sneaks" aria-selected="false">Sneaks <img src="img/icon/play.svg" alt="play"></a>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active single-member" id="Special" role="tabpanel" aria-labelledby="Special-tab">
                        <div class="row">
                            @foreach ( $posts_menus as $menu )
                            <div class="col-sm-6 col-lg-6">
                                <div class="single_food_item media">
                                    <img src="{{ Voyager::image($menu->image)}}" class="mr-3" alt="{{ $menu->title}}" width="175" height="163">
                                    <div class="media-body align-self-center">
                                        <h3>Easter Delight</h3>
                                        <p>{{ 'hkk'}}</p>
                                        <h5>$40.00</h5>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="tab-pane fade single-member" id="Breakfast" role="tabpanel" aria-labelledby="Breakfast-tab">
                        <div class="row">
                            @foreach ( $posts_menus as $menu )
                            <div class="col-sm-6 col-lg-6">
                                <div class="single_food_item media">
                                    <img src="{{ Voyager::image($menu->image)}}" class="mr-3" alt="{{ $menu->title}}" width="175" height="163">
                                    <div class="media-body align-self-center">
                                        <h3>Easter Delight</h3>
                                        <p>{{ 'hkk'}}</p>
                                        <h5>$40.00</h5>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="tab-pane fade single-member" id="Launch" role="tabpanel" aria-labelledby="Launch-tab">
                        <div class="row">
                            @foreach ( $posts_menus as $menu )
                            <div class="col-sm-6 col-lg-6">
                                <div class="single_food_item media">
                                    <img src="{{ Voyager::image($menu->image)}}" class="mr-3" alt="{{ $menu->title}}" width="175" height="163">
                                    <div class="media-body align-self-center">
                                        <h3>Easter Delight</h3>
                                        <p>{{ 'hkk'}}</p>
                                        <h5>$40.00</h5>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="tab-pane fade single-member" id="Dinner" role="tabpanel" aria-labelledby="Dinner-tab">
                        <div class="row">
                            @foreach ( $posts_menus as $menu )
                            <div class="col-sm-6 col-lg-6">
                                <div class="single_food_item media">
                                    <img src="{{ Voyager::image($menu->image)}}" class="mr-3" alt="{{ $menu->title}}" width="175" height="163">
                                    <div class="media-body align-self-center">
                                        <h3>Easter Delight</h3>
                                        <p>{{ 'hkk'}}</p>
                                        <h5>$40.00</h5>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="tab-pane fade single-member" id="Sneaks" role="tabpanel" aria-labelledby="Sneaks-tab">
                        <div class="row">
                            @foreach ( $posts_menus as $menu )
                            <div class="col-sm-6 col-lg-6">
                                <div class="single_food_item media">
                                    <img src="{{ Voyager::image($menu->image)}}" class="mr-3" alt="{{ $menu->title}}" width="175" height="163">
                                    <div class="media-body align-self-center">
                                        <h3>Easter Delight</h3>
                                        <p>{{ 'hkk'}}</p>
                                        <h5>$40.00</h5>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- food_menu part end-->

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
            @foreach ($teams as $team)
            <div class="col-sm-6 col-lg-4">
                <div class="single_blog_item">
                    <div class="single_blog_img">
                        <img src="{{ Storage::url($team->avatar) }}" alt="">
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

<!--::regervation_part start::-->

@if (session('success'))
<div class="alert alert-success mx-5" role="alert">

    {{ session('success') }}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
@endif

@if (session('error'))
<div class="alert alert-danger mx-5" role="alert">

    {{ session('error') }}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
@endif
<x-formreservation :tables="$tables" />
<!--::regervation_part end::-->

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

<!--::exclusive_item_part start::-->
<section class="blog_item_section blog_section section_padding">
    <div class="container">
        <div class="row">
            <div class="col-xl-5">
                <div class="section_tittle">
                    <p>Recent News</p>
                    <h2>Latest From Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach ($last_posts as $last)


            <div class="col-sm-6 col-lg-4">
                <div class="single_blog_item">
                    <div class="single_blog_img">
                        <img src="{{ Storage::url($last->image)}}" alt="{{ $last->title}}">
                    </div>
                    <div class="single_blog_text">
                        <div class="date">
                            <a href="#" class="date_item">{{ $last->created_at->format('M d, Y')}} </a>
                            <a href="#" class="date_item"> <span>#</span> Food News </a>
                        </div>
                        <h3><a href="{{ url('single-blog/'.$last->id) }}">{{ $last->excerpt}}</a></h3>
                        <a href="{{ url('single-blog/'.$last->id) }}" class="btn_3">Read More <img src="img/icon/left_1.svg" alt=""></a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--::exclusive_item_part end::-->
@endsection