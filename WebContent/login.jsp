<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Royace Login</title>

<!--LINKS-->
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet">
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="assets/css/login.css" rel="stylesheet" type="text/css">
<script src="assets/js/login.js"></script>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>
<!--  <script type="text/javascript">
$(document).ready(function(){
    $('#er').fadeOut(2000);
});
</script>
-->

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-3">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Royace Bank</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse-3">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">Home</a></li>
						<li><a href="Developer.jsp">Developer</a></li>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="login.jsp">Login</a></li>
					<li><a id="Btn-search"
						class="btn btn-default btn-outline btn-circle"
						data-toggle="collapse" href="#nav-collapse3" aria-expanded="false"
						aria-controls="nav-collapse3">Search</a></li>
				</ul>
				<div class="collapse nav navbar-nav nav-collapse" id="nav-collapse3">
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" />
						</div>
						<button type="submit" class="btn btn-danger">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</form>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

	<!--LOGIN-FORM-->
	<div id="form-container" class="col-lg-12 col-md-6 col-xs-4">

		<form role="form" class="col-lg-4 col-sm-4 col-xs-12" id="login-form"
			action="login" method="POST" autocomplete="off" >
			<h3>Login</h3>
			<div class="form-group">

				<input placeholder="Username" type="text" class="form-control"
					id="uname" name="uname" required="required" >
			</div>
			<div class="form-group">

				<input placeholder="Password" type="password" class="form-control"
					id="upass" name="upass" required="required" >
			</div>
			<div id="" class="text-danger">

			</div>
			<a class="text-danger" href="passwordReset.jsp" style="font-weight: 700;">Forgot Password ?</a>
			<br>
			<button type="submit" class="btn btn-primary btn-lg">Login</button>
			<a type="submit" class="btn btn-default btn-lg" href="register.jsp">Register</a>

		</form>
	</div>







	<!--FOOTER-->
	<footer class="footer col-lg-12 col-md-6 col-xs-2">
		<div id="footer-text">
			<h3 class="text-muted text-primary text-center">
				All <span style="color: #B40B0B;"
					class="glyphicon glyphicon-copyright-mark"></span> Rights Reserved
				2016. <span class="text-center">Royace Bank Inc.</span>
			</h3>
		</div>
	</footer>




</body>
</html>
