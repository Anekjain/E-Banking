<%@page import="com.ebanking.bean.User"%>
<%@page import="com.ebanking.dao.Models" %>
<%@page import="java.util.ArrayList" %>

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
 <%
 String acc = request.getSession().getAttribute("acc").toString(); 
 ArrayList<User> user = new ArrayList<User>(); 
 Models m = new Models();
 user = m.Account_Userinfo(acc);
 for(int i = 0; i < user.size(); i++){
 
 %>
 <div id="table" class="container-fluid">
 <table class="table-bordered table-responsive  col-lg-8 col-xs-12 col-md-10">
  <tr id="trow">
   <th id="thd" class="col-lg-4 col-xs-6 col-md-5">Account No </th>
   <td  id="tbd" class="col-lg-4 col-xs-6 col-md-5"><%out.print(user.get(i).getAc_name().toString());%></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Account Name </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getAc_no().toString());%></td>
 </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Balance </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getBalance().toString());%></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">D.O.B </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getDoB().toString());%></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Email </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getEmail().toString());%></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">PAN No </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getPAN_no().toString());%></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Address </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getAddress().toString());%></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">City</th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getCity().toString());%></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">State </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getState().toString());%></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Country </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getCountry().toString());%></td>
  </tr>
<tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Contact No </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getContact().toString());%></td>
  </tr>
 <tr>
   <th id="thd" class="col-lg-2 col-xs-6 col-md-3">Type </th>
   <td id="tbd" class="col-lg-2 col-xs-6 col-md-3"><%out.print(user.get(i).getType().toString());%></td>
  </tr>
<%}%>
 </table> 
     
 </div>
 
<jsp:include page="user_footer.jsp"></jsp:include>
</body>
</html>
