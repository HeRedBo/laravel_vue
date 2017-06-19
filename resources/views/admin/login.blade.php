<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- CSRF Token -->
	<meta name="csrf-token" contetn="{{ csrf_token() }}">
	<title>{{ config('app.name','Laravel')}}</title>

	<!-- Style -->
	<link rel="stylesheet" type="text/css" href="/css/admin.css">
	<style type="text/css">
		.help-block-error{
			color:#dd4b39;
		}
	</style>
	<script type="text/javascript">
		window.laravel = {!! json_encode([
			'csrfToken' => csrf_token(),
			]) !!}
	</script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		{{config('app.name','laravel')}}
	</div>

	<div class="login-box-body">
		
		<form action="{{url('admin/login')}}" method="POST">
			 {{ csrf_field() }}
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="username" placeholder="账号" />
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				@if ($errors->has('username'))
					<p class="help-block help-block-error">{{ $errors->first('username')}}</p>
				@endif
			</div>

			<div class="form-group has-feedback">
				<input type="password" name="password" class="form-control" placeholder="密码" />
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				@if ($errors->has('password'))
					<p class="help-block help-block-error">
						{{$errors->first('password')}}
					</p>
				@endif
			</div>
			<div class="row">
				<div class="col-xs-8">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="remember"  />记住我
						</label>
					</div>
				</div>
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block">登录</button>
				</div>
			</div>
		</form>
	</div>
</div>

	
</body>
</html>