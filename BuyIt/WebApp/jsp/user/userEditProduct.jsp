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
<link href="bootstrap/css/userpage.css" rel="stylesheet">
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">

<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<style type="text/css" id="enject"></style>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap-wysihtml5.css"></link>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap-datetimepicker.css"></link>
</head>
<body>
	<jsp:include page="navbar"></jsp:include>
	<!-- Header End====================================================================== -->

	<div class="container">
		<div id="maWrapper" class="corAll5">
			<ul id="vMenu">
				<li><a href="userProfile">Profile</a></li>
				<li><a href="userSalesServlet">Sales</a></li>
				<li><a href="userShoppingServlet">Shopping</a></li>
				<li><a href="userCommentsServlet">Comments</a></li>
				<li id="active"><strong>Product</strong></li>

			</ul>
			<!-- / #vMenu -->
			<div style="overflow: hidden;">
				<div width="200" class="left-menu">
					<ul class="nav nav-list" id="productTabs">
						<li class="nav-header">Product</li>
						<li><a href="userAddProductServlet">Create New</a></li>
						<li class="active"><a href="#">Edit</a></li>
					</ul>
				</div>
				<!-- /left-menu -->

				<div id="maContent" class="corAll5">
					<form action="userEditProduct" method="post"
						enctype="multipart/form-data">
						<div id="addNewSale">
							<div class="mycontent">
								<h3>Edit Auction</h3>
								<div class="myrow">
									<span class="span-1">Product name:</span> <span class="span-2"><input
										disabled="disabled" name="productName"
										value="${currentProduct.name}" /></span>
								</div>
								<div class="myrow">
									<span class="span-1">Category:</span> <span class="span-2">
										<select id="category" name="category" disabled="disabled">
											<c:forEach var="category" items="${categories}">
												<c:forEach var="sub" items="${category.listSubCategories}">
													<c:if
														test="${sub.idSubCategory eq currentProduct.subCategoryId}">
														<option value="${category.idCategory}">${category.name}</option>
													</c:if>
												</c:forEach>

											</c:forEach>
									</select>
									</span>
								</div>
								<div class="myrow">
									<span class="span-1">Sub Category:</span> <span class="span-2">
										<select disabled="disabled" id="subCategory1"
										name="subCategory">
											<c:forEach var="category" items="${categories}">
												<c:forEach var="sub" items="${category.listSubCategories}">
													<c:if
														test="${sub.idSubCategory eq currentProduct.subCategoryId}">
														<option value="${sub.idSubCategory}">${sub.name}</option>
													</c:if>
												</c:forEach>
											</c:forEach>
									</select>
									</span>
								</div>


								<div id="endedTime" class="myrow" style="padding-top: 20px;">
									<span class="span-1">End time</span> <input disabled="disabled"
										name="endTime" size="16" type="text" class="time"
										value="${currentProduct.auction.endTime}" readonly
										style="height: 20px; width: 206px; border-radius: 0; padding: 2px;">
								</div>


							</div>
							<div id="right-menu" class="my-right-content"
								style="min-height: 150; height: 150px;">

								<div id="form-container" style="padding-top: 40px">
									<div class="myrow-sales">
										<span
											style="margin-left: 0px; margin-right: 5px; width: 20px;"
											class="span-3"> <c:if
												test="${currentProduct.auction.startPrice ne 0.0}">
												<input style="height: 14px;" disabled="disabled"
													checked="checked" id="auctionCheck" name="auctionCheck"
													type="checkbox">
											</c:if> <c:if test="${currentProduct.auction.startPrice eq 0.0}">
												<input style="height: 14px;" disabled="disabled"
													id="auctionCheck" name="auctionCheck" type="checkbox">
											</c:if>
										</span> <span class="span-2"
											style="margin-left: 0px; margin-right: 5px; width: 110px;"><b>Auction</b></span>
										<span class="span-2"
											style="margin-left: 0px; margin-right: 5px; width: 100px;">Start
											price</span> <span class="span-2"> <c:if
												test="${currentProduct.auction.startPrice ne 0.0}">
												<input disabled="disabled" id="startPrice"
													readonly="readonly" style="width: 100px;" name="startPrice"
													value="${currentProduct.auction.startPrice}" />
											</c:if> <c:if test="${currentProduct.auction.startPrice eq 0.0}">
												<input disabled="disabled" id="startPrice"
													readonly="readonly" style="width: 100px;" name="startPrice"
													value="" />
											</c:if>

										</span>

									</div>
									<div class="myrow-sales">
										<span
											style="margin-left: 0px; margin-right: 5px; width: 20px;"
											class="span-3"> <c:if
												test="${currentProduct.auction.buyItNow ne 0.0}">
												<input style="height: 14px;" disabled="disabled"
													checked="checked" id="buyNowCheck" name="buyNowCheck"
													type="checkbox">
											</c:if> <c:if test="${currentProduct.auction.buyItNow eq 0.0}">
												<input style="height: 14px;" disabled="disabled"
													id="buyNowCheck" name="buyNowCheck" type="checkbox">
											</c:if>
										</span> <span class="span-2"
											style="margin-left: 0px; margin-right: 5px; width: 110px;"><b>Buy
												it now</b></span> <span class="span-2"
											style="margin-left: 0px; margin-right: 5px; width: 100px;">Price</span>
										<span class="span-2"> <c:if
												test="${currentProduct.auction.buyItNow ne 0.0}">
												<input disabled="disabled" id="buyNowPrice"
													readonly="readonly" style="width: 100px;"
													name="buyNowPrice"
													value="${currentProduct.auction.buyItNow}" />
											</c:if> <c:if test="${currentProduct.auction.buyItNow eq 0.0}">
												<input disabled="disabled" id="buyNowPrice"
													readonly="readonly" style="width: 100px;"
													name="buyNowPrice" value="" />
											</c:if>
										</span>
									</div>
									<div class="myrow-sales">
										<span class="span-2"
											style="padding-left: 140px; margin-left: 0px; margin-right: 5px; width: 100px;">Count</span>
										<span class="span-2"><input id="count"
											disabled="disabled" readonly="readonly" style="width: 100px;"
											name="count" value="${currentProduct.auction.count}" /></span>
									</div>
									<div id="errorDiv" class="alert alert-error"
										style="display: none; margin-right: 49px; margin-top: 8px; border-radius: 0 0 0 0; font-size: 14px;""></div>


								</div>
							</div>


							<div class="panel-group" id="accordion">
								<div
									style="background-color: #eeeeee; margin-top: 40px; padding-top: 3px;"
									class="panel panel-default">
									<div class="panel-heading">
										<h4 style="padding-left: 40px;" class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion" href="#collapseOne">Images <i
												style="vertical-align: middle;" class="icon-arrow-down"></i></a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="container" style="margin-left: 40px; width: 100%">
												<c:if
													test="${not empty currentProduct.description.itemPhotos}">
													<h4>Your product alredy has some images. You can add
														new...</h4>
												</c:if>
												<c:if test="${empty currentProduct.description.itemPhotos}">
													<h4>Your product hasn't any images. You can add new...</h4>
												</c:if>

												<input size="60" style="display: none;" type="file"
													id="imageUpload" name="imageUpload" accept="image/*" value=""
													multiple>
												<button type="button" id="changeImage"
													style="width: 150px; margin-left: 5px; border-color: #2f96b4; margin-top: 2px;"
													class="btn btn-info">Choose image</button>
												<button type="button" id="clearImage"
													style="width: 100px; margin-left: 5px; border-color: #2f96b4; margin-top: 2px;"
													class="btn btn-danger">Clear</button>

												<div id="errorImage" class="alert alert-error"
													style="display: none; margin-right: 49px; margin-top: 8px; border-radius: 0 0 0 0; font-size: 14px;""></div>

												<table style="width: 95%; margin-top: 20px;" id="tablelist"
													class="table">
													<tbody id="filelist">

													</tbody>
												</table>

											</div>
										</div>

									</div>
								</div>
								<div style="background-color: #eeeeee; padding-top: 3px;"
									class="panel panel-default">
									<div class="panel-heading">
										<h4 style="padding-left: 40px;" class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion" href="#collapseTwo">Delivery <i
												style="vertical-align: middle;" class="icon-arrow-down"></i></a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="container" style="margin-left: 40px;">
												<textarea class="textarea" placeholder="Enter text ..."
													style="width: 850px; height: 200px" name="delivery">${currentProduct.delivery}</textarea>

											</div>

										</div>
									</div>
								</div>
								<div style="background-color: #eeeeee; padding-top: 3px;"
									class="panel panel-default">
									<div class="panel-heading">
										<h4 style="padding-left: 40px;" class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion" href="#collapseThree">Features
												<i style="vertical-align: middle;" class="icon-arrow-down"></i>
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="container" style="margin-left: 40px;">
												<textarea class="textarea" placeholder="Enter text ..."
													style="width: 850px; height: 200px" name="features">${currentProduct.description.features}</textarea>

											</div>
										</div>
									</div>
								</div>
								<div style="background-color: #eeeeee; padding-top: 3px;"
									class="panel panel-default">
									<div class="panel-heading">
										<h4 style="padding-left: 40px;" class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion" href="#collapseFour">
												Description <i style="vertical-align: middle;"
												class="icon-arrow-down"></i>
											</a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="container" style="margin-left: 40px;">
												<textarea class="textarea" placeholder="Enter text ..."
													style="width: 850px; height: 200px" name="description">${currentProduct.description.descText}</textarea>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div id="submitButtonWrapper">
							<input style="display: none;" name="productId"
								value="${currentProduct.idProduct}">
							<button id="editProductSubmitButton" type="submit"
								style="display: none;"></button>
							<button id="editProductButton" class="btn btn-success"
								type="button">Update Auction</button>
						</div>
					</form>
				</div>
				<!-- /maContent -->
			</div>
		</div>

	</div>

	<div style="height: 60px;"></div>



	<jsp:include page="footer"></jsp:include>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>
	<script src="bootstrap/js/search.js"></script>
	<script src="bootstrap/js/wysihtml5-0.3.0.js"></script>
	<script src="bootstrap/js/bootstrap-wysihtml5.js"></script>
	<script src="bootstrap/js/userPage.js"></script>
	<script src="bootstrap/js/valid.js"></script>
	<script src="bootstrap/js/time-formatter.js"></script>


	<script>
		$('.textarea').wysihtml5();
	</script>


</body>
</html>
