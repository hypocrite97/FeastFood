<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
String stylepath = request.getContextPath()+"/Admin/";
%> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>修改</title>
		<link rel="stylesheet" type="text/css" href="<%=stylepath %>static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="<%=stylepath %>static/admin/css/admin.css" />
	</head>

	<body>
		<div class="page-content-wrap clearfix">
				<form class="layui-form" action="<%=basePath %>CateServlet?type=updatecate1&id=${requestScope.cate.cate_id}" method="post">
					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this">一级分类修改</li>
						</ul>
						<div class="layui-tab-content">
							<div class="layui-tab-item"></div>
							<div class="layui-tab-item layui-show">
								<div class="layui-form-item">
									<label class="layui-form-label">分类名称：</label>
									<div class="layui-input-block">
										<input type="text" name="cate_name" placeholder="请输入分类名称" autocomplete="off" class="layui-input" value="${requestScope.cate.cate_name}">
									</div>
								</div>
							</div>
							<div class="layui-tab-item">
								
							</div>
						</div>
					</div>
					<div class="layui-form-item" style="padding-left: 10px;">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" type="submit">立即提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
		</div>
		<script src="<%=stylepath %>static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=stylepath %>static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>