<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.ebanking.dao.Models" %>
<%@page import="com.ebanking.bean.Transaction" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Show Transaction</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/showTransaction.css" rel="stylesheet">
<jsp:include page="user_header.jsp"></jsp:include>
</head>
<body>
<!--  TRANSACTION TABLE -->
<div class="container-fluid">
<%String acc = request.getSession().getAttribute("acc").toString(); %>
<h1 class="text-danger">Transaction Information : <span style="color:green;"><%out.print(acc);%></span></h1>
<div>
<table class="table table-responsive col-lg-12 col-xs-12 col-md-12 col-sm-12" style="width: 100%;">
<thead class="text-danger">
    <tr>
      <th>T-Id</th>
      <th>From</th>
      <th>To</th>
      <th>Amount</th>
      <th>Date</th>
      </tr>
  </thead>
  <tbody style="color:#000;">
  <% 
 ArrayList<Transaction> transaction = new ArrayList<Transaction>(); 
 int nor  = 0;
 Models m = new Models();
 transaction = m.TransactionInfo(acc);
 for(int i = 0; i < transaction.size(); i++){
%>
    <tr>
    <td><%out.print(transaction.get(i).getTid().toString());%></td>
      <td><%out.print(transaction.get(i).getTby().toString());%></td>	
        <td><%out.print(transaction.get(i).getTto().toString());%></td>	
          <td><%out.print(transaction.get(i).getAmount().toString());%></td>	
              <td><%out.print(transaction.get(i).getTdate().toString());%></td>	
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