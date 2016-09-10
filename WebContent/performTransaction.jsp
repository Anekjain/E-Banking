
<!DOCTYPE HTML>
<html>
<head>
<title>Perform Transaction</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/performTransaction.css" rel="stylesheet">
<jsp:include page="user_header.jsp"></jsp:include>
</head>
<body>
	<!--Transfer-FORM-->
	<div id="form-container" class="col-lg-12 col-md-6 col-xs-4">

		<form name="Tform" role="form" class="col-lg-4 col-sm-4 col-xs-12"
			id="transfer-form" method="POST" action="PerformTransaction" autocomplete="off">
			<h3>Transfer Form</h3>
			<hr style="border-color: #000;">
			<div class="form-group">
				<input placeholder="Account No" type="text"
					class="form-control readonly" id="Tby" name="Tby"
					value="<%=session.getAttribute("acc")%>" disabled>
			</div>
			<div class="form-group">
				<input placeholder="To Account" type="text" class="form-control"
					id="Tto" name="Tto" required>
			</div>
			<div class="form-group">
				<input placeholder="Amount" type="number" class="form-control"
					id="Tamount" name="Tamount" required>
			</div>
			<div class="form-group">
				<input placeholder="Transaction Password" type="password"
					class="form-control" id="Tpass" name="Tpass" required>
			</div>
			<small class="text-muted">* Mandatory, All Fields will get
				Updated. Check Again the Details. 
				</small> 
				<br> 
				<input type="submit"
				class="btn btn-danger btn-lg" value="Transfer" 
				style="border-color: #000;"></input>

			<button type="reset" class="btn btn-default btn-lg"
				style="border-color: #000;">Clear</button>

		</form>
	</div>


	<jsp:include page="user_footer.jsp"></jsp:include>
</body>
</html>
