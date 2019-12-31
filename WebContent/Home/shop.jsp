<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="team.dlrow.foodstore.pojo.*"
	import="team.dlrow.foodstore.dao.CommodityClassController"%>
<%
	CommodityClassController control = new CommodityClassController();
	List<CommodityClassOne> commodityClassOne = control.findCommodityClassOne();
	request.setAttribute("commodityClassOne", commodityClassOne);
	List<CommodityClassTwo> commodityClassTwo = control.findCommodityClassTwo();
	request.setAttribute("commodityClassTwo", commodityClassTwo);
	request.getAttribute("commodityClassOneList");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	String stylepath = request.getContextPath() + "/Home/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>前台购物页面</title>
<link href="<%=stylepath%>css/647be82565184316a7ba9bc638b40a97.css"
	rel="stylesheet" />
<link href="<%=stylepath%>css/1025b57c3b8b4b63a93efd3b6bed0d58.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=stylepath%>css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/FoodStore/Admin/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="/FoodStore/Admin/static/admin/css/admin.css" />
<link href="/FoodStore/Admin/admin/index/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="/FoodStore/Admin/admin/index/js/jquery.js"></script>
<script type="text/javascript">
        var xmlHttp;
        function createXMLHttpRequest() {
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            else if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }
        }
        function beginCheck() {
            var tempCommodityClassThreeId = document.getElementById("CommodityClassThreeId").value;
            if (tempCommodityClassThreeId == "") {
                document.getElementById("check").innerHTML = "请输入";
                return;
            }
            createXMLHttpRequest();
            xmlHttp.onreadystatechange = processor;
            xmlHttp.open("GET", "<%=basePath%>CheckServlet?CommodityClassThreeId=" + tempCommodityClassThreeId);
            xmlHttp.send(null);
        }
        function processor() {
            var responseContext;
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    responseContext = xmlHttp.responseText;
                    if (responseContext.indexOf("true") != -1) {
                        document.getElementById("check").innerHTML = "正确";
                    } else {
                        document.getElementById("check").innerHTML = "代码已存在";
                    }
                }
            }
        }
        function selscts() {
            var selected = document.getElementById("bigclass");
            if (selected.options[selected.selectedIndex].value == 0) {
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = callback;
                xmlHttp.open("GET", "<%=basePath%>SelectServlet?action=CommodityClassThree&bigclass=0");
                xmlHttp.send(null);
            } else {
                var selectvalue = selected.options[selected.selectedIndex].value;
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = callback;
                xmlHttp.open("GET", "<%=basePath%>SelectServlet?action=CommodityClassThree&bigclass="+ selectvalue);
			xmlHttp.send(null);
		}
	}
