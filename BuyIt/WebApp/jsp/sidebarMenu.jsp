<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar" class="span3">

	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		<c:forEach var="product" items="${products}" varStatus="statusOuter">
			<c:if test="${statusOuter.first}">
				<li class="subMenu open"><a>${product.key}</a>
					<ul>
						<c:forEach var="sub" items="${product.value}"
							varStatus="statusInner">
							<c:if test="${statusInner.first}">
								<li><a class="active" href="products.html"><i
										class="icon-chevron-right"></i>${sub}</a></li>
							</c:if>
							<c:if test="${!statusInner.first}">
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>${sub}</a></li>
							</c:if>

						</c:forEach>
					</ul></li>
			</c:if>
			<c:if test="${!statusOuter.first}">
				<li class="subMenu"><a>${product.key}</a>
					<ul style="display: none">
						<c:forEach var="sub" items="${product.value}">
							<li><a href="products.html"><i
									class="icon-chevron-right"></i>${sub}</a></li>
						</c:forEach>
					</ul></li>
			</c:if>
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