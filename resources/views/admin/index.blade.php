<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
	<title>@yield('title') | {{ config('app.name','laravel')}}</title>
	
	<!-- Style -->
	<link rel="stylesheet" type="text/css" href="/css/admin.css" />
	<style type="text/css"></style>
	<script type="text/javascript">
		window.Laravel = {!! json_encode([
			'csrfToken' => csrf_token(),
			]) !!}
		window.Name = '{!! config('app.name','Laravel') !!}';
		window.User = {!! auth('admin')->user() !!};
		window.Permissons = {!!$permissions!!}
	</script>
</head>
<body class="sidebar-mini skin-purple-light" >
<div id="app"></div>
<script type="text/javascript" src="/js/admin/admin.js"></script>
</body>
</html>