</script>
</head>
<body>
<body class="animsition">
	<div class="shop-layout-1" id="page">

		<header class="header-style-1 static">
		<div class="container">
			<div class="row">
				<div class="header-1-inner">
					<a class="brand-logo animsition-link"
						href="/FoodStore/Home/index.jsp"> <img class="img-responsive"
						src="/FoodStore/Home/picture/logo.png" alt="logo" />
					</a>
					<nav>
					<ul class="menu hidden-xs">
						<li><a href="/FoodStore/Home/index.jsp">Home</a></li>
						<li><a class="active" href="/FoodStore/Home/shop.jsp">Shop</a>
							<ul>
								<li><a href="/FoodStore/Home/shop.jsp">Shop List</a></li>
								<li><a href="/FoodStore/Home/shop-cart.jsp">Shop Cart</a></li>

							</ul></li>
						<li><a href="/FoodStore/Home/about.jsp">About</a></li>

						<li><a href="/FoodStore/Home/contact.jsp">Contact</a></li>
					</ul>
					</nav>
					<aside class="right"> <%
 	if (session.getAttribute("SESSION_USER") == null) {
 %> <a href="/FoodStore/Home/login.jsp">登录</a> <a
						href="/FoodStore/Home/register.jsp">注册</a> <%
 	} else {
 %> <a href="">${sessionScope.SESSION_USER.email}</a>&nbsp;&nbsp; <a
						href="/FoodStore/UserLogoutServlet">退出</a> <%
 	}
 %>
					<div class="widget widget-control-header widget-search-header">
						<a class="control btn-open-search-form js-open-search-form-header"
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
						<a class="control" href="/FoodStore/Home/shop-cart.jsp">
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
		<section class="sub-header shop-layout-1"> <img
			class="rellax bg-overlay" src="/FoodStore/Home/picture/01.jpg" alt="">
		<div class="overlay-call-to-action"></div>
		<h3 class="heading-style-3">Shop</h3>
		</section>
		<div class="woocommerce-top-control wrapper">
			<section class="boxed-sm">
			<div class="container">
				<div class="row">
					<div class="woocommerce-top-control">
						<p class="woocommerce-result-count">Showing 1 - 12 of 30
							results</p>
						<form class="woocommerce-ordering select-custom-wrapper"
							method="get">
							<select class="orderby select-custom-wrapper" name="orderby">
								<option value="menu_order" selected="selected">Default
									sorting</option>
								<option value="popularity">Sort by popularity</option>
								<option value="rating">Sort by average rating</option>
								<option value="date">Sort by newness</option>
								<option value="price">Sort by price: low to high</option>
								<option value="price-desc">Sort by price: high to low</option>
							</select>
						</form>
					</div>
				</div>
			</div>
			</section>
		</div>
		<section class="box-sm">
		<div class="wrap-container clearfix">
			<div class="column-content-detail">
				<!-- 增删除标栏 -->
				<form action="<%=basePath%>ShopServlet" method="get">
					<%-- <div class="layui-inline">
						<c:choose>
							<c:when test="${CommodityClassThreeId == null }">
								<input autofocus="autofocus" placeholder="商品编号"
									name="CommodityClassThreeId" type="text" maxlength="8"
									class="layui-input" />
							</c:when>
							<c:otherwise>
								<input value="${CommodityClassThreeId }" placeholder="商品编号"
									name="CommodityClassThreeId" type="text" maxlength="8"
									class="layui-input" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="layui-inline">
						<c:choose>
							<c:when test="${CommodityClassThreeName == null }">
								<input placeholder="商品名称" name="CommodityClassThreeName"
									type="text" maxlength="30" class="layui-input" />
							</c:when>
							<c:otherwise>
								<input value="${CommodityClassThreeName }" placeholder="商品名称"
									name="CommodityClassThreeName" type="text" maxlength="30"
									class="layui-input" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="layui-inline">
						<select id="bigclass" onChange="selscts()"
							class="IdSelect dfinput" name="CommodityClassOneId">
							<option value="">所属一级类</option>
							<c:forEach var="cco" items="${commodityClassOne}">
								<c:choose>
									<c:when
										test="${cco.commodityClassOneId.equals(CommodityClassOneId)}">
										<option value="${cco.commodityClassOneId}" selected="selected">${cco.commodityClassOneName}</option>
									</c:when>
									<c:otherwise>
										<option value="${cco.commodityClassOneId}">${cco.commodityClassOneName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div> --%>
					<div class="layui-inline">
						<select id="subclass" class="IdSelect dfinput"
							name="CommodityClassTwoId">
							<option value="">查看商品</option>
							<c:forEach var="cct" items="${commodityClassTwo}">
								<c:choose>
									<c:when
										test="${cct.commodityClassTwoId.equals(CommodityClassTwoId)}">
										<option value="${cct.commodityClassTwoId}" selected="selected">${cct.commodityClassTwoName}</option>
									</c:when>
									<c:otherwise>
										<option value="${cct.commodityClassTwoId}">${cct.commodityClassTwoName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<input type="hidden" name="action" value="find" /> <input
						type="submit" value="Screen" class="layui-btn layui-btn-normal" />
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row main">
				<div
					class="row product-grid-equal-height-wrapper product-equal-height-4-columns flex multi-row">
					<!-- 商品详情  -->
					<c:forEach var="cct" items="${CommodityClassThreeList}"
						varStatus="number">
						<figure class="item">
						<div class="product product-style-1">
							<div class="img-wrapper">
								<a href="/FoodStore/Home/shop-detail.jsp"> <img
									class="img-responsive" src="${cct.imgsrc}"
									alt="product thumbnail" />
								</a>
								<div class="product-control-wrapper bottom-right">
									<div class="wrapper-control-item">
										<a class="js-quick-view" href="#" type="button"
											data-toggle="modal" data-target="#quick-view-product"> <span
											class="lnr lnr-eye"></span>
										</a>
									</div>
									<div class="wrapper-control-item item-wish-list">
										<a class="js-wish-list js-notify-add-wish-list" href="#">
											<span class="lnr lnr-heart"></span>
										</a>
									</div>
									<div
										class="wrapper-control-item item-add-cart js-action-add-cart"
										onclick="ajax('${cct.commodityClassThreeName }','${cct.commodityClassThreePrice }','${cct.commodityClassThreeId }')">
										<a class="animate-icon-cart" href="#"> <span
											class="lnr lnr-cart"></span>
										</a>
									</div>
								</div>
							</div>
							<figcaption class="desc text-center">
							<h3>
								<a class="product-name" href="/FoodStore/Home/shop-detail.jsp">${cct.commodityClassThreeName }</a>
							</h3>
							<span class="price">${cct.commodityClassThreePrice }</span> </figcaption>
						</div>
						</figure>
					</c:forEach>
				</div>
				<div class="row">
					<div class="col-md-12 text-right">
						<nav>
						<ul class="pagination pagination-style-1">
							<li><a class="prev page-numbers" href="#"> <i
									class="fa fa-angle-left"></i>
							</a></li>
							<li><a class="page-numbers" href="#">3</a></li>
							<li><a class="page-numbers" href="#">4</a></li>
							<li><span class="page-numbers current">5</span></li>
							<li><a class="next page-numbers" href="#"> <i
									class="fa fa-angle-right"></i>
							</a></li>
						</ul>
						</nav>
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
						src="/FoodStore/Home/picture/logo.png" alt="Logo Organic" />
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
									src="/FoodStore/Home/picture/creadit-card-01.png"
									alt="creadit card" />
							</a></li>
							<li><a href="#"> <img
									src="/FoodStore/Home/picture/creadit-card-02.png"
									alt="creadit card" />
							</a></li>
							<li><a href="#"> <img
									src="/FoodStore/Home/picture/creadit-card-03.png"
									alt="creadit card" />
							</a></li>
							<li><a href="#"> <img
									src="/FoodStore/Home/picture/creadit-card-04.png"
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
										<img class="img-responsive"
											src="/FoodStore/Home/picture/01.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/02.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/03.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/04.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/05.jpg" alt="product thumbnail" />
									</div>
								</div>
								<div class="thumbnail-carousel-product-quickview">
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/01.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/02.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/03.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/04.jpg" alt="product thumbnail" />
									</div>
									<div class="item">
										<img class="img-responsive"
											src="/FoodStore/Home/picture/05.jpg" alt="product thumbnail" />
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
	<script src="/FoodStore/Admin/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="/FoodStore/Admin/static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="/FoodStore/Home/js/jquery.min.js"></script>
	<script src="/FoodStore/Home/js/bootstrap.min.js"></script>
	<script src="/FoodStore/Home/js/function-check-viewport.js"></script>
	<script src="/FoodStore/Home/js/slick.min.js"></script>
	<script src="/FoodStore/Home/js/select2.full.min.js"></script>
	<script src="/FoodStore/Home/js/imagesloaded.pkgd.min.js"></script>
	<script src="/FoodStore/Home/js/jquery.mmenu.all.min.js"></script>
	<script src="/FoodStore/Home/js/rellax.min.js"></script>
	<script src="/FoodStore/Home/js/isotope.pkgd.min.js"></script>
	<script src="/FoodStore/Home/js/bootstrap-notify.min.js"></script>
	<script src="/FoodStore/Home/js/bootstrap-slider.js"></script>
	<script src="/FoodStore/Home/js/in-view.min.js"></script>
	<script src="/FoodStore/Home/js/countup.js"></script>
	<script src="/FoodStore/Home/js/animsition.min.js"></script>
	<script src="/FoodStore/Home/js/global.js"></script>
	<script src="/FoodStore/Home/js/config-mm-menu.js"></script>
	<script src="/FoodStore/Home/js/config-carousel-product-quickview.js"></script>
	<!-- Demo Only-->
	<script src="/FoodStore/Home/js/demo-add-to-cart.js"></script>
	<script type="text/javascript">
		var xhr = false;
		function createXHR() {
			try {
				xhr = new XMLHttpRequest();
			} catch (e) {
				try {
					xhr = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e1) {
					xhr = false;
				}
			}
			if (!xhr)
				alert("初始化XMLHttpRequest对象失败！");
		}
		function ajax(name, price, id) {
			var name = name;
			var price = price;
			var id = id;
			createXHR();
			var url = "/FoodStore/ProductlistServlet?type=addsessionlist&name="
					+ name + "&price=" + price + "&id=" + id + "&num=1";
			xhr.open("GET", url, true);
			xhr.send(null);

		}
	</script>
</body>
</html>
