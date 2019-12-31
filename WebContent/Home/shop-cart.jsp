<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/FoodStore/Home/404.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/Home/";
	String stylepath = request.getContextPath() + "/Home/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="<%=stylepath%>css/647be82565184316a7ba9bc638b40a97.css"
	rel="stylesheet" />
<link href="<%=stylepath%>css/1025b57c3b8b4b63a93efd3b6bed0d58.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=stylepath%>css/main.css" />
</head>
<body class="animsition">
	<div class="shop-cart" id="page">
		<header class="header-style-1 static">
			<div class="container">
				<div class="row">
					<div class="header-1-inner">
						<a class="brand-logo animsition-link"
							href="<%=basePath%>index.jsp"> <img class="img-responsive"
							src="<%=stylepath%>picture/logo.png" alt="" />
						</a>
						<nav>
							<ul class="menu hidden-xs">
								<li><a href="<%=basePath%>index.jsp">Home</a></li>
								<li><a class="active" href="<%=basePath%>shop.jsp">Shop</a>
									<ul>
										<li><a href="<%=basePath%>shop.jsp">Shop List</a></li>
										<li><a href="<%=basePath%>shop-cart.jsp">Shop Cart</a></li>
									</ul></li>
								<li><a href="<%=basePath%>about.jsp">About</a></li>
								<li><a href="<%=basePath%>contact.jsp">Contact</a></li>
							</ul>
						</nav>
						<aside class="right">
							<%
								if (session.getAttribute("SESSION_USER") == null) {
							%>
							<a href="<%=basePath%>login.jsp">登录</a> <a
								href="<%=basePath%>register.jsp">注册</a>
							<%
								} else {
							%>
							<a href="">${sessionScope.SESSION_USER.email}</a>&nbsp;&nbsp; <a
								href="/FoodStore/UserLogoutServlet">退出</a>
							<%
								}
							%>
							<div class="widget widget-control-header widget-search-header">
								<a
									class="control btn-open-search-form js-open-search-form-header"
									href="#"> <span class="lnr lnr-magnifier"></span>
								</a>
								<div class="form-outer">
									<button
										class="btn-close-form-search-header js-close-search-form-header">
										<span class="lnr lnr-cross"></span>
									</button>
									<form>
										<input placeholder="Search" />
										<button class="search">
											<span class="lnr lnr-magnifier"></span>
										</button>
									</form>
								</div>
							</div>
							<div
								class="widget widget-control-header widget-shop-cart js-widget-shop-cart">
								<a class="control" href="shop-cart.jsp">
									<p class="counter">0</p> <span class="lnr lnr-cart"></span>
								</a>
							</div>
							<div
								class="widget widget-control-header hidden-lg hidden-md hidden-sm">
								<a class="navbar-toggle js-offcanvas-has-events" type="button"
									href="#menu"> <span class="icon-bar"></span> <span
									class="icon-bar"></span> <span class="icon-bar"></span>
								</a>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</header>
		<section class="sub-header shop-detail-1">
			<img class="rellax bg-overlay" src="<%=stylepath%>picture/013.jpg"
				alt="">
			<div class="overlay-call-to-action"></div>
			<h3 class="heading-style-3">Shop Cart</h3>
		</section>
		<section class="boxed-sm">
			<div class="container">
				<div class="woocommerce">
					<form class="woocommerce-cart-form">
						<table class="woocommerce-cart-table">
							<thead>
								<tr>
									<th class="product-thumbnail">Product</th>
									<th class="product-name"></th>
									<th class="product-weight">商品ID</th>
									<th class="product-quantity">Quantity</th>
									<th class="product-price">Price</th>
									<th class="product-subtotal">Total</th>
									<th class="product-remove"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="product" items="${sessionScope.cart.cartItems}">
									<tr>
										<td class="product-thumbnail"><img
											src="<%=stylepath%>picture/thumb-cart-01.jpg"
											alt="product-thumbnail"></td>
										<td class="product-name" data-title="Product"><a
											class="product-name" href="<%=basePath%>shop-detail.jsp">${product.value.product.product_name }</a></td>
										<td class="product-weight" data-title="商品id">${product.value.product.id }</td>
										<td class="product-quantity" data-title="Quantity"><input
											class="qty" step="1" min="0" max="" name="product-name"
											value="${product.value.buyNum }" title="Qty" size="4"
											pattern="[0-9]*" inputmode="numeric" type="number"></td>
										<td class="product-price" data-title="Price">${product.value.product.product_price }</td>
										<td class="product-subtotal" data-title="Total">${product.value.subTotal}</td>
										<td class="product-remove"><a class="remove"
											href="/FoodStore/ProductlistServlet?type=deleteproduct&id=${product.value.product.id }"
											aria-label="Remove this item">×</a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7">
										<div class="form-coupon organic-form">
											<div class="form-group">
												<input class="form-control pill" placeholder="Coupon Code">
											</div>
											<div class="form-group">
												<a class="btn btn-brand pill"
													href="/FoodStore/PlaceOrderServlet">place order</a>
											</div>
											<div class="form-group update-cart">
												<a class="btn btn-brand-ghost pill"
													href="/FoodStore/ProductlistServlet?type=clearcart">Clear
													Cart</a>
											</div>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
					<div class="cart_totals">
						<h3 class="title">Cart Total</h3>
						<div class="row">
							<div class="col-md-8">
								<table class="woocommerce-cart-subtotal">
									<tbody>
										<tr>
											<th>Total</th>
											<td data-title="Total">${sessionScope.cart.total}</td>
										</tr>
									</tbody>
								</table>
								<div class="proceed-to-checkout">
									<a class="btn btn-brand pill" href="#">PROCEED TO CHECKOUT</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<footer class="footer-style-1">
		<div class="container">
			<div class="row">
				<div class="footer-style-1-inner">
					<div class="widget-footer widget-text col-first col-small">
						<a href="#"> <img class="logo-footer"
							src="<%=stylepath%>picture/logo.png" alt="Logo Organic" />
						</a>
						<div class="widget-link">
							<ul>
								<li><span class="lnr lnr-map-marker icon"></span> <span>379
										5th Ave New York, NYC 10018</span></li>
								<li><span class="lnr lnr-phone-handset icon"></span> <a
									href="tel:0123456789">(+1) 96 716 6879</a></li>
								<li><span class="lnr lnr-envelope icon"></span> <a
									href="mailto: contact@site.com">contact@site.com </a></li>
							</ul>
						</div>
					</div>
					<div class="widget-footer widget-link col-second col-medium">
						<div class="list-link">
							<h4 class="h4 heading">SHOP</h4>
							<ul>
								<li><a href="#">Food</a></li>
								<li><a href="#">Farm</a></li>
								<li><a href="#">Health</a></li>
								<li><a href="#">Organic</a></li>
							</ul>
						</div>
						<div class="list-link">
							<h4 class="h4 heading">SUPPORT</h4>
							<ul>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Blog</a></li>
							</ul>
						</div>
						<div class="list-link">
							<h4 class="h4 heading">MY ACCOUNT</h4>
							<ul>
								<li><a href="#">Sign In</a></li>
								<li><a href="#">My Cart</a></li>
								<li><a href="#">My Wishlist</a></li>
								<li><a href="#">Check Out</a></li>
							</ul>
						</div>
					</div>
					<div
						class="widget-footer widget-newsletter-footer col-last col-small">
						<h4 class="h4 heading">NEWSLETTER</h4>
						<p>Subscribe now to get daily updates</p>
						<form class="organic-form form-inline btn-add-on circle border">
							<div class="form-group">
								<input class="form-control pill transparent"
									placeholder="Your Email..." type="email" />
								<button class="btn btn-brand circle" type="submit">
									<i class="fa fa-envelope-o"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="copy-right style-1">
			<div class="container">
				<div class="row">
					<div class="copy-right-inner">
						<p>Copyright © 2017 Designed by AuThemes. All rights reserved.</p>
						<div class="widget widget-footer widget-footer-creadit-card">
							<ul class="list-unstyle">
								<li><a href="#"> <img
										src="<%=stylepath%>picture/creadit-card-01.png"
										alt="creadit card" />
								</a></li>
								<li><a href="#"> <img
										src="<%=stylepath%>picture/creadit-card-02.png"
										alt="creadit card" />
								</a></li>
								<li><a href="#"> <img
										src="<%=stylepath%>picture/creadit-card-03.png"
										alt="creadit card" />
								</a></li>
								<li><a href="#"> <img
										src="<%=stylepath%>picture/creadit-card-04.png"
										alt="creadit card" />
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="modal fade" id="quick-view-product" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg modal-quickview woocommerce"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<div class="woocommerce-product-gallery">
								<div class="main-carousel-product-quick-view">
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/01.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/02.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/03.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/04.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/05.jpg"
											alt="product thumbnail" />
									</div>
								</div>
								<div class="thumbnail-carousel-product-quickview">
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/01.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/02.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/03.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/04.jpg"
											alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive" src="<%=stylepath%>picture/05.jpg"
											alt="product thumbnail" />
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="summary">
								<div class="desc">
									<div class="header-desc">
										<h2 class="product-title">Sald</h2>
										<p class="price">$2.00</p>
									</div>
									<div class="body-desc">
										<div class="woocommerce-product-details-short-description">
											<p>Duis vestibulum ante velit. Pellentesque orci felis,
												pharetra ut pharetra ut, interdum at mauris. Aenean
												efficitur aliquet libero sit amet scelerisque. Suspendisse
												efficitur mollis eleifend. Aliquam tortor nibh, venenatis
												quis sem dapibus, varius egestas lorem a sollicitudin.</p>
										</div>
									</div>
									<div class="footer-desc">
										<form class="cart">
											<div class="quantity buttons-added">
												<input class="minus" value="-" type="button" /> <input
													class="input-text qty text" step="1" min="1" max=""
													name="quantity" value="1" title="Qty" size="4"
													pattern="[0-9]*" inputmode="numeric" type="number" /> <input
													class="plus" value="+" type="button" />
											</div>
											<div class="group-btn-control-wrapper">
												<button class="btn btn-brand no-radius">ADD TO CART</button>
												<button class="btn btn-wishlist btn-brand-ghost no-radius">
													<i class="fa fa-heart"></i>
												</button>
											</div>
										</form>
									</div>
								</div>
								<div class="product-meta">
									<p class="posted-in">
										Categories: <a href="#" rel="tag">Food</a>
									</p>
									<p class="tagged-as">
										Tags: <a href="#" rel="tag">Natural</a>, <a href="#" rel="tag">Organic</a>,
										<a href="#" rel="tag">Health</a>, <a href="#" rel="tag">Green</a>,
										<a href="#" rel="tag">Vegetable</a>
									</p>
									<p class="id">
										ID: <a href="#">A203</a>
									</p>
								</div>
								<div class="widget-social align-left">
									<ul>
										<li><a class="facebook" data-toggle="tooltip"
											title="Facebook" href="http://www.facebook.com/authemes">
												<i class="fa fa-facebook"></i>
										</a></li>
										<li><a class="pinterest" data-toggle="tooltip"
											title="Pinterest" href="http://www.pinterest.com/authemes">
												<i class="fa fa-pinterest"></i>
										</a></li>
										<li><a class="twitter" data-toggle="tooltip"
											title="Twitter" href="http://www.twitter.com/authemes"> <i
												class="fa fa-twitter"></i>
										</a></li>
										<li><a class="google-plus" data-toggle="tooltip"
											title="Google Plus" href="https://plus.google.com/authemes">
												<i class="fa fa-google-plus"></i>
										</a></li>
										<li><a class="instagram" data-toggle="tooltip"
											title="Instagram" href="https://instagram.com/authemes">
												<i class="fa fa-instagram"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=stylepath%>js/jquery.min.js"></script>
	<script src="<%=stylepath%>js/bootstrap.min.js"></script>
	<script src="<%=stylepath%>js/function-check-viewport.js"></script>
	<script src="<%=stylepath%>js/slick.min.js"></script>
	<script src="<%=stylepath%>js/select2.full.min.js"></script>
	<script src="<%=stylepath%>js/imagesloaded.pkgd.min.js"></script>
	<script src="<%=stylepath%>js/jquery.mmenu.all.min.js"></script>
	<script src="<%=stylepath%>js/rellax.min.js"></script>
	<script src="<%=stylepath%>js/isotope.pkgd.min.js"></script>
	<script src="<%=stylepath%>js/bootstrap-notify.min.js"></script>
	<script src="<%=stylepath%>js/bootstrap-slider.js"></script>
	<script src="<%=stylepath%>js/in-view.min.js"></script>
	<script src="<%=stylepath%>js/countup.js"></script>
	<script src="<%=stylepath%>js/animsition.min.js"></script>
	<script src="<%=stylepath%>js/global.js"></script>
	<script src="<%=stylepath%>js/config-mm-menu.js"></script>
	<!--Ajax实现单体登录-->
	<script src="<%=stylepath%>js/Single_sign_on.js"></script>
</body>
</html>
