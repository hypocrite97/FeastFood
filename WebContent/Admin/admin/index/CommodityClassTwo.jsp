<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="team.dlrow.foodstore.pojo.*"
	import="team.dlrow.foodstore.dao.CommodityClassController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CommodityClassController control = new CommodityClassController();
	List<CommodityClassOne> commodityClassOne = control.findCommodityClassOne();
	request.setAttribute("commodityClassOne", commodityClassOne);
	request.getAttribute("commodityClassOneId");
	request.getAttribute("commodityClassOneList");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	String stylepath = request.getContextPath() + "/Admin/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品二级分类</title>
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=stylepath%>static/admin/css/admin.css" />
<link href="<%=stylepath%>admin/index/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=stylepath%>admin/index/js/jquery.js"></script>
<style type="text/css">
.tip, .tip2 {
	height: 300px;
}

.tipinfo {
	height: 130px;
}
</style>
<script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".click2").click(function () {
                $(".tip2").fadeIn(200);
            });
            $(".tiptop a").click(function () {
                $(".tip2").fadeOut(200);
            });
            $(".sure").click(function () {
                $(".tip2").fadeOut(100);
            });
            $(".cancel").click(function () {
                $(".tip2").fadeOut(100);
            });
        });

    </script>
<script type="text/javascript">
        //定义一个变量用于存放XMLHttpRequest对象
        var xmlHttp;

        //该函数用于创建一个XMLHttpRequest对象
        function createXMLHttpRequest() {
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            else if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }
        }

        //这是一个启动AJAX异步通信的方法
        function beginCheck() {
            var tempCommodityClassTwoId = document.getElementById("CommodityClassTwoId").value;
            if (tempCommodityClassTwoId == "") {
                //如果尚未输入注册名
                document.getElementById("check").innerHTML = "请输入";
                return;
            }
            //创建一个XMLHttpRequest对象
            createXMLHttpRequest();
            //将状态触发器绑定到一个函数
            xmlHttp.onreadystatechange = processor;
            //通过GET方法向指定的URL建立服务器的调用
            xmlHttp.open("GET", "<%=basePath%>CheckServlet?CommodityClassTwoId=" + tempCommodityClassTwoId);
            //发送请求
            xmlHttp.send(null);
        }

        //这是一用来处理状态改变的函数
        function processor() {
            //定义一个变量用于存放从服务器返回的响应结果
            var responseContext;
            if (xmlHttp.readyState == 4) {
                //如果响应完成
                if (xmlHttp.status == 200) {
                    //如果返回成功
                    //取出服务器的响应内容
                    responseContext = xmlHttp.responseText;
                    //如果注册名检查有效
                    if (responseContext.indexOf("true") != -1) {
                        document.getElementById("check").innerHTML = "正确";
                    } else {
                        document.getElementById("check").innerHTML = "代码已存在";
                    }
                }
            }
        }

        function update(i) {
            var CommodityClassTwoId = document.getElementsByClassName("CommodityClassTwoIds");
            createXMLHttpRequest();
            xmlHttp.onreadystatechange = updateback;
            xmlHttp.open("GET", "<%=basePath%>CommodityClassTwoServlet?action=upfind&CommodityClassTwoId=" + CommodityClassTwoId[(i - 1)].innerHTML);
            xmlHttp.send(null);
        }

        function updateback() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var CommodityClassTwoId = document.getElementById("CommodityClassTwoId2");
                    var CommodityClassTwoName = document.getElementById("CommodityClassTwoName2");
                   	//var CommodityClassOneId = document.getElementById("CommodityClassOneId2");
                    var oList = JSON.parse(xmlHttp.responseText);
                    for (var i in oList) {
                        CommodityClassTwoId.value = oList[i].commodityClassTwoId;
                        CommodityClassTwoName.value = oList[i].commodityClassTwoName;
                      	//CommodityClassOneId.value = oList[i].commodityClassOneId;
                    }
                }
            }
        }
    </script>

