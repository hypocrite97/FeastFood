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
	String stylepath = request.getContextPath() + "/Admin/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品</title>
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
	height: 330px;
}

.tipinfo {
	height: 180px;
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

        });
        $(document).ready(function () {
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
                xmlHttp.open("GET", "<%=basePath%>SelectServlet?action=CommodityClassThree&bigclass=" + selectvalue);
                xmlHttp.send(null);
            }
        }
        function callback() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var target = document.getElementById("subclass");
                    var CommodityClassTwoList = JSON.parse(xmlHttp.responseText);
                    while (target.options.length > 1) {
                        target.options.remove(1);
                    }
                    for (var i in CommodityClassTwoList) {
                        var oOption = document.createElement("OPTION");
                        oOption.value = CommodityClassTwoList[i].commodityClassTwoId;
                        oOption.text = CommodityClassTwoList[i].commodityClassTwoName;
                        target.add(oOption);
                    }
                }
            }
        }

        function update(i) {
            var CommodityClassThreeId = document.getElementsByClassName("CommodityClassThreeIds");
            createXMLHttpRequest();
            xmlHttp.onreadystatechange = updateback;
            xmlHttp.open("GET", "<%=basePath%>CommodityClassThreeServlet?action=upfind&CommodityClassThreeId=" + CommodityClassThreeId[(i - 1)].innerHTML);
            xmlHttp.send(null);
        }

        function updateback() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var CommodityClassThreeId = document.getElementById("CommodityClassThreeId2");
                    var CommodityClassThreeName = document.getElementById("CommodityClassThreeName2");
                    var CommodityClassThreePrice = document.getElementById("CommodityClassThreePrice2");
                    var cList = JSON.parse(xmlHttp.responseText);
                    for (var i in cList) {
                        CommodityClassThreeId.value = cList[i].commodityClassThreeId;
                        CommodityClassThreeName.value = cList[i].commodityClassThreeName;
                        CommodityClassThreePrice.value = cList[i].commodityClassThreePrice;
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
			<div class="layui-form-item">
				<div class="layui-inline tool-btn">
					<button
						class="layui-btn layui-btn-small layui-btn-normal addCommodityClassOne click">
						<i class="layui-icon">&#xe654;</i>
					</button>
					<button
						class="layui-btn layui-btn-small layui-btn-warm listOrderBtn hidden-xs"
						data-url="article-add.html">
						<i class="iconfont">&#xe656;</i>
					</button>
					<form action="<%=basePath%>CommodityClassThreeServlet" method="get">
				</div>
				<div class="layui-inline">
					<c:choose>
						<c:when test="${CommodityClassThreeId == null }">
							<input autofocus="autofocus" placeholder="商品ID"
								name="CommodityClassThreeId" type="text" maxlength="8"
								class="layui-input" />
						</c:when>
						<c:otherwise>
							<input value="${CommodityClassThreeId }" placeholder="商品ID"
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
					<c:choose>
						<c:when test="${CommodityClassThreePrice == null }">
							<input placeholder="商品价格" name="CommodityClassThreePrice"
								type="text" maxlength="8" class="layui-input" />
						</c:when>
						<c:otherwise>
							<input value="${CommodityClassThreePrice }" placeholder="商品价格"
								name="CommodityClassThreePrice" type="text" maxlength="8"
								class="layui-input" />
						</c:otherwise>
					</c:choose>
				</div>
				<div class="layui-inline">
					<select id="bigclass" onChange="selscts()" class="IdSelect dfinput"
						name="CommodityClassOneId">
						<option value="">所属一级分类</option>
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
				</div>
				<div class="layui-inline">
					<select id="subclass" class="IdSelect dfinput"
						name="CommodityClassTwoId">
						<option value="">所属二级分类</option>
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
			<!-- 列表标题 -->
			<div class="layui-form" id="table-list">
				<table class="layui-table" lay-even lay-skin="nob">
					<colgroup>
						<col width="50">
						<col class="hidden-xs" width="50">
						<col class="hidden-xs" width="100">
						<col class="hidden-xs" width="150">
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
							<th class="hidden-xs">所属一级</th>
							<th class="hidden-xs">所属二级</th>
							<th class="hidden-xs">商品名称</th>
							<th class="hidden-xs">商品价格</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							request.getAttribute("CommodityClassThreeList");
						%>
						<c:forEach var="cct" items="${CommodityClassThreeList}"
							varStatus="number">
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary"
									data-id="1"></td>
								<td class="hidden-xs CommodityClassThreeIds">${cct.commodityClassThreeId }</td>
								<td>${cct.commodityClassOneName }</td>
								<td>${cct.commodityClassTwoName }</td>
								<td>${cct.commodityClassThreeName }</td>
								<td>${cct.commodityClassThreePrice}</td>
								<td><button
										class="layui-btn layui-btn-mini layui-btn-normal table-list-status"
										data-status='1'>正常</button></td>
								<td>
									<div class="layui-inline">
										<a href="#" onclick="update(${cct.commodityClassThreeId});"
											class="click2 tablelink">
											<button class="layui-btn layui-btn-small layui-btn-normal">
												<i class="layui-icon">&#xe642;</i>
											</button>
										</a> <a
											href="<%=basePath%>CommodityClassThreeServlet?action=del&CommodityClassThreeId=${cct.commodityClassThreeId }"
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
	<div class="tip">
		<div class="tiptop">
			<span>添加商品</span><a></a>
		</div>
		<form action="<%=basePath%>CommodityClassThreeServlet" method="post">
			<div class="tipinfo">
				<input autofocus="autofocus" onblur="beginCheck()"
					placeholder="请输入商品代码" id="CommodityClassThreeId"
					name="CommodityClassThreeId" type="text" maxlength="8"
					class="dfinput" /><label id="check">&nbsp;</label> <br> <br>
				<input placeholder="请输入商品名称" id="CommodityClassThreeName"
					name="CommodityClassThreeName" type="text" maxlength="30"
					class="dfinput" /> <br> <br> <input
					placeholder="请输入商品价格" id="CommodityClassThreePrice"
					name="CommodityClassThreePrice" type="text" maxlength="30"
					class="dfinput" /> <br> <br> <select class="dfinput"
					name="CommodityClassTwoId" id="CommodityClassTwoId">
					<option value="">请选择所属二级</option>
					<c:forEach var="cct" items="${commodityClassTwo }">
						<option value="${cct.commodityClassTwoId }">${cct.commodityClassTwoName }</option>
					</c:forEach>
				</select>
			</div>
			<div class="tipbtn">
				<input type="hidden" name="action" value="add"><input
					name="" type="submit" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>
		</form>
	</div>
	<div class="tip2">
		<div class="tiptop">
			<span>修改商品</span><a></a>
		</div>
		<form action="<%=basePath%>CommodityClassThreeServlet" method="post">
			<div class="tipinfo">
				<input readonly="readonly" placeholder="请输入商品代码"
					id="CommodityClassThreeId2" name="CommodityClassThreeId"
					type="text" maxlength="8" class="dfinput" /> <br> <br> <input
					placeholder="请输入商品名称" id="CommodityClassThreeName2"
					name="CommodityClassThreeName" type="text" maxlength="30"
					class="dfinput" /> <br> <br> <input
					placeholder="请输入商品价格" id="CommodityClassThreePrice2"
					name="CommodityClassThreePrice" type="text" maxlength="8"
					class="dfinput" /> <br> <br> <select class="dfinput"
					name="CommodityClassTwoId" id="CommodityClassTwoId2">
					<option value="">请选择所属二级</option>
					<c:forEach var="CommodityClassTwo" items="${commodityClassTwo }">
						<option value="${CommodityClassTwo.commodityClassTwoId }">${CommodityClassTwo.commodityClassTwoName }</option>
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
				That.removeClass('layui-btn-normal').addClass('layui-btn-warm').html('缺货').attr('data-status', 2);
			} else if(status == 2) {
				That.removeClass('layui-btn-warm').addClass('layui-btn-normal').html('正常').attr('data-status', 1);

			}
		})

	});
</script>
</body>
</html>
