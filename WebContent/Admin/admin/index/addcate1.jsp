<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	String stylepath = request.getContextPath() + "/Admin/";
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>网站后台管理模版</title>
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/css/admin.css" />
</head>
<body>
	<form class="layui-form column-content-detail"
		action="<%=basePath%>CateServlet?type=addcate1" method="post">
		<input type="hidden" value="addcate1" name="type" />
		<div class="layui-tab">
			<ul class="layui-tab-title">
				<li class="layui-this">添加一级分类</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<div class="layui-form-item">
						<label class="layui-form-label">分类名称：</label>
						<div class="layui-input-block">
							<input type="text" name="cate1" required lay-verify="required"
								placeholder="请输入一级分类名称" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item" style="padding-left: 10px;">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-normal" type="submit"
					onclick="close1()">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script src="<%=stylepath%>static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=stylepath%>static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		function close1() {
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index);
		}
	</script>
</body>
</html>