<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style type="text/css">
</style>
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	if (request.getSession().getAttribute("isLoggedin") != null) {
		boolean isLoggedin = (boolean) request.getSession().getAttribute("isLoggedin");
		if (isLoggedin) {
			response.sendRedirect("home.jsp");
		}
	}
	%>
	<div id="wrapper">
		<section id="inner-headline" style="background-color: #39c9ed;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="pageTitle">Login</h2>
					</div>
				</div>
			</div>
		</section>
		<section id="content">

			<div class="container">
				<div class="row" style="margin: 0 0 0 400px;">
					<div class="col-md-6">

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
							<form id="contact-form" role="form" action="LoginController"
								method="post" novalidate="novalidate">

								<div class="form-group has-feedback">
									<label for="name">Email*</label> <input type="email"
										class="form-control" id="name" name="email" placeholder="">
									<i class="fa fa-user form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="email">Password*</label> <input type="password"
										class="form-control" id="email" name="password" placeholder="">
									<i class="fa fa-lock form-control-feedback"></i>
								</div>

								<input type="submit"
									style="width: 340px; background-color: #39c9ed;" value="Submit"
									class="btn btn-default">
							</form>
							<a href="register.jsp" style="margin: 0 0 0 140px;">I'm new
								here</a>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
			</div>
		</section>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
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