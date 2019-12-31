<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>后台用户修改密码</title>
<link rel="stylesheet" type="text/css"
	href="/FoodStore/Admin/static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="/FoodStore/Admin/static/admin/css/admin.css" />
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<ul class="layui-tab-title">
			<li class="layui-this">修改密码</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<form class="layui-form" style="width: 90%; padding-top: 20px;"
					action="/FoodStore/ChangeAdminPasswordServlet" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-block">
							<input type="text" disabled autocomplete="off"
								class="layui-input layui-disabled"
								value="${sessionScope.SESSION_ADMIN.admin}"> <input
								type="hidden" name="username"
								value="${sessionScope.SESSION_ADMIN.admin}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">旧密码：</label>
						<div class="layui-input-block">
							<input type="password" name="password1" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">新密码：</label>
						<div class="layui-input-block">
							<input type="password" id="password2" name="password2" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">重复密码：</label>
						<div class="layui-input-block">
							<input type="password" id="password3" name="password3" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" type="submit">立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/FoodStore/Admin/static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>