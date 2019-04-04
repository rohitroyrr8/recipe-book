<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Recipe Book - A Project with Laravel and VueJS</title>
        <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
        <link href="https://unpkg.com/nprogress@0.2.0/nprogress.css" rel="stylesheet" />
        <script src="https://unpkg.com/nprogress@0.2.0/nprogress.js"></script>
         <!-- Fonts -->
        <!-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet"> -->

    </head>
    <body>
        <div id="root"></div>
    </body>
    <script type="text/javascript" src="{{ asset('js/app.js') }}"></script>   
</html>
