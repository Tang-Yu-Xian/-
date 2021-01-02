<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>注册</title>
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" href="css/register.css">
		<!--导入jquery-->
		<script src="js/jquery-3.3.1.js"></script>
		<script>
			function validate() {
				var email =document.getElementById("email").value;
				var password=document.getElementById("password").value;

				//验证邮箱合法性
				var pattern =/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/ ;
				if(email==''){
					alert("email不能为空！");
					return false;
				}else if (!pattern.test(email)){
					alert("email格式不正确！");
					return false;
				}

				//验证password

				if(password==''){
					alert("password不能为空！");
					return false;
				}else if (password.length<6||password.length>12){
					alert("密码长度在6-12字符之间！");
					return false;
				}

				return true;
			}
		</script>
    </head>
	<body>
	<!--引入头部-->
<!--	<div id="header"></div>-->
        <!-- 头部 end -->
    	<div class="rg_layout">
    		<div class="rg_form clearfix">
    			<div class="rg_form_left">
    				<p>新用户注册</p>
    				<p>USER REGISTER</p>
    			</div>
    			<div class="rg_form_center">
					
					<!--注册表单-->
    				<form id="registerForm" action="/travel/userRegisterServlet" onsubmit="return validate()">
						<!--提交处理请求的标识符-->
						<input type="hidden" name="action" value="register">
    					<table style="margin-top: 25px;">
    						<tr style="position: relative">
								<td class="td_left">
									<label for="email">Email</label>
								</td>
								<td class="td_right">
									<input type="text" id="email" name="email" placeholder="请输入Email"  onblur="validateEmail()">
								</td>
								<span id="info" style="color: red;position: absolute;left:822px;margin-top: 15px"></span>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="password">密码</label>
    							</td>
    							<td class="td_right">
    								<input type="text" id="password" name="password" placeholder="请输入密码">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="name">姓名</label>
    							</td>
    							<td class="td_right">
    								<input type="text" id="name" name="name" placeholder="请输入真实姓名">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="telephone">手机号</label>
    							</td>
    							<td class="td_right">
    								<input onblur="validatePhone(this.value)" type="text" id="telephone" name="telephone" placeholder="请输入您的手机号">
    							</td>
								<td>
									<span id="phoneSpan"></span>
								</td>

							</tr>
    						<tr>
    							<td class="td_left">
    								<label for="sex">性别</label>
    							</td>
    							<td class="td_right gender">
    								<input type="radio" id="sex" name="sex" value="男" checked> 男
    								<input type="radio" name="sex" value="女"> 女
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="birthday">出生日期</label>
    							</td>
    							<td class="td_right">
    								<input type="date" id="birthday" name="birthday" placeholder="年/月/日">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="check">验证码</label>
    							</td>
    							<td class="td_right check">
    								<input type="text" id="check" name="check" class="check">
    								<input onclick="sendMessage()" type="button" value="获取手机验证码" class="submit" id="phoneBtn" style="cursor:pointer;">

    							</td>
    						</tr>
    						<tr>
    							<td class="td_left"> 
    							</td>
    							<td class="td_right check"> 
    								<input type="submit" class="submit" value="注册" style="cursor:pointer;">
									<span id="msg" style="color: red;"></span>
    							</td>
    						</tr>
    					</table>
    				</form>
    			</div>
    			<div class="rg_form_right">
    				<p>
    					已有账号？
    					<a href="login.jsp">立即登录</a>
    				</p>
    			</div>
    		</div>
    	</div>
        <!--引入尾部-->
    	<div id="footer"></div>
		<!--导入布局js，共享header和footer-->
		<script type="text/javascript" src="js/include.js"></script>
	<script>
		function validateEmail() {
			//1、创建XMLHttpRequest对象
			var xhr=new XMLHttpRequest();

			//2、客户端连接服务器
			//GET 参数：
			var email=document.getElementById("email").value;
			var url='/travel/RegisterServlet?email='+email;
			xhr.open('GET',url,true);

			//3、发送请求 xhr.send()
			xhr.send(); //GET

			//4、设置回调函数
			xhr.onreadystatechange=function () {
				if (xhr.readyState==4&&xhr.status==200){
					//处理数据，实现局部刷新，js操做DOM
					//回去返回的数据
					var data=xhr.responseText;//返回的文本
					console.log(data);

					if(data=="true"){
						//验证邮箱合法性
						var pattern =/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/ ;
						if(email==''){
							//alert("email不能为空！");
							document.getElementById("info").innerHTML="不能为空";
						}else if (!pattern.test(email)){
							//alert("email格式不正确！");
							document.getElementById("info").innerHTML="格式不正确";
						}else{
							document.getElementById("info").innerHTML="合法邮箱";
						}
					}
					if (data=="false"){
						document.getElementById("info").innerHTML="邮箱已被注册";
					}
				}
			}

		}
	</script>
	<!--手机号码校验-->
