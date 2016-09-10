<%@page import="com.ebanking.bean.User"%>


<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome</title>
<jsp:include page="user_header.jsp"></jsp:include>
<link href="assets/css/welcome.css" rel="stylesheet">
</head>
<body>
 <h1>Welcome User : <span>${name}</span></h1> 
 <h1> Previous Logged-In : <span>${ip}</span></h1>
 <% User user = (User)session.getAttribute("user"); %>
 <div id="table" class="container-fluid">
 <table class="table-bordered table-responsive  col-lg-8 col-xs-12 col-md-10">
  <tr id="trow">
   <th id="thd" class="col-lg-4 col-xs-6 col-md-5">Account No </th>
   <td  id="tbd" class="col-lg-4 col-xs-6 col-md-5"><%= user.getAc_no() %></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Account Name </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getAc_name() %></td>
 </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Balance </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getBalance() %></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">D.O.B </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getDoB() %></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Email </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getEmail() %></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">PAN No </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getPAN_no() %></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Address </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getAddress() %></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">City</th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getCity() %></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">State </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getState() %></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Contry </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getCountry() %></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Contact No </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getContact() %></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Type </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%= user.getType() %></td>
  </tr>

 </table> 
     
 </div>
 
<jsp:include page="user_footer.jsp"></jsp:include>
</body>
</html>

