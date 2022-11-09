<!DOCTYPE html>
<html>
<head>
	<title>Laravel - Routing</title>
</head>
<body>
	<form method="post" action="{{route('contact.form')}}">
		@csrf
		<input type="text" name="name">
		<input type="submit" value="GO">
	</form>
	<strong>{{$name}}</strong>
</body>
</html>