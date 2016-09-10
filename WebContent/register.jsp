<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Royace Register</title>

<!--LINKS-->
         <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href="assets/css/register.css" rel="stylesheet"
     type="text/css">

    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script>
    function checkPass()
    {
        //Store the password field objects into variables ...
        var pass1 = document.getElementById('pwd');
        var pass2 = document.getElementById('cnpwd');
        //Store the Confimation Message Object ...
        var message = document.getElementById('confirmMessage');
        //Set the colors we will be using ...
        var goodColor = "#66cc66";
        var badColor = "#ff6666";
        //Compare the values in the password field 
        //and the confirmation field
        if(pass1.value == pass2.value){
            //The passwords match. 
            //Set the color to the good color and inform
            //the user that they have entered the correct password 
            pass2.style.backgroundColor = goodColor;
            message.style.color = goodColor;
           
        }else{
            //The passwords do not match.
            //Set the color to the bad color and
            //notify the user.
            pass2.style.backgroundColor = badColor;
            message.style.color = badColor;
            
        }
    }  


    </script>


	</head>
	<body>

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
            <li>
              <a id="Btn-search" class="btn btn-default btn-outline btn-circle"  data-toggle="collapse" href="#nav-collapse3" aria-expanded="false" aria-controls="nav-collapse3">Search</a>
            </li>
          </ul>
          <div class="collapse nav navbar-nav nav-collapse" id="nav-collapse3">
            <form name="reg" class="navbar-form navbar-right" role="search">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" />
              </div>
              <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </form>
          </div>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

<!--REGISTER-FORM-->
  <div id="form-container" class="col-lg-12 col-md-6 col-xs-4">

   <form name="reg" onsubmit="return myFunction();"role="form" class="col-lg-4 col-sm-4 col-xs-12" id="login-form" method="POST" action="register"
   autocomplete="off">
   <h3>Self-User Creation</h3>
  <div class="form-group">
       <input placeholder="Account No." type="text" class="form-control" id="accno" name="accno" required>
  </div>
  <div class="form-group">
       <input placeholder="Username" type="text" class="form-control" id="uid" name="uid" required>
  </div>
  <hr style="border-color:#000;">
  <div class="form-group">
       <input placeholder="DoB" type="date" class="form-control" id="date" name="date" required>
  </div>
  <div class="form-group">
       <input placeholder="PAN no." type="text" class="form-control" id="panno" name="panno"  required>
  </div>
  <div class="form-group">
       <input placeholder="Password"type="password" class="form-control" id="pwd" name="pwd"  required>
  </div>
  <div class="form-group">
       <input placeholder="Confirm-Password" type="password" class="form-control" id="cnpwd" name="cnpwd" onkeyup="checkPass(); return false;"
       required>
  </div>
   <div class="form-group">
       <input placeholder="Transaction-Password" type="password" class="form-control" id="Tpwd" name="Tpwd"  required>
  </div>
  

  <input type="submit" class="btn btn-primary btn-lg" value="Submit"  style="border-color: #000;"></input>

    <button type="reset" class="btn btn-default btn-lg" style="border-color: #000;">Clear</button>



</form>
        </div>







<!--FOOTER-->
  <footer class="footer col-lg-12 col-md-6 col-xs-2">
     <div id="footer-text">
      <h3 class="text-muted text-primary text-center">
        All <span style="color: #B40B0B;" class="glyphicon glyphicon-copyright-mark"></span>  Rights Reserved 2016.
        <span class="text-center">Royace Bank Inc.</span>
        </h3>
      </div>
        </footer>




	</body>
</html>
