<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Portfolio</title>
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
							<li class="active"><a href="portfolio.jsp">Portfolio</a></li>
							<li><a href="pricing.jsp">Pricing</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="feedback.jsp">Feedback</a></li>
							<li><a href="complain.jsp">Complain</a></li>
							<li><a href="profile.jsp">Profile</a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>
		<!-- end header -->
		<section id="inner-headline" style="background-color:black;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="pageTitle">Portfolio</h2>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="about-logo">
							<h3>We are awesome!</h3>
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
						<a href="#" class="btn btn-color" style="background-color:#39c9ed;">Read more</a>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<ul class="portfolio-categ filter">
							<li class="all active"><a href="#">All</a></li>
							<li class="web"><a href="#" title="">Web design</a></li>
							<li class="icon"><a href="#" title="">Mobile App</a></li>
							<li class="graphic"><a href="#" title="">UI design</a></li>
						</ul>
						<div class="clearfix"></div>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-0"
										data-type="web">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/1.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/1.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-1"
										data-type="icon">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/2.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/2.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="graphic">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/3.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/3.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-0"
										data-type="web">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/4.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/4.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-4"
										data-type="web">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/5.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/5.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-5"
										data-type="icon">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/6.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/6.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<li class="item-thumbs col-lg-3 design" data-id="id-0"
										data-type="web">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/7.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/7.jpg" alt="">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-0"
										data-type="graphic">
										<!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="Portfolio name" href="img/works/8.jpg"> <span
											class="overlay-img"></span> <span class="overlay-img-thumb"><i
												class="icon-info-blocks fa fa-code"></i></span>
									</a> <!-- Thumb Image and Description --> <img
										src="img/works/8.jpg" alt="">
									</li>
									<!-- End Item Project -->
								</ul>
							</section>
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
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Recent Images</h5>
							<div class="flickr_badge">
								<script type="text/javascript"
									src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
							</div>
							<div class="clear"></div>
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
</body>
</html>