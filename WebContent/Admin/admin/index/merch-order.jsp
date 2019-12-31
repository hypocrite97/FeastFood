<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.getAttribute("MerchOrderList");
	String stylepath = request.getContextPath() + "/Admin/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="iframe-h">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>后台商品订单</title>
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/css/admin.css" />
</head>

<body>
	<div class="wrap-container clearfix">
		<div class="column-content-detail">
			<div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline tool-btn">
						<input id="handle_status" value="" hidden="hidden">
						<button
							class="layui-btn layui-btn-small layui-btn-normal addcate1">
							<i class="layui-icon">&#xe654;</i>
						</button>
						<button class="layui-btn layui-btn-small layui-btn-danger delBtn"
							data-url="article-add.html">
							<i class="layui-icon">&#xe640;</i>
						</button>
						<button
							class="layui-btn layui-btn-small layui-btn-warm listOrderBtn hidden-xs"
							data-url="article-add.html">
							<i class="iconfont">&#xe656;</i>
						</button>
						<form action="/FoodStore/MerchOrderServlet" method="get">
					</div>
					<div class="layui-inline">
						<c:choose>
							<c:when test="">
								<input autofocus="autofocus" placeholder="订单编号" name=""
									type="text" maxlength="2" class="layui-input" />
							</c:when>
							<c:otherwise>
								<input value="" placeholder="订单编号" name="" type="text"
									maxlength="2" class="layui-input" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="layui-inline">
						<c:choose>
							<c:when test="">
								<input placeholder="订单名称" name="" type="text" maxlength="30"
									class="layui-input" />
							</c:when>
							<c:otherwise>
								<input value="" placeholder="订单名称" id="" name="" type="text"
									maxlength="30" class="layui-input" />
							</c:otherwise>
						</c:choose>
					</div>
					<button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
					</form>
				</div>
			</div>
			<div class="layui-form" id="table-list">
				<table class="layui-table" lay-even lay-skin="nob">
					<colgroup>
						<col width="50">
						<col class="hidden-xs" width="50">
						<col class="hidden-xs" width="70">
						<col class="hidden-xs" width="300">
						<col class="hidden-xs" width="120">
						<col class="hidden-xs" width="150">
						<col class="hidden-xs" width="150">
						<col width="80">
						<col width="150">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="" lay-skin="primary"
								lay-filter="allChoose"></th>
							<th class="hidden-xs">ID</th>
							<th class="hidden-xs">排序</th>
							<th>订单商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量&nbsp;&nbsp;&nbsp;&nbsp;总金额</th>
							<th class="hidden-xs">订单总金额</th>
							<th class="hidden-xs">创建时间</th>
							<th class="hidden-xs">用户信息</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${MerchOrderList}" varStatus="number">
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary"
									data-id="1"></td>
								<td class="hidden-xs">${m.id}</td>
								<td class="hidden-xs"><input type="text" name="title"
									autocomplete="off" class="layui-input" value="0" data-id="1"></td>
								<td>${m.placeorder_str}</td>
								<td class="hidden-xs">${m.total}</td>
								<td class="hidden-xs">${m.ordertime}</td>
								<td class="hidden-xs">${m.userEmail}</td>
								<td><button
										class="layui-btn layui-btn-mini layui-btn-normal table-list-status"
										data-status='1'>正常</button></td>
								<td>
									<div class="layui-inline">
										<a href="/FoodStore/MerchOrderServlet?action=del&id=${m.id}"
											class="tablelink">
											<button class="layui-btn layui-btn-small layui-btn-danger">
												<i class="layui-icon">&#xe640;</i>
											</button>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="<%=stylepath%>static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=stylepath%>static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		function addcate() {
			layer.open({
				title : '添加分类',
				type : 2,
				area : [ '700px', '530px' ],
				fix : false, //不固定
				maxmin : true,
				content : '/FoodStore/Admin/admin/index/addcate1.jsp',
				success : function(layero, index) {
				},
				end : function() {
					history.go(0);
				}
			});
		}
	</script>
	<script>
		layui.use([ 'form', 'jquery', 'layer', 'dialog' ], function() {
			var $ = layui.jquery;
			//修改状态
			$('#table-list').on(
					'click',
					'.table-list-status',
					function() {
						var That = $(this);
						var status = That.attr('data-status');
						var id = That.parent().attr('data-id');
						if (status == 1) {
							That.removeClass('layui-btn-normal').addClass(
									'layui-btn-warm').html('异常').attr(
									'data-status', 2);
						} else if (status == 2) {
							That.removeClass('layui-btn-warm').addClass(
									'layui-btn-normal').html('正常').attr(
									'data-status', 1);
						}
					})
		});
	</script>
</body>
</html>