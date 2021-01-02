<%@ page import="main.java.com.jsu.bean.admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/Site.css" />
		<link rel="stylesheet" href="css/zy.all.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/amazeui.min.css" />
		<link rel="stylesheet" href="css/admin.css" />
		<script>
			function validate() {
				var name =document.getElementById("user-name1").value;
				var name2=document.getElementById("user-name2").value;

				if(name2==''){
					alert("密码不能为空！");
					return false;
				}else if (name==name2){
					alert("新密码不能与旧密码一致！");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<div class="am-cf admin-main" style="padding-top: 0px;">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">

					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">

						</div>
			<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4" style="padding-top: 30px;">
				<form class="am-form am-form-horizontal"
					action="/travel/adminChange" method="post" onsubmit="return validate()">
					<input type="text" style="display: none" value="<%=((admin)session.getAttribute("ad")).getId()%>" id="yz" name="yz">
					<div class="am-form-group">
						<label for="user-name1" class="am-u-sm-3 am-form-label">
						原密码</label>
						<div class="am-u-sm-9">
							<input type="text" id="user-name1"
								placeholder="原密码" name="user-name1" disabled="disabled" value="<%=((admin)session.getAttribute("ad")).getAdpassword()%>">
								<small>原密码...</small>
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-name2" class="am-u-sm-3 am-form-label">
						新密码</label>
						<div class="am-u-sm-9">
							<input type="text" id="user-name2" required
								placeholder="新密码" name="user-name2">
								<small>新密码...</small>
						</div>
					</div>
					<div class="am-form-group">
						<div class="am-u-sm-9 am-u-sm-push-3">
							<input type="submit" class="am-btn am-btn-success" value="修改" />
						</div>
					</div>
				</form>
			</div>
		</div>
				</div>
			</div>
		</div>
	</body>
</html>
