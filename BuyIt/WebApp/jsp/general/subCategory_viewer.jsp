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
						<li><a href="index">Home</a> <span class="divider">/</span>
						</li>
						<li><a href="categoryViewer?id=${categoryId}">${categoryName}</a>
							<span class="divider">/</span></li>
						<li class="active"><c:out value="${subCategory.name}"></c:out></li>
					</ul>

					<h3>
						<c:out value="${subCategory.name}"></c:out>
					</h3>
					<c:if test="${not empty subCategory.products}">
						<div class="item">
							<ul class="thumbnails">
								<c:forEach var="product" items="${subCategory.products}">
									<c:set var="product" value="${product}" scope="request"></c:set>
									<jsp:include page="item_preview"></jsp:include>
								</c:forEach>
							</ul>
						</div>
						<hr class="soft" />
						<div class="pagination">
							<ul>
								<c:if test="${page != 1}">
									<li>
										<a href="select_category?page=${page - 1}&id=${subCategory.idSubCategory}">&lsaquo;</a>
									</li>
								</c:if>

								<c:forEach begin="1" end="${noOfPages}" var="i">
									<c:choose>
										<c:when test="${page eq i}">
											<li class="active"><a href="#">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="select_category?page=${i}&id=${subCategory.idSubCategory}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${page lt noOfPages}">
									<li>
										<a href="select_category?page=${page + 1}&id=${subCategory.idSubCategory}">&rsaquo;</a>
									</li>
								</c:if>
							</ul>
						</div>
					</c:if>

				</div>
			</div>
		</div>
		<!-- MainBody End ============================= -->
		<jsp:include page="footer"></jsp:include>
		<!-- Placed at the end of the document so the pages load faster ============================================= -->
		<script src="themes/js/jquery.js" type="text/javascript"></script>
		<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="themes/js/google-code-prettify/prettify.js"></script>
		<script src="themes/js/bootshop.js"></script>
		<script src="bootstrap/js/bootstrap-tooltip.js"></script>
		<script src="themes/js/jquery.lightbox-0.5.js"></script>
		<script src="bootstrap/js/thumbnail-image-small.js"
			type="text/javascript"></script>
		<script src="bootstrap/js/search.js"></script>
		<script src="bootstrap/js/time-formatter.js"></script>
</body>
</html>