<!--	<script>-->

<!--            function validatePhone(phone) {-->
<!--                var flag = false;//默认检验失败-->
<!--                //首先正则表达式校验手机号码格式-->
<!--                var regExp = new RegExp("^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$");-->
<!--                var res = regExp.test(phone);-->
<!--                if (res){-->
<!--                    // alert("haha")-->
<!--                    //如果格式正确，发送ajax请求检验数据库是否存在-->
<!--                    $.ajax({-->
<!--                        url:"userServlet?methodName=validatePhone",-->
<!--                        data:{"phone":phone},-->
<!--                        dataType:"json",-->
<!--                        async:false,//改成同步-->
<!--                        success:function (res) {-->
<!--                            //可能返回的结果-->
<!--                            //{isExist:yes/no}-->
<!--                            if (res.isExist=="yes"){-->
<!--                                //存在-->
<!--                                $("#phoneSpan").html("手机号码已被注册，请更换").css("color","red");-->
<!--                            }else if (res.isExist=="no"){-->
<!--                                //不存在-->
<!--                                $("#phoneSpan").html("√").css("color","green");-->
<!--                                flag = true;-->
<!--                            }-->
<!--                        }-->

<!--                    })-->
<!--                }else {-->
<!--                    //如果格式不正确，直接给出格式不对的展示效果。-->
<!--                    $("#phoneSpan").html("手机号码格式不正确").css("color","red");-->
<!--                }-->
<!--                return flag;-->
<!--            }-->


<!--            //获取手机验证码-->
<!--		function sendMessage() {-->
<!--			//1、首先校验手机号-->
<!--			var phone = $("#telephone").val();-->
<!--			var res = validatePhone(phone);-->
<!--			//2、如果验证成功才发ajax请求-->
<!--			if(res){-->
<!--                //设置按钮不能被点击-->
<!--                $("#phoneBtn").attr("disabled","disabled");-->
<!--			    //ajax请求发送短信-->
<!--				$.ajax({-->
<!--					url:"userServlet?methodName=sendMessage",-->
<!--					data:{"phone":phone},-->
<!--                    // async:false,//改成同步-->
<!--                    success:function (res) {-->
<!--						// alert("短信发送成功");-->

<!--						//设置按钮不能被点击-->
<!--						// $("#phoneBtn").attr("disabled","disabled");-->
<!--						//按钮30S倒计时-->
<!--						var time = 30;-->
<!--						var id = setInterval(function () {-->
<!--							if (time >= 1){-->
<!--							    time &#45;&#45; ;-->
<!--							    $("#phoneBtn").val(time+"s后从新发送")-->
<!--							}else {-->
<!--							    //倒计时结束 按钮可以再次被点击-->
<!--								clearInterval(id);-->
<!--								$("#phoneBtn").removeAttr("disabled").val("重新发送");-->
<!--							}-->
<!--                        },1000);-->
<!--					},-->
<!--					error:function (res) {-->
<!--						alert("发送失败");-->
<!--                        $("#phoneBtn").removeAttr("disabled");-->
<!--                    }-->
<!--					//如果不成功什么都不用做-->
<!--					-->
<!--				});-->
<!--			}-->

<!--        }-->



<!--			//给form表单绑定提交事件   注册实现-->
<!--			$("#registerForm").submit(function () {-->


<!--				//jQuery提供了表单对象的serialize（） 直接将form表单数据封装起来-->
<!--				var formData = $("#registerForm").serialize();-->
<!--				$.ajax({-->
<!--					url:"userServlet?methodName=register",-->
<!--					dataType:"json",-->
<!--					// settings:post,-->
<!--					data:formData,-->
<!--					success:function (res) {-->
<!--						/*-->
<!--							成功，注册失败，验证码错误-->
<!--							{message:success/fail/codeError}-->
<!--						 */-->
<!--						// alert("haha");-->
<!--						if(res.message=="success"){-->
<!--						    //注册成功-->
<!--							location.href="login.jsp";-->
<!--						}else if (res.message=="fail"){-->
<!--						    //注册失败，直接给出注册失败的提示-->
<!--							$("#msg").html("服务器异常，请稍后重试").css("color","red");-->
<!--						}else if (res.message=="codeError"){-->
<!--						    //验证码错误-->
<!--							$("#msg").html("验证码错误").css("color","red");-->
<!--						}-->
<!--                    }-->
<!--				});-->

<!--			    //注意：我们需要屏蔽from表单的提交-->
<!--				return false;//即屏蔽表单提交功能-->
<!--            })-->
<!--		//登录-->

<!--	</script>-->
    </body>
</html>