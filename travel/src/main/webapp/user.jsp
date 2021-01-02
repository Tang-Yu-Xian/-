<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="app.jsp"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" />
		<link rel="stylesheet" href="css/Site.css" />
		<link rel="stylesheet" href="css/zy.all.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/amazeui.min.css" />
		<link rel="stylesheet" href="css/admin.css" />
	</head>
	<body>
	<br>
	<form action="/travel/userPageServlet2" style="text-align: center">
		<div class="search">
			<input style="height: 39.33px;border-color: #0a318d" id="searchBtn" name="searchBtn" type="text" placeholder="请输入用户姓名" class="search_input">
			<input type="submit" style="display:inline-block;border-color: #0a318d;background-color: #0a318d;color: white" value="搜索">
		</div>
	</form>
		<div class="dvcontent">

			<div>
				<!--tab start-->
				<div class="tabs">
					<div class="hd">
						<ul>
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">查看用户</li>
						</ul>
					</div>
					<div class="bd">

						<ul style="display: block;padding: 20px;">
							<li>
								<!--分页显示角色信息 start-->
								<div id="dv1">
									<table class="table" id="tbRecord">
										<thead>
											<tr>
												<th>编号</th>
												<th>用户名 </th>
												<th>邮箱</th>
												<th>密码</th>
												<th>电话</th>
												<th>性别</th>
												<th>出生年月</th>
												<th>修改</th>
												<th>删除</th>
											</tr>
										</thead>
									<c:if test="${not empty requestScope.pageBean.list}">
										<c:forEach items="${requestScope.pageBean.list}" var="user">
											<tbody>
												<tr *bgcolor="#F8F8F8">
													<td>${user.id}</td>
													<td>${user.name}</td>
													<td>${user.email}</td>
													<td>${user.pwd}</td>
													<td>${user.telephone}</td>
													<td>${user.gender}</td>
													<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" ></fmt:formatDate></td>
													<td class='edit'><a href="userChange.jsp?userId=${user.id}"><button><i class='icon-edit bigger-120'></i>编辑</button></a></td>
													<td class='delete'><form action="/travel/userDeleteServlet?dId=${user.id}" method='post'><button><i class='icon-trash bigger-120'></i>删除</button></form></td>
												</tr>
											</tbody>
										</c:forEach>
									</c:if>
									</table>
								</div>
								<!--分页显示角色信息 end-->
							</li>
						</ul>
			</div>
				</div>
			</div>
		</div>

			<div align="center">
				<a href="javascript:beforePage('${pageBean.beforePage}')">上一页</a>
				共${pageBean.totalPages}页 共${pageBean.totalRows}行
				第${pageBean.currentPage}页
				每页${pageBean.pageSize}行
				<a href="javascript:afterPage('${pageBean.afterPage}')">下一页</a>
			</div>

			<script>
				function beforePage(page) {
					window.location="${pageContext.request.contextPath}/userPageServlet?currentPage="+page+"&pageSize=${pageSize}";
				}

				function afterPage(page) {
					window.location="${pageContext.request.contextPath}/userPageServlet?currentPage="+page+"&pageSize=${pageSize}";
				}
			</script>
			 <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
              <script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
              <script src="js/_layout.js"></script>
             <script src="js/plugs/jquery.SuperSlide.source.js"></script>
	</body>

</html>