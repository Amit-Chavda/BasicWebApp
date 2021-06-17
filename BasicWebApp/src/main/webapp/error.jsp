<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.ComplainModel"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>error</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://webthemez.com" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style type="text/css">
table {
	text-align: center;
	width: 100%;
	border-color: 1px solid rgba(0, 0, 0, 0.3);
}

th {
	color: black;
	text-align: center;
	border-radius: 25px;
}

table tr td, th {
	border: 1px solid rgba(0, 0, 0, 0.3);
	padding: 5px;
}

table td a {
	margin: 10px;
	color: white;
	background: black;
	padding: 0 5px 0 5px;
	background: black;
}

table td a:hover {
	text-decoration: none;
	color: #05f5e9;
}
</style>
</head>
<body>
	<div id="wrapper">
		<!-- start header -->
		<header>
			<div
				style="text-align: right; color: black; background-color: black; color: white; width: 100%;">
				<p style="margin-right: 50px; background-color: black;">
					<%
					if (session.getAttribute("isLoggedin") != null && session.getAttribute("isLoggedin").toString().equals("true")) {
						out.print(session.getAttribute("username").toString());
					}
					%>
				</p>
			</div>
			<section id="inner-headline" style="background-color: black;">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="pageTitle">OOPS! Something went wrong!</h2>
						</div>
					</div>
				</div>
			</section>
			<section id="content">
				<div class="row">
					<div class="col-md-12" style="text-align:center;">
						<%
						if (request.getAttribute("errorMsg") != null) {
							out.print("<div class=\"alert alert-error\" id=\"contactError\">");
							out.print("<strong style=\"color:red;font-size:20px;\">" + request.getAttribute("errorMsg") + "</strong>");
							out.print("</div>");
						}
						%>
					</div>
				</div>
			</section>
		</header>
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Our Contact</h5>
							<address>
								<strong>Target company Inc</strong><br> JC Main Road, Near
								Silnile tower<br> Pin-21542 NewYork US.
							</address>
							<p>
								<i class="icon-phone"></i> (123) 456-789 - 1255-12584 <br>
								<i class="icon-envelope-alt"></i> email@domainname.com
							</p>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Quick Links</h5>
							<ul class="link-list">
								<li><a href="#">Latest Events</a></li>
								<li><a href="#">Terms and conditions</a></li>
								<li><a href="#">Privacy policy</a></li>
								<li><a href="#">Career</a></li>
								<li><a href="#">Contact us</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Latest posts</h5>
							<ul class="link-list">
								<li><a href="#">Lorem ipsum dolor sit amet, consectetur
										adipiscing elit.</a></li>
								<li><a href="#">Pellentesque et pulvinar enim. Quisque
										at tempor ligula</a></li>
								<li><a href="#">Natus error sit voluptatem accusantium
										doloremque</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Recent News</h5>
							<ul class="link-list">
								<li><a href="#">Lorem ipsum dolor sit amet, consectetur
										adipiscing elit.</a></li>
								<li><a href="#">Pellentesque et pulvinar enim. Quisque
										at tempor ligula</a></li>
								<li><a href="#">Natus error sit voluptatem accusantium
										doloremque</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="sub-footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright">
								<p>
									<span>&copy; Target 2014 All right reserved. By </span><a
										href="http://webthemez.com" target="_blank">WebThemez</a>
								</p>
							</div>
						</div>
						<div class="col-lg-6">
							<ul class="social-network">
								<li><a href="#" data-placement="top" title="Facebook"><i
										class="fa fa-facebook"></i></a></li>
								<li><a href="#" data-placement="top" title="Twitter"><i
										class="fa fa-twitter"></i></a></li>
								<li><a href="#" data-placement="top" title="Linkedin"><i
										class="fa fa-linkedin"></i></a></li>
								<li><a href="#" data-placement="top" title="Pinterest"><i
										class="fa fa-pinterest"></i></a></li>
								<li><a href="#" data-placement="top" title="Google plus"><i
										class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>
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