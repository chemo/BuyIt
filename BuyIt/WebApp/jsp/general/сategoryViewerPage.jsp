<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<html>
<head>
<meta charset="utf-8">
<title>BuyIt</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
<style type="text/css" id="enject"></style>
</head>
<body>
	<jsp:include page="navbar"></jsp:include>
	<!-- Header End====================================================================== -->
	<div id="mainBody">


		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<jsp:include page="sidebarMenu"></jsp:include>
				<!-- Sidebar end=============================================== -->
				<div class="span9">




					<ul class="breadcrumb">
						<li><a href="index">Home</a> <span class="divider">/</span></li>
						<li class="active"><c:out value="${category.name}"></c:out></li>
					</ul>
					<c:forEach var="subCategory" items="${category.listSubCategories}">
						<c:if test="${not empty subCategory.products}">
							<h3>
								<a href="select_category?id=${subCategory.idSubCategory}"><c:out
										value="${subCategory.name}"></c:out></a>
							</h3>

							<div class="item">
								<ul class="thumbnails">
									<c:forEach var="product" end="3"
										items="${subCategory.products}">
										<c:set var="product" value="${product}" scope="request"></c:set>
										<jsp:include page="item_preview"></jsp:include>
									</c:forEach>
								</ul>
							</div>
							<hr class="soft" />

						</c:if>
					</c:forEach>

				</div>
			</div>
		</div>

	</div>
	<!-- MainBody End ============================= -->
	<jsp:include page="footer"></jsp:include>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	<script src="bootstrap/js/login-check.js" type="text/javascript"></script>
	<script src="themes/js/bootshop.js"></script>
	<script src="bootstrap/js/bootstrap-tooltip.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>
	<script src="bootstrap/js/tooltip.js" type="text/javascript"></script>
	<script src="bootstrap/js/search.js"></script>
	<script src="bootstrap/js/thumbnail-image-small.js"
		type="text/javascript"></script>
</body>
</html>
