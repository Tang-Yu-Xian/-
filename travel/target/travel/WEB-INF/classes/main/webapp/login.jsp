<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>豪哥旅游网-登录</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      <!--导入angularJS文件-->
    <!--<script src="js/angular.min.js"></script>-->
	<!--导入jquery-->
	<script src="js/jquery-3.3.1.js"></script>
</head>

<body>
<!--引入头部-->
<!--<div id="header"></div>-->
    <!-- 头部 end -->
    <section id="login_wrap">
        <div class="fullscreen-bg" style="background: url(images/login_bg.jpg);height: 532px;">
        	
        </div>
        <div class="login-box">
        	<div class="title">
        		<img src="images/login_logo.png" alt="">
        		<span>欢迎登录豪哥旅游账户</span>
        	</div>
        	<div class="login_inner">
				
				<!--登录错误提示消息-->
        		<div id="errorMsg" class="alert alert-danger" ></div>
				<form id="loginForm" action="/travel/userLoginServlet" method="post" accept-charset="utf-8">
        			<input type="hidden" name="action" value="login"/>
					<input name="email" type="text" placeholder="请输入邮箱" autocomplete="on">
        			<input name="password" type="text" placeholder="请输入密码" autocomplete="off">

					<div class="submit_btn">
        				<button type="submit" onclick="login()">登录</button>
        				<div class="auto_login">
        					<input type="checkbox" name="" class="checkbox">
        					<span>自动登录</span>
        				</div>        				
        			</div>        			       		
        		</form>
        		<div class="reg">没有账户？<a href="register.jsp">立即注册</a></div>
        	</div>
        </div>
    </section>
    <!--引入尾部-->
    <div id="footer"></div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>


<script>

	/*
		登录
	 */
	function login() {

		// var formData = $("#loginForm").serialize();
		// $.ajax({
		// 	url:"userServlet?methodName=login",
		// 	data:formData,
		// 	dataType:"json",
		// 	success:function (res) {
        //         /**
		// 		 * 成功，密码错误，手机号不存在
		// 		 * {message:success/passwordError/phoneError}
        //          */
        //         if (res.message=="success"){
        //             //登录成功，跳转到首页
		// 			location.href="index.jsp";
		// 		}else if (res.message=="passwordError"){
        //             //密码错误
		// 			$("#errorMsg").html("密码错误");
		// 		}else if (res.message=="phoneError"){
        //             //手机号未注册
		// 			$("#errorMsg").html("手机号未注册")
		// 		}
        //     }
		// });
    }




</script>
</body>

</html>