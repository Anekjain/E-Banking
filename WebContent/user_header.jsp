<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title></title>


        <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/user_header.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>


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
           <li><a href="user_home.jsp">Home</a></li>
            <li><a href="profileEdit.jsp">Profile-Edit</a></li>
            <li><a href="performTransaction.jsp">Perfrom Transaction</a></li>
            <li><a href="makeRequest.jsp">Make Request</a></li>
            <li><a href="showTransaction.jsp">Show Transaction</a></li>
            <li><a href="showRequest.jsp">Show Request</a></li>
            <li>
            <a id="Btn-Logout" href="LogoutServlet" class="btn btn-danger" >Logout</a>
            </li>            
            <li>
              <a id="Btn-search" class="btn btn-default btn-outline btn-circle"  data-toggle="collapse" href="#nav-collapse3" aria-expanded="false" aria-controls="nav-collapse3">Search</a>
            </li>
          </ul>
          <div class="collapse nav navbar-nav nav-collapse" id="nav-collapse3">
            <form class="navbar-form navbar-right" role="search">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" />
              </div>
              <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </form>
          </div>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->