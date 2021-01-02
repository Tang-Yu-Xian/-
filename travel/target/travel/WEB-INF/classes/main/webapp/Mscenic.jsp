<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
		<script>
		function validate() {
				var name =document.getElementById("name").value;
				var city=document.getElementById("city").value;
				var prie=document.getElementById("consumption").value;
				var inr=document.getElementById("characteristic").value;
				var im=document.getElementById("imgUrl").value;

				if(name==''){
					alert("景区名不能为空！");
					return false;
				}else if (city==''){
					alert("地点不能为空！");
					return false;
				}else if(prie==''){
					alert("价格不能为空！");
					return false;
				}else if(inr==''){
					alert("信息不能为空！");
					return false;
				}else if(im==''){
					alert("照片不能为空！");
					return false;
				}
				return true;
			}
		</script>
	</head>

	<body>
		<div class="dvcontent">

			<div>
				<!--tab start-->
				<div class="tabs">
					<div class="hd">
						<ul>
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">详细信息</li>
							 <li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">景点添加</li>
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
												<th>景点名称</th>
												<th>地点</th>
												<th>照片 </th>
												<th>描述</th>
												<th>价格</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody id="by">

										</tbody>
									
									</table>
								</div>
								<!--分页显示角色信息 end-->
							</li>
						</ul>
						<ul class="theme-popbod dform" style="display: none;">
					<div class="am-cf admin-main" style="padding-top: 0px;">
			<!-- content start -->
			
	<div class="am-cf admin-main" style="padding-top: 0px;">
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
						
					</div>
					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4" style="padding-top: 30px;">
						<form class="am-form am-form-horizontal"
							action="/travel/addServlet" method="post" enctype="multipart/form-data" onsubmit="return validate()">
							<div class="add_main center">
								<div class="username">景区名称：<input class="shurukuang" type="text" id="name" name="name" size="20" placeholder="限制15字" maxlength="15"></div>
								<div class="username">所在地：&nbsp;&nbsp;&nbsp;<input class="shurukuang" type="text" id="city" name="city" size="20" placeholder="限制10字" maxlength="10"></div>
								<div class="username">价格：元&nbsp;&nbsp;&nbsp;<input class="shurukuang" type="text" id="consumption" name="consumption" size="20" oninput = "value=value.replace(/[^\d]/g,'')" maxlength="4" placeholder="旅行消费"></div>
								<div class="username">景区介绍：<textarea class="" id="characteristic" name="characteristic" placeholder="请简单介绍该景区的特色"></textarea></div>
								<div class="username">风景图：<input class="image" type="file" id="imgUrl" name="imgUrl" onchange="preview(this)"><span id="preview"><img class="updateImg" style="display: none;" id="imgHidden"/></span></div>
								<br>
								<div class="login_submit"><input class="submit" type="submit" name="submit" value="保存"/></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- content end -->
	</div>
					<!--添加 end-->
			</div>
					<!--end-->
				</ul>
			</div>
		</div>
	</div>
		<!--tab end-->
	</div>
</div>


			<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
			<script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
			<script src="js/_layout.js"></script>
			<script src="js/plugs/jquery.SuperSlide.source.js"></script>

			<script>
				$(function() {
					$.ajax({
						url : "/travel/scenicServlet",
						type : "post",
						dataType : "json",
						success : function(data) {
							// $(".col-md-4").empty();
							$.each(data, function(i) {
								// $("#t"+i).empty();
								var trString = "";
								trString =
									"<tr id=t"+i+">"
									+"<td>"+data[i].id+"</td>"
									+"<td>"+data[i].scenic_name+"</td>"
									+"<td>"+data[i].place+"</td>"
									+"<td>"+"<img src="+"images/"+data[i].photo+" "+"width="+"200px"+" "+"height="+"100px"+">"+"</td>"
									+"<td>"+data[i].show+"</td>"
									+"<td>"+data[i].price+"</td>"
									+"<td class='edit'>"+"<a href=change.jsp?nameId="+data[i].id+">"+"<button><i class='icon-edit bigger-120'></i>编辑</button></a></td>"
								    +"<td class='delete'>"+"<form action=/travel/deleteServlet?dId="+data[i].id+" "+"method='post'>"+"<button>"+"<i class='icon-trash bigger-120'></i>删除</button></form></td>"
								    +"</tr>"

								$("#by").append(trString);
							});
						}
					});
				});

				//图片回显:
				function preview(file) {
					$("#imgHidden").css("display", "none");
					var prevDiv = document.getElementById('preview');
					if (file.files && file.files[0]) {
						var reader = new FileReader();
						reader.onload = function(evt) {
							prevDiv.innerHTML = '<img width="440px" height="147px" class="updateImg" src="' + evt.target.result + '" />';
						}
						reader.readAsDataURL(file.files[0]);
					} else {
						prevDiv.innerHTML = '<div class="img" style="width: 100px;height:100px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' +
								file.value + '\'"></div>';
					}
				}

				var num = 1;
				$(function() {

					$(".tabs").slide({ trigger: "click" });

				});

			</script>

		</div>
	</body>

</html>