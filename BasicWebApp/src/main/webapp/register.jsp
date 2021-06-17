<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://webthemez.com" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

</head>
<body>
	<div id="wrapper">
		<section id="inner-headline" style="background-color: #39c9ed;">
			<div class="container"
				style="background-color: #39c9ed; width: 100%; padding: 0px 0px 0 150px">
				<div class="row" style="background-color: #39c9ed;">
					<div class="col-lg-12">
						<h2 class="pageTitle">Register</h2>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row" style="margin: 0 0 0 420px;">
					<div class="col-md-7">
						<%
						if (request.getAttribute("errorList") != null) {
							ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errorList");
							for (String s : errors) {
						%>
						<div class="alert alert-danger alert-dismissible fade in">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<%
							out.print(s);
							%>
						</div>

						<%
						}
						}
						%>
						<div class="contact-form">
							<form id="contact-form" role="form"
								action="RegisterController" method="post"
								novalidate="novalidate">
								<div class="form-group has-feedback" style="width: 400px;">
									<label for="name">Username*</label> <input type="text"
										class="form-control" id="name" name="username" placeholder="">
									<i class="fa fa-user form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback" style="width: 400px;">
									<label for="email">Email id*</label> <input type="email"
										class="form-control" id="email" name="email" placeholder="">
									<i class="fa fa-envelope form-control-feedback"></i>
								</div>

								<div class="form-group has-feedback" style="width: 400px;">
									<label for="email">Password*</label> <input type="password"
										class="form-control" id="email" name="password" placeholder="">
									<i class="fa fa-lock form-control-feedback"></i>
								</div>

								<input type="submit"
									style="width: 400px; background-color: #39c9ed;" value="Submit"
									class="btn btn-default">

							</form>
							<a href="index.jsp" style="margin: 0 0 0 140px;">I'm already
								in</a>
						</div>
					</div>
				</div>
			</div>

		</section>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/validate.js"></script>
</body>
</html>