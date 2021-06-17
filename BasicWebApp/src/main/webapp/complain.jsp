<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.ComplainModel"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Complain</title>
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
	table-layout: fixed;
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
			<div class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="home.jsp"><img
							src="img/logo.png" alt="logo" /></a>
					</div>
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li><a href="home.jsp">Home</a></li>
							<li><a href="about.jsp">About Us</a></li>
							<li><a href="services.jsp">Services</a></li>
							<li><a href="portfolio.jsp">Portfolio</a></li>
							<li><a href="pricing.jsp">Pricing</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="feedback.jsp">Feedback</a></li>
							<li class="active"><a href="complain.jsp">Complain</a></li>
							<li><a href="profile.jsp">Profile</a></li>

						</ul>
					</div>
				</div>
			</div>
		</header>
		<!-- end header -->
		<section id="inner-headline" style="background-color: black;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="pageTitle">Complain</h2>
					</div>
				</div>
			</div>
		</section>
		<section id="content">

			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="about-logo">
							<h3>Raise your hand!</h3>
							<p>Sed ut perspiciaatis unde omnis iste natus error sit
								voluptatem accusantium doloremque laudantium, totam rem aperiam,
								eaque ipsa quae ab illo inventore veritatis et quasi architecto
								beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem
								quia voluptas</p>
							<p>Sed ut perspiciaatis unde omnis iste natus error sit
								voluptatem accusantium doloremque laudantium, totam rem aperiam,
								eaque ipsa quae ab illo inventore veritatis et quasi architecto
								beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem
								quia voluptas</p>
						</div>
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
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<%
						if (request.getAttribute("msg") != null) {
							out.print("<div class=\"alert alert-error\" id=\"contactError\">");
							out.print("<strong style=\"color:red;\">" + request.getAttribute("msg") + "</strong>");
							out.print("</div>");
						}
						String name = null, email = null, subject = null, message = null, id = null;
						boolean isEdit = false;

						if (request.getAttribute("complain") != null) {
							ComplainModel complain = (ComplainModel) request.getAttribute("complain");
							email = complain.getEmail();
							name = complain.getName();
							subject = complain.getSubject();
							message = complain.getMessage();
							id = complain.getId();
							isEdit = (boolean) request.getAttribute("isEdit");
						}
						%>
						<div class="contact-form">
							<form id="contact-form" role="form"
								action="<%if (isEdit)
	out.print("ComplainController?action=update&id=" + id);
else
	out.print("ComplainController?action=raise");%>"
								method="post" novalidate="novalidate">
								<div class="form-group has-feedback">
									<label for="name">Name*</label> <input type="text"
										value="<%if (name != null)
	out.print(name);%>"
										class="form-control" id="name" name="name" placeholder=""
										required> <i class="fa fa-user form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="email">Email*</label> <input type="email"
										value="<%if (email != null)
	out.print(email);%>"
										class="form-control" id="email" name="email" placeholder=""
										required> <i
										class="fa fa-envelope form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="subject">Subject*</label> <input type="text"
										value="<%if (subject != null) {
	out.print(subject);
}%>"
										class="form-control" id="subject" name="subject"
										placeholder="" required> <i
										class="fa fa-navicon form-control-feedback"></i>
								</div>
								<div class="form-group has-feedback">
									<label for="message">Complain*</label>
									<textarea class="form-control" rows="6" id="message"
										name="message" placeholder="" required>
										<%
										if (message != null) {
											out.print(message);
										}
										%>
									</textarea>
									<i class="fa fa-pencil form-control-feedback"></i>
								</div>
								<input type="submit"
									value=" <%if (isEdit)
	out.print("Update");
else
	out.print("Submit");%>"
									style="background-color: #39c9ed;" class="btn btn-default">
							</form>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do tempor.</p>
							<div class="alert alert-success hidden" id="contactSuccess">
								<strong>Success!</strong> Your message has been sent to us.
							</div>

							<div class="alert alert-error hidden" id="contactError">
								<strong>Error!</strong> There was an error sending your message.
							</div>
							<div class="contact-form">
								<div style="height: 400px">

									<%
									if (request.getAttribute("complaints") != null) {
										ArrayList<ComplainModel> complaints = (ArrayList<ComplainModel>) request.getAttribute("complaints");
										out.print("<table>");
										out.print("<tr>");
										out.print("<th>Name</th>");
										out.print("<th>Subject</th>");
										out.print("<th>Complain</th>");
										out.print("<th>Action</th>");
										out.print("</tr>");
										out.print("<tr>");
										for (ComplainModel c : complaints) {
											out.print("<td>" + c.getName() + "</td>");
											out.print("<td>" + c.getSubject() + "</td>");
											out.print("<td>" + c.getMessage() + "</td>");
											out.print("<td><a href=\"ComplainController?action=edit&id=" + c.getId()
											+ "\"> Edit</a> | <a href=\"ComplainController?action=delete&id=" + c.getId() + "\">Delete</a></td>");
											out.print("</tr>");
										}
										out.print("</table>");
									}
									%>

								</div>

								<form id="contact-form" role="form"
									action="ComplainController?action=view" method="post"
									novalidate="novalidate">

									<input type="submit" value="View my complains"
										style="background-color: #39c9ed;" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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