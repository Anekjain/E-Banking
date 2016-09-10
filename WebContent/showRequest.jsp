<%@page import="com.ebanking.dao.Models" %>
<%@page import="com.ebanking.bean.Request" %>
<%@page import="java.util.ArrayList" %>


<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="user_header.jsp"></jsp:include>
<title>Show Requests</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="" rel="stylesheet">
</head>
<body>
<!--  REQUEST TABLE -->
<div class="container-fluid">
<%String acc = request.getSession().getAttribute("acc").toString(); %>
<h1 class="text-danger">Request Information : <span style="color:green;"><%out.print(acc);%></span></h1>
<div>
<small style="color:white">Type: C-Check-Book & L-Loan</small>
<table class="table table-responsive col-lg-12 col-xs-12 col-md-12 col-sm-12" style="width: 100%; background-color: azure;">
<thead class="text-danger" >
    <tr>
      <th>R-Id</th>
      <th>Type(C/L)</th>
      <th>Date</th>
      <th>Time</th>
      <th>Status</th>
     </tr>
  </thead>
  <tbody style="color:#000;">
  <% 
 ArrayList<Request> request1 = new ArrayList<Request>(); 
 int nor  = 0;
 Models m = new Models();
 request1 = m.RequestInfo(acc);
 for(int i = 0; i < request1.size(); i++){
%>
    <tr>
    <td><%out.print(request1.get(i).getRid().toString());%></td>
      <td><%out.print(request1.get(i).getRtype().toString());%></td>	
        <td><%out.print(request1.get(i).getRdate().toString());%></td>	
          <td><%out.print(request1.get(i).getRtime().toString());%></td>	
              <td><%out.print(request1.get(i).getRstatus().toString());%></td>	
                </tr>	 
 <% 
  }
 %>     
	
  </tbody>
</table>
</div>
</div>
<jsp:include page="user_footer.jsp"></jsp:include>
</body>
</html>