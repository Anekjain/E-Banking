<jsp:include page="user_header.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
<head>
<title>Profile Edit</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/profileEdit.css" rel="stylesheet">
</head>
<body>
	<!--PROFILE EDIT-FORM-->
	<div id="form-container" class="col-lg-12 col-md-6 col-xs-4">

		<form name="pedit" role="form" class="col-lg-4 col-sm-4 col-xs-12"
			id="profileEdit-form" method="POST" action="update" autocomplete="off">
			<h3>Profile Edit Form</h3>
			<hr style="border-color: #000;">
			<div class="form-group">
				<input placeholder="Account Name" type="text" class="form-control"
					id="AcName" name="AcName" required>
			</div>
			<div class="form-group">
				<input placeholder="DoB" type="date" class="form-control" id="DoB"
					name="DoB" required>
			</div>
			<div class="form-group">
				<input placeholder="Address" type="text" class="form-control"
					id="Address" name="Address" required>
			</div>
			<div class="form-group">
				<input placeholder="City" type="text" class="form-control" id="City"
					name="City" required>
			</div>
			<div class="form-group">
				<input placeholder="State" type="text" class="form-control"
					id="State" name="State" required>
			</div>
			<div class="form-group">
				<input placeholder="Country" type="text" class="form-control"
					id="Country" name="Country" required>
			</div>
			<div class="form-group">
				<input placeholder="Contact No" type="tel" class="form-control"
					id="ContactNo" name="ContactNo" required>
			</div>
			<div class="form-group">
				<input placeholder="Email" type="email" class="form-control"
					id="Email" name="Email" required>
			</div>
			<small class="text-muted">* Mandatory, All Fields will get
				Updated</small>
				<br>
				<div class="text-danger">
			    ${emsg}
			    </div> 
				<input type="submit" class="btn btn-primary btn-lg"
				value="Update" style="border-color: #000;"></input>

			<button type="reset" class="btn btn-default btn-lg"
				style="border-color: #000;">Clear</button>

		</form>
	</div>



	<jsp:include page="user_footer.jsp"></jsp:include>
</body>
</html>
