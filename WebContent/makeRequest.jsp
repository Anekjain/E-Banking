<!DOCTYPE HTML>
<html>
<head>
<title>Make Request</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/makeRequest.css" rel="stylesheet">
<jsp:include page="user_header.jsp"></jsp:include>
</head>
<body>
<!-- REQUEST FORM -->
<div id="form-container" class="col-lg-12 col-md-6 col-xs-4">

		<form name="Rform" role="form" class="col-lg-4 col-sm-4 col-xs-12"
			id="request-form" method="POST" action="makeRequest" autocomplete="off">
			<h3>Request Form</h3>
			<hr style="border-color: #000;">
			<div class="form-group">
				<input placeholder="Account No" type="text"
					class="form-control readonly" id="Accno" name="Accno"
					value="<%=session.getAttribute("acc")%>" disabled>
			</div>
			<div class="form-group">
				 <select class="form-control" id="Rtype" name="Rtype" >
				    <option value="" selected disabled>Please select</option>
					<option value="C">Check Book</option>
					<option value="L">Loan</option>
					</select>
			</div>
			<small class="text-danger">
			  Note: For Loan You should Email Us with Provided Rid 
			</small>  
				<br> 
			<input type="submit"
				class="btn btn-danger btn-lg" value="Request" 
				style="border-color: #000;"></input>

			<button type="reset" class="btn btn-default btn-lg"
				style="border-color: #000;">Clear</button>

		</form>
	</div>

<jsp:include page="user_footer.jsp"></jsp:include>
</body>
</html>
