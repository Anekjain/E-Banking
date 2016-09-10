<!DOCTYPE html>

<html lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Royace Index</title>

        <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/index.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
	$('.carousel').carousel({
	      interval: 3000
	    });
	$('.carousel-control.right').trigger('click');
	});
</script>

    </head>
    <body>
    <!-- Second navbar for categories -->
    <!-- Second navbar for search -->
    <nav class="navbar navbar-inverse">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-3">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
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
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

      <!-- Full Page Image Background Carousel Header -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url(assets/img/gold.jpg);"></div>
                <div class="transbox">
                   <div class="carousel-caption">
                    <h2 id="caption1">" Success is the ability to go from one failure to another with no Loss of Enthusiasm " - <span>Winston Churchill.</span></h2>
                </div>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url(assets/img/rsz_1money1.jpg);"></div>
                 <div class="transbox">
                   <div class="carousel-caption">
                    <h2 id="caption2">" To Do Great Things is to love what you do " - <span>Steve Jobs.</span></h2>
                </div>
            </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url(assets/img/piggy.jpg);"></div>
                 <div class="transbox">
                   <div class="carousel-caption">
                    <h2 id="caption3">" Dont Ever Let Someone Tell You You can't do something " -<span>Chris Garden.</span></h2>
                </div>
            </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>
<!--Slider End-->


<!--FOOTER-->
  <footer class="footer">
     <div id="footer-text">
      <h3 class="text-muted text-primary text-center">
        All <span  style="color: #B40B0B;" class="glyphicon glyphicon-copyright-mark"></span>  Rights Reserved 2016.
        <span class="text-center">Royace Bank Inc.</span>

        </h3>
      </div>
        </footer>




    </body>
</html>
