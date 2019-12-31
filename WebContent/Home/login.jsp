<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/FoodStore/Home/404.jsp"%>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/Home/";
String stylepath = request.getContextPath() + "/Home/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login - FoodStore</title>
<link href="<%=stylepath %>css/647be82565184316a7ba9bc638b40a97.css" rel="stylesheet" />
<link href="<%=stylepath %>css/1025b57c3b8b4b63a93efd3b6bed0d58.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=stylepath %>css/main.css" />
<meta content="食品,超市,零食,饮品,水果" name="keywords">
<meta content="品质为上" name="description">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript">
	function validate() {
		var email = document.getElementById("email");
		var password = document.getElementById("password");
		if (email.value == "") {
			alert("邮箱不能为空！");
			email.focus();
			return false;
		}
		if (password.value == "") {
			alert("密码不能为空！");
			password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body class="animsition">
	<%
		String UserEmail = "";
		String UserPwd = "";
		// 从客户端读取Cookie
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("COOKIE_USEREMAIL".equals(cookie.getName())) {
					//applicantEmail = cookie.getValue();
					// 解密获取存储在Cookie中的求职者Email
					UserEmail = team.dlrow.foodstore.util.CookieEncryptTool.decodeBase64(cookie.getValue());
				}
				if ("COOKIE_USERPWD".equals(cookie.getName())) {
					//applicantPwd = cookie.getValue();
					// 解密获取存储在Cookie中的求职者登录密码
					UserPwd = team.dlrow.foodstore.util.CookieEncryptTool.decodeBase64(cookie.getValue());
				}
			}
		}
	%>

	<div class="login" id="page">
		<header class="header-style-1 static">
        <div class="container">
          <div class="row">
            <div class="header-1-inner">
              <a class="brand-logo animsition-link" href="<%=basePath %>index.jsp">
                <img class="img-responsive" src="<%=stylepath %>picture/logo.png" alt="" />
              </a>
              <nav>
                <ul class="menu hidden-xs">
                  <li>
                    <a href="<%=basePath %>index.jsp">Home</a>
                  </li>
                  <li>
                    <a href="<%=basePath %>shop.jsp">Shop</a>
                    <ul>
                      <li>
                        <a href="<%=basePath %>shop.jsp">Shop List</a>
                      </li>
                      <li>
                        <a href="<%=basePath %>shop-cart.jsp">Shop Cart</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a href="<%=basePath %>about.jsp">About</a>
                  </li>
                  <li>
                    <a href="<%=basePath %>contact.jsp">Contact</a>
                  </li>
                </ul>
              </nav>
              <aside class="right">
              <%
								if (session.getAttribute("SESSION_USER") == null) {
							%>
							<a href="<%=basePath %>login.jsp">登录</a> <a
								href="<%=basePath %>register.jsp">注册</a>
							<%
								} else {
							%>
							<a href="">${sessionScope.SESSION_USER.email}</a>&nbsp;&nbsp; <a
								href="/FoodStore/UserLogoutServlet">退出</a>
							<%
								}
							%>
                <div class="widget widget-control-header widget-search-header">
                  <a class="control btn-open-search-form js-open-search-form-header" href="#">
                    <span class="lnr lnr-magnifier"></span>
                  </a>
                  <div class="form-outer">
                    <button class="btn-close-form-search-header js-close-search-form-header">
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
                <div class="widget widget-control-header widget-shop-cart js-widget-shop-cart">
                  <a class="control" href="shop-cart.jsp">
                    <p class="counter">0</p>
                    <span class="lnr lnr-cart"></span>
                  </a>
                </div>
                <div class="widget widget-control-header hidden-lg hidden-md hidden-sm">
                  <a class="navbar-toggle js-offcanvas-has-events" type="button" href="#menu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </a>
                </div>
              </aside>
            </div>
          </div>
        </div>
      </header>

		<section class="sub-header shop-layout-1">
			<img class="rellax bg-overlay" src="<%=stylepath %>picture/011.jpg" alt="">
			<div class="overlay-call-to-action"></div>
			<h3 class="heading-style-3">My Account</h3>
		</section>
		<section class="boxed-sm">
			<div class="container">
				<div class="login-wrapper">
					<div class="row">
						<h3>Log In</h3>
						<form action="/FoodStore/UserLoginServlet" method="post"
							onsubmit="return validate();">
							<input type="hidden" name="requestPath"
								value="${requestScope.requestPath }">
							<div class="form-group organic-form-2">
								<label>Your Email *</label> <input class="form-control"
									type="text" name="email" id="email" value="<%=UserEmail%>">
							</div>
							<div class="form-group organic-form-2">
								<label>Password *</label> <input class="form-control"
									type="password" name="password" id="password"
									value="<%=UserPwd%>">
							</div>
							<div class="form-group remember-me">
								<div class="checkbox pull-left">
									<input checked="checked" name="rememberMe" id="rememberMe"
										class="checkbox" type="checkbox" value="true"> <label
										for="RememberPassword">Remember me</label>
								</div>
								<a class="pull-right" href="#">Lost your password?</a>
							</div>
							<div class="form-group footer-form">
								<input name="submit" type="submit" class="btn btn-brand pill"
									value="SUBMIT" />
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
						<a href="#"> <img class="logo-footer" src="<%=stylepath %>picture/logo.png"
							alt="Logo Organic" />
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
						<p>Copyright © 2018 Designed by dlrow. All rights reserved.</p>
						<div class="widget widget-footer widget-footer-creadit-card">
							<ul class="list-unstyle">
								<li><a href="#"> <img src="<%=stylepath %>picture/creadit-card-01.png"
										alt="creadit card" />
								</a></li>
								<li><a href="#"> <img src="<%=stylepath %>picture/creadit-card-02.png"
										alt="creadit card" />
								</a></li>
								<li><a href="#"> <img src="<%=stylepath %>picture/creadit-card-03.png"
										alt="creadit card" />
								</a></li>
								<li><a href="#"> <img src="<%=stylepath %>picture/creadit-card-04.png"
										alt="creadit card" />
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script src="<%=stylepath %>js/jquery.min.js"></script>
	<script src="<%=stylepath %>js/bootstrap.min.js"></script>
	<script src="<%=stylepath %>js/function-check-viewport.js"></script>
	<script src="<%=stylepath %>js/slick.min.js"></script>
	<script src="<%=stylepath %>js/select2.full.min.js"></script>
	<script src="<%=stylepath %>js/imagesloaded.pkgd.min.js"></script>
	<script src="<%=stylepath %>js/jquery.mmenu.all.min.js"></script>
	<script src="<%=stylepath %>js/rellax.min.js"></script>
	<script src="<%=stylepath %>js/isotope.pkgd.min.js"></script>
	<script src="<%=stylepath %>js/bootstrap-notify.min.js"></script>
	<script src="<%=stylepath %>js/bootstrap-slider.js"></script>
	<script src="<%=stylepath %>js/in-view.min.js"></script>
	<script src="<%=stylepath %>js/countup.js"></script>
	<script src="<%=stylepath %>js/animsition.min.js"></script>
	<script src="<%=stylepath %>js/global.js"></script>
	<script src="<%=stylepath %>js/config-mm-menu.js"></script>
	<script src="<%=stylepath %>js/config-set-bg-blog-thumb.js"></script>
	<script src="<%=stylepath %>js/config-accrodion.js"></script>


</body>
</html>