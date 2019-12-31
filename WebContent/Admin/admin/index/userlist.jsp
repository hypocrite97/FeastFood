<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
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
<title>前台用户管理</title>
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/css/admin.css" />
</head>

<body>
	<jsp:useBean id="pagination"
		class="team.dlrow.foodstore.pojo.UserPageBean" scope="request"></jsp:useBean>
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
					</div>
					<div class="layui-inline">
						<input type="text" name="title" placeholder="请输入标题"
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-inline">
						<select name="states" lay-filter="status">
							<option value="">请选择一个状态</option>
							<option value="010">正常</option>
							<option value="021">停止</option>
							<option value="0571">删除</option>
						</select>
					</div>
					<button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
				</div>
			</div>
			<div class="layui-form" id="table-list">
				<table class="layui-table" lay-even lay-skin="nob">
					<colgroup>
						<col width="50">
						<col class="hidden-xs" width="50">
						<col class="hidden-xs" width="100">
						<col>
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
							<th>用户名称</th>
							<th class="hidden-xs">用户Email</th>
							<th class="hidden-xs">注册时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagination.pageData}" var="user">
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary"
									data-id="1"></td>
								<td class="hidden-xs">${user.id}</td>
								<td class="hidden-xs"><input type="text" name="title"
									autocomplete="off" class="layui-input" value="0" data-id="1"></td>
								<td>${user.name}</td>
								<td class="hidden-xs">${user.email}</td>
								<td class="hidden-xs">${user.timestamp}</td>
								<td><button
										class="layui-btn layui-btn-mini layui-btn-normal table-list-status"
										data-status='1'>正常</button></td>
								<td>
									<div class="layui-inline">
										<a href="#"><button
												class="layui-btn layui-btn-small layui-btn-normal">
												<i class="layui-icon">&#xe642;</i>
											</button></a> <a
											href="<%=request.getContextPath() %>/UserServlet?type=deleteuser&id=${user.id}"><button
												class="layui-btn layui-btn-small layui-btn-danger">
												<i class="layui-icon">&#xe640;</i>
											</button></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page-wrap">
					<ul class="pagination">
						<li style="width: 56px;"><a
							href="<%=request.getContextPath()%>/UserServlet?pageNo=1&type=pageList">首页</a></li>

						<c:if test="${pagination.hasPreviousPage}">
							<li><a
								href="<%= request.getContextPath() %>/UserServlet?pageNo=${pagination.pageNo-1}&type=pageList">«</a></li>
						</c:if>
						<c:forEach var="s" begin="1" end="${pagination.totalPages}">
							<li><a
								href="<%= request.getContextPath() %>/UserServlet?pageNo=${s}&type=pageList">${s}</a></li>
						</c:forEach>
						<c:if test="${pagination.hasNextPage}">
							<li><a
								href="<%= request.getContextPath() %>/UserServlet?pageNo=${pagination.pageNo+1}&type=pageList">»</a>
							</li>
						</c:if>
						<li style="width: 56px;"><a
							href="<%= request.getContextPath() %>/UserServlet?pageNo=${pagination.totalPages}&type=pageList">尾页</a>
						</li>
					</ul>
					<ul>
						<li style="width: 100%;">当前是第${pagination.pageNo}页，
							共${pagination.totalPages}页</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=stylepath%>static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=stylepath%>static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
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