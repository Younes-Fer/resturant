@extends('app')  
@section('content')
<x-breadcrumb message="Contact Us" mgtop="mt-107"/>

  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
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
        {{session('error') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
  @endif
    <div class="container">
      <div class="d-none d-sm-block mb-5 pb-4">
        <div id="map" style="height: 480px;">
            <iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d30220.842402351493!2d-7.662186629670312!3d33.5804675384641!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e0!4m0!4m5!1s0xda7d3376468ad97%3A0x3656824daddfe60!2sLa%20Closerie%2C%20185%20Boulevard%20Bir%20Anzarane%2C%20Casablanca%2020000!3m2!1d33.5830397!2d-7.6414333!5e0!3m2!1sfr!2sma!4v1686054578401!5m2!1sfr!2sma" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>


      </div>


      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">Get in Touch</h2>
        </div>
        <div class="col-lg-8">
          <form class="form-contact contact_form" action="{{ route('contact')}}" method="post" id="contactForm"
            novalidate="novalidate">
            @csrf
            <div class="row">
              <div class="col-12">
                <div class="form-group">

                  <textarea class="form-control w-100  @error('message') is-invalid @enderror" name="message" id="message" cols="30" rows="9"
                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'"
                    placeholder='Enter Message' required></textarea>
                    @error('message')
                    <small>
                      <span class="text-danger ml-1">
                        {{ $message }}
                      </span>
                    </small>
                     @enderror
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group">
                  <input class="form-control  @error('name') is-invalid @enderror" name="name" id="name" type="text" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter your name'" placeholder='Enter your name'required>
                    @error('name')
                    <small>
                      <span class="text-danger ml-1">
                        {{ $message }}
                      </span>
                    </small>
                    @enderror

                  </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group">
                  <input class="form-control" name="email" id="email" type="email" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter email address'" placeholder='Enter email address' required>
                    @error('email')
                    <small>
                      <span class="text-danger ml-1">
                        {{ $message }}
                      </span>
                    </small>
                    @enderror
                  </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter Subject'" placeholder='Enter Subject' required>
                    @error('subject')
                    <small>
                      <span class="text-danger ml-1">
                        {{ $message }}
                      </span>
                    </small>
                    @enderror
                  </div>
              </div>
            </div>
            <div class="form-group mt-3">
              <button type="submit" class="button button-contactForm btn_4">Send Message</button>
            </div>
          </form>
        </div>
        <div class="col-lg-4">
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-home"></i></span>
            <div class="media-body">
              <h3>Buttonwood, California.</h3>
              <p>Rosemead, CA 91770</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
            <div class="media-body">
              <h3>00 (440) 9865 562</h3>
              <p>Mon to Fri 9am to 6pm</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
              <h3>support@colorlib.com</h3>
              <p>Send us your query anytime!</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ contact section end ================= -->
@endsection