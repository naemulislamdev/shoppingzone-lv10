<section class="header-slider-section">
    @php($main_banner=\App\Model\Banner::where('banner_type','Main Banner')->where('published',1)->orderBy('id','desc')->get())
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            @foreach($main_banner as $key=>$banner)
            <li data-target="#carouselExampleIndicators" data-slide-to="{{$key}}" class="{{$key == 0? 'active':''}}"></li>
            @endforeach
        </ol>
        <div class="carousel-inner">
            @foreach($main_banner as $key=>$banner)
            <div class="carousel-item {{$key==0? 'active':''}}">
                <div class="main-slider">
                    <a href="{{$banner['url']}}">
                        <img class="d-block w-100"
                             onerror="this.src='{{asset('assets/front-end/img/image-place-holder.png')}}'"
                             src="{{asset('storage/banner')}}/{{$banner['photo']}}"
                             alt="">
                    </a>
                </div>
                <div class="slider-content-box wow animate__animated animate__fadeInUp">
                    <h5> New Arrivals 2024 </h5>
                    <h3>The Clothing Collection</h3>
                    <div class="slider-inner-btn">
                        <a href="#">Shop Collection</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