</head>
<body>
	<div class="wrap-container clearfix">
		<div class="column-content-detail">
			<!-- 增删除标栏 -->
			<div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline tool-btn">
						<button
							class="layui-btn layui-btn-small layui-btn-normal addCommodityClassOne click">
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
						<form action="<%=basePath%>CommodityClassTwoServlet" method="get">
					</div>
					<div class="layui-inline">
						<c:choose>
							<c:when test="${CommodityClassTwoId == null }">
								<input autofocus="autofocus" placeholder="二级分类编号"
									name="CommodityClassTwoId" type="text" maxlength="4"
									class="layui-input" />
							</c:when>
							<c:otherwise>
								<input value="${CommodityClassTwoId }" placeholder="二级分类编号"
									name="CommodityClassTwoId" type="text" maxlength="4"
									class="layui-input" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="layui-inline">
						<c:choose>
							<c:when test="${CommodityClassTwoName == null }">
								<input placeholder="二级分类名称" name="CommodityClassTwoName"
									type="text" maxlength="30" class="layui-input" />
							</c:when>
							<c:otherwise>
								<input value="${CommodityClassTwoName }" placeholder="二级分类名称"
									name="CommodityClassTwoName" type="text" maxlength="30"
									class="layui-input" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="layui-inline">
						<select class="layui-input" name="CommodityClassOneId">
							<option value="">所属一级分类</option>
							<c:forEach var="cco" items="${commodityClassOne }">
								<c:choose>
									<c:when
										test="${cco.commodityClassOneId.equals(CommodityClassOneId) }">
										<option value="${cco.commodityClassOneId }"
											selected="selected">${cco.commodityClassOneName }</option>
									</c:when>
									<c:otherwise>
										<option value="${cco.commodityClassOneId }">${cco.commodityClassOneName }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<input type="hidden" name="action" value="find"> <input
						type="submit" value="Screen" class="layui-btn layui-btn-normal" />
					</form>
				</div>
			</div>
			<!-- 列表标题 -->
			<div class="layui-form" id="table-list">
				<table class="layui-table" lay-even lay-skin="nob">
					<colgroup>
						<col width="50">
						<col class="hidden-xs" width="50">
						<col class="hidden-xs" width="70">
						<col class="hidden-xs" width="150">
						<col class="hidden-xs" width="150">
						<col width="80">
						<col width="100">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="" lay-skin="primary"
								lay-filter="allChoose"></th>
							<th class="hidden-xs">ID</th>
							<th class="hidden-xs">排序</th>
							<th class="hidden-xs">所属一级</th>
							<th class="hidden-xs">二级分类名称</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							request.getAttribute("CommodityClassTwoList");
						%>
						<c:forEach var="cct" items="${CommodityClassTwoList }"
							varStatus="number">
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary"
									data-id="1"></td>
								<td class="hidden-xs CommodityClassTwoIds">${cct.commodityClassTwoId }</td>
								<td class="hidden-xs"><input type="text" name="title"
									autocomplete="off" class="layui-input" value="0" data-id="1"></td>
								<td>${cct.commodityClassOneName }</td>
								<td>${cct.commodityClassTwoName }</td>
								<td><button
										class="layui-btn layui-btn-mini layui-btn-normal table-list-status"
										data-status='1'>正常</button></td>
								<td>
									<div class="layui-inline">
										<a href="#" onclick="update(${cct.commodityClassTwoId });"
											class="click2 tablelink">
											<button class="layui-btn layui-btn-small layui-btn-normal">
												<i class="layui-icon">&#xe642;</i>
											</button>
										</a> <a
											href="<%=basePath%>CommodityClassTwoServlet?action=del&CommodityClassTwoId=${cct.commodityClassTwoId }"
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
			<!-- 分页查找 -->

		</div>
	</div>
	<div class="tip">
		<div class="tiptop">
			<span>添加商品二级</span><a></a>
		</div>
		<form action="<%=basePath%>CommodityClassTwoServlet" method="post">
			<div class="tipinfo">
				<input autofocus="autofocus" onblur="beginCheck()"
					placeholder="请输入二级商品编号" id="CommodityClassTwoId"
					name="CommodityClassTwoId" type="text" maxlength="4"
					class="dfinput" /><label id="check">&nbsp;</label> <br> <br>
				<input placeholder="请输入二级商品名称" name="CommodityClassTwoName"
					type="text" maxlength="30" class="dfinput" /> <br> <br>
				<select class="dfinput" name="CommodityClassOneId" width="100">
					<option value="">请选择所属一级</option>
					<c:forEach var="cco" items="${commodityClassOne}">
						<option value="${cco.commodityClassOneId}">${cco.commodityClassOneName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="tipbtn">
				<input type="hidden" name="action" value="add"> <input
					name="" type="submit" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>
		</form>
	</div>
	<div class="tip2">
		<div class="tiptop">
			<span>修改商品二级</span><a></a>
		</div>
		<form action="<%=basePath%>CommodityClassTwoServlet" method="post">
			<div class="tipinfo">
				<input readonly="readonly" placeholder="请输入二级商品编号"
					id="CommodityClassTwoId2" name="CommodityClassTwoId" type="text"
					maxlength="4" class="dfinput" /> <label id="check">&nbsp;</label>
				<br> <br> <input placeholder="请输入二级商品名称"
					id="CommodityClassTwoName2" name="CommodityClassTwoName"
					type="text" maxlength="30" class="dfinput" /> <br> <br>
				<select class="dfinput" name="CommodityClassOneId"
					id="CommodityClassOneId2">
					<option value="">请选择所属一级</option>
					<c:forEach var="cco" items="${commodityClassOne }">
						<option value="${cco.commodityClassOneId }">${cco.commodityClassOneName }</option>
					</c:forEach>
					<br>
					<br>
				</select>
			</div>
			<div class="tipbtn">
				<input type="hidden" name="action" value="update"> <input
					name="" type="submit" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>
		</form>
	</div>

	<script src="<%=stylepath%>static/admin/layui/layui.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=stylepath%>static/admin/js/common.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
    layui.use(['form', 'jquery', 'layer', 'dialog'], function() {
		var $ = layui.jquery;

		//修改状态
		$('#table-list').on('click', '.table-list-status', function() {
			var That = $(this);
			var status = That.attr('data-status');
			var id = That.parent().attr('data-id');
			if(status == 1) {
				That.removeClass('layui-btn-normal').addClass('layui-btn-warm').html('异常').attr('data-status', 2);
			} else if(status == 2) {
				That.removeClass('layui-btn-warm').addClass('layui-btn-normal').html('正常').attr('data-status', 1);

			}
		})
	});
</script>
</body>
</html>
