<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/FoodStore/Home/404.jsp"%>
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
<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=3.0&ak=4q4WRushAshoMzMTTVPG8nxni9hya58O"></script>
<body class="animsition">
	<div class="contact" id="page">
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
								<li><a href="<%=basePath%>shop.jsp">Shop</a>
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
		<section class="sub-header shop-layout-1">
			<img class="rellax bg-overlay" src="<%=stylepath%>picture/09.jpg"
				alt="">
			<div class="overlay-call-to-action"></div>
			<h3 class="heading-style-3">Blog Detail</h3>
		</section>
		<section class="boxed-sm">
			<div class="container">
				<div class="row">
					<div class="row icon-box-contact-wrapper">
						<div class="row main">
							<div class="col-md-4">
								<div class="icon-box">
									<i class="fa fa-map-marker"></i>
									<p>12/2th Quincy St, NYC 12018</p>
								</div>
							</div>
							<div class="col-md-4">
								<a class="icon-box" href="tel:0123456789 "> <i
									class="fa fa-mobile"></i>(+1) 11 321 4567
								</a>
							</div>
							<div class="col-md-4">
								<a class="icon-box" href="tel:0123456789 "> <i
									class="fa fa-envelope-o"></i>contact@site.com
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div style="width:100%;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
				</div>
			</div>
			<div class="container" style="margin-top:50px;">
				<div class="row form-contact">
					<div class="row main">
						<form>
							<div class="col-md-12">
								<div class="form-group organic-form xs-radius">
									<textarea class="form-control" placeholder="Your Message"
										rows="6"></textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group organic-form xs-radius">
									<input class="form-control" placeholder="Your Name">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group organic-form xs-radius">
									<input class="form-control" placeholder="Your Email"
										type="email">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group organic-form xs-radius">
									<input class="form-control" placeholder="Phone Number">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group organic-form xs-radius">
									<button class="btn btn-brand pill">SEND EMAIL</button>
								</div>
							</div>
						</form>
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
	<script src="<%=stylepath%>js/config-set-bg-blog-thumb.js"></script>
	<script src="<%=stylepath%>js/0aee2109a6234e989c7511d5932dc2ac.js"></script>
	<script src="<%=stylepath%>js/config-google-map.js"></script>
	<!--Ajax实现单体登录-->
	<script src="<%=stylepath%>js/Single_sign_on.js"></script>
	<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(116.395645,39.929986);//定义一个中心点坐标
        map.centerAndZoom(point,12);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    
    initMap();//创建和初始化地图
</script>
</body>
</html>
