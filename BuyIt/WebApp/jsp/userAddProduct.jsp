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
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
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
				<li><a href="#">Comments</a></li>
				<li id="active"><strong>Product</strong></li>
				
			</ul>
			<!-- / #vMenu -->
			<div style="overflow: hidden;">
				<div width="200" class="left-menu">
					<ul class="nav nav-list" id="productTabs">
						<li class="nav-header">Product</li>
						<li class="active"><a href="#">Create New</a></li>
						
					</ul>
				</div>
				<!-- /left-menu -->

				<div id="maContent" class="corAll5">
					<form action="userAddProductServlet" method="post">
					<div id="addNewProduct">
						<div class="mycontent">
							<h3>Create new auction</h3>
							<div class="myrow">
								<span class="span-1">Product name:</span> <span class="span-2"><input
									name="productName" value="" /></span>
							</div>
							<div class="myrow">
								<span class="span-1">Category:</span> <span class="span-2">
									<select id="category" name="category">
										<option value=""></option>
										<c:forEach var="category" items="${categories}">
											<option value="${category.idCategory}">${category.name}</option>
										</c:forEach>
								</select>
								</span>
							</div>
							<div class="myrow">
								<span class="span-1">Sub Category:</span> <span class="span-2">
									<c:if test=""></c:if> <select disabled="disabled"
									id="subCategory" name="subCategory">
										<option value=""></option>

								</select>
								</span>
							</div>
							

							<div id="endedTime" class="myrow" style="display: none; padding-top:20px;">
								<span class="span-1">End time</span>
								<div style="padding-left: 40px; padding-bottom: 20px;"
									class="input-append date form_datetime"
									data-date="2013-10-23T15:25:00Z">
									<input name="endTime" size="16" type="text" value="" readonly style="height:20px; width:163px; border-radius:0; padding: 2px;"> <span
										class="add-on" style="height:20px; padding: 2px;"><i class="icon-remove"></i></span> <span
										class="add-on" style="height:20px; border-radius:0; padding: 2px;"><i class="icon-calendar"></i></span>
								</div>
							</div>


						</div>
						<div id="right-menu" class="my-right-content"
							style="min-height: 150; height: 150px;">

							<div id="form-container" style="padding-top: 40px">
								<div class="myrow-sales">
									<span style="margin-left: 0px; margin-right: 5px; width: 20px;"
										class="span-3"> <input id="auctionCheck" name="auctionCheck"
										type="checkbox">
									</span> <span class="span-2"
										style="margin-left: 0px; margin-right: 5px; width: 110px;"><b>Auction</b></span>
									<span class="span-2"
										style="margin-left: 0px; margin-right: 5px; width: 100px;">Start
										price</span> <span class="span-2"><input id="startPrice"
										readonly="readonly" style="width: 100px;" name="startPrice"
										value="" /></span>

								</div>
								<div class="myrow-sales">
									<span style="margin-left: 0px; margin-right: 5px; width: 20px;"
										class="span-3"> <input id="buyNowCheck" name="buyNowCheck" type="checkbox">
									</span> <span class="span-2"
										style="margin-left: 0px; margin-right: 5px; width: 110px;"><b>Buy
											it now</b></span> <span class="span-2"
										style="margin-left: 0px; margin-right: 5px; width: 100px;">Price</span>
									<span class="span-2"><input id="buyNowPrice"
										readonly="readonly" style="width: 100px;" name="buyNowPrice"
										value="" /></span>
								</div>
								<div class="myrow-sales">
									<span class="span-2"
										style="padding-left: 140px; margin-left: 0px; margin-right: 5px; width: 100px;">Count</span>
									<span class="span-2"><input id="count"
										readonly="readonly" style="width: 100px;" name="count"
										value="" /></span>
								</div>



							</div>
						</div>


						<div class="panel-group" id="accordion">
							<div style="background-color: #eeeeee; margin-top:40px; padding-top: 3px;"
								class="panel panel-default">
								<div class="panel-heading">
									<h4 style="padding-left: 40px;" class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne">Delivery</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="container" style="margin-left: 40px;">
											<textarea class="textarea" placeholder="Enter text ..."
												style="width: 850px; height: 200px" name="delivery"></textarea>

										</div>

									</div>
								</div>
							</div>
							<div style="background-color: #eeeeee; padding-top: 3px;"
								class="panel panel-default">
								<div class="panel-heading">
									<h4 style="padding-left: 40px;" class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo">Features</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="container" style="margin-left: 40px;">
											<textarea class="textarea" placeholder="Enter text ..."
												style="width: 850px; height: 200px" name="features"></textarea>

										</div>
									</div>
								</div>
							</div>
							<div style="background-color: #eeeeee; padding-top: 3px;"
								class="panel panel-default">
								<div class="panel-heading">
									<h4 style="padding-left: 40px;" class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree">
											Description</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="container" style="margin-left: 40px;">
											<textarea class="textarea" placeholder="Enter text ..."
												style="width: 850px; height: 200px" name="description"></textarea>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div id="submitButtonWrapper">
						<input style="display: none;" name="userId" value="${user.idUser}">
						<button disabled="disabled" id="addProductSubmitButton" class="btn btn-success" type="submit">Create Auction</button>
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
	<script src="bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="bootstrap/js/userPage.js"></script>

	<script>
		$('.textarea').wysihtml5();
	</script>

	<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd hh:mm:ss",
        autoclose: true,
        todayBtn: true,
        startDate: "2013-02-14 10:00",
        minuteStep: 5
    });
</script>

</body>
</html>