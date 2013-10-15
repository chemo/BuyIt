<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<html lang="en">
<head>
<meta charset="utf-8">
<title>BuyIt</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="themes/bootshop/bootstrap.min.css" media="screen">
<link href="themes/css/base.css" rel="stylesheet" media="screen">
<!-- Bootstrap style responsive -->
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<jsp:include page="navbar"></jsp:include>
	<!-- Header End====================================================================== -->
	<div id="carouselBlk">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<c:forEach var="image" items="${carouselImages}" varStatus="status">
					<c:if test="${status.first}">
						<div class="item active">
							<div class="container">
								<a href="registration"><img style="width: 100%"
									src="${image}" alt="special offers"></a>
							</div>
						</div>
					</c:if>
					<c:if test="${!status.first}">
						<div class="item">
							<div class="container">
								<a href="registration"><img style="width: 100%"
									src="${image}" alt="special offers"></a>
							</div>
						</div>
					</c:if>

				</c:forEach>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next">›</a>
		</div>
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<jsp:include page="sidebarMenu"></jsp:include>
				<!-- Sidebar end=============================================== -->
				
				<div class="span9">
					<ul class="breadcrumb">
						<li class="active">
							<a href="homePageServlet">Home</a>
						</li>
					</ul>

					<h3>
						Latest Auctions
					</h3>
				</div>
				
				<c:if test="${not empty latestProducts}">
					<div class="item">
						<ul class="thumbnails">
							<c:forEach var="product" items="${latestProducts}">
								<c:set var="product" value="${product}" scope="request"></c:set>
								<jsp:include page="item_preview"></jsp:include>
							</c:forEach>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer"></jsp:include>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

</body>
</html>