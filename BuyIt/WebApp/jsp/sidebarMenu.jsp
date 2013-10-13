<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar" class="span3">

	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		<c:forEach var="category" items="${categories}" varStatus="statusOuter">
			<li class="subMenu">
				<a>${category.name}</a>
				<c:if test="${category.idCategory == categoryId}">
				<ul>
					<c:forEach var="sub" items="${category.listSubCategories}">
					<li>
						<a href="select_category?id=${sub.idSubCategory}&categoryId=${category.idCategory}">
							<i class="icon-chevron-right"></i>${sub.name}
						</a>
					</li>
					</c:forEach>
				</ul>
				</c:if>
				<c:if test="${category.idCategory != categoryId}">
				<ul style="display: none">
					<c:forEach var="sub" items="${category.listSubCategories}">
					<li>
						<a href="select_category?id=${sub.idSubCategory}&categoryId=${category.idCategory}">
							<i class="icon-chevron-right"></i>${sub.name}
						</a>
					</li>
					</c:forEach>
				</ul>
				</c:if>
			</li>
		</c:forEach>
	</ul>

	<br>
	<div class="thumbnail">
		<img src="themes/images/products/panasonic.jpg"
			alt="Bootshop panasonoc New camera">
		<div class="caption">
			<h5>Panasonic</h5>
			<h4 style="text-align: center">
				<a class="btn" href="product_details.html"> <i
					class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
					class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a>
			</h4>
		</div>
	</div>
	<br>
	<div class="thumbnail">
		<img src="themes/images/products/kindle.png"
			title="Bootshop New Kindel" alt="Bootshop Kindel">
		<div class="caption">
			<h5>Kindle</h5>
			<h4 style="text-align: center">
				<a class="btn" href="product_details.html"> <i
					class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
					class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a>
			</h4>
		</div>
	</div>
	<br>
	<div class="thumbnail">
		<img src="themes/images/payment_methods.png"
			title="Bootshop Payment Methods" alt="Payments Methods">
		<div class="caption">
			<h5>Payment Methods</h5>
		</div>
	</div>
</div>