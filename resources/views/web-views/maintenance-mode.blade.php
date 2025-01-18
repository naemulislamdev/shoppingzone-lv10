<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <title>
        {{\App\CPU\translate('Maintenance Mode on')}}
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" sizes="180x180"
          href="{{asset('storage/company')}}/{{$web_config['fav_icon']->value}}">
    <link rel="icon" type="image/png" sizes="32x32"
          href="{{asset('storage/company')}}/{{$web_config['fav_icon']->value}}">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Titillium+Web:wght@400;600;700&display=swap"
        rel="stylesheet">
</head>
<!-- Body-->
<body class="toolbar-enabled rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">

<div class="container rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
    <div class="row">
        <div class="col-12 mt-5">
            <center>
                <img style="width: 350px!important;" src="{{asset('assets/front-end')}}/img/maintenance-mode.jpg">
                <h1>{{\App\CPU\translate('Website is under Maintenance')}}.</h1><br>
                <h5>{{\App\CPU\translate('Plese come back later')}}.</h5>
            </center>
        </div>
    </div>
</div>

<!-- Vendor scrits: js libraries and plugins-->
{{--<script src="{{asset('assets/front-end')}}/vendor/jquery/dist/jquery.slim.min.js"></script>--}}
<script src="{{asset('assets/front-end')}}/vendor/bootstrap/bootstrap.bundle.min.js"></script>
<script src="{{asset('assets/front-end')}}/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
</body>
</html>
