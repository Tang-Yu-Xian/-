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
    <script src="js/getParameter.js"></script>
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

            }
            return true;
        }
    </script>
</head>

<body>
<div class="dvcontent">

    <div>
        <!--tab start-->
            <div class="bd">
                    <div class="am-cf admin-main" style="padding-top: 0px;">
                        <!-- content start -->

                        <div class="am-cf admin-main" style="padding-top: 0px;">
                            <!-- content start -->
                            <div class="admin-content">
                                <div class="admin-content-body">

                                    <div class="am-g">
                                        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
                                           景点信息修改
                                        </div>
                                        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4" style="padding-top: 30px;">
                                            <form class="am-form am-form-horizontal"
                                                  action="/travel/updateServlet" method="post" enctype="multipart/form-data" onsubmit="return validate()">
                                                <div class="add_main center">
                                                    <input type = "text" id="Id" name="Id" style="display: none">
                                                    <div class="username">景区名称：<input class="shurukuang" type="text" id="name" name="name" size="20" placeholder="限制15字" maxlength="15"></div>
                                                    <div class="username">所在地：&nbsp;&nbsp;&nbsp;<input class="shurukuang" type="text" id="city" name="city" size="20" placeholder="限制10字" maxlength="10"></div>
                                                    <div class="username">价格：元&nbsp;&nbsp;&nbsp;<input class="shurukuang" type="text" id="consumption" name="consumption" size="20" oninput = "value=value.replace(/[^\d]/g,'')" maxlength="4" placeholder="旅行消费"></div>
                                                    <div class="username">景区介绍：<textarea class="" id="characteristic" name="characteristic" placeholder="请简单介绍该景区的特色"></textarea></div>
                                                    <div class="username">风景图：<input class="image" type="file" id="imgUrl" name="imgUrl" onchange="preview(this)"><span id="preview"><img class="updateImg" style="display: none;" width="400px" height="340px" id="imgHidden" src=""></span></div>
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
                        <!--end-->
            </div>
        </div>
        <!--tab end-->
    </div>

    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
    <script src="js/_layout.js"></script>
    <script src="js/plugs/jquery.SuperSlide.source.js"></script>
    <script>
        var rid = getParameter("nameId");
        // console.log(rid);
        //页面加载完成，ajax请求旅游路线的详情
        $.ajax({
            url:"/travel/detailServlet",
            data:{"rid":rid},
            dataType:"json",
            success:function (res) {

                $("#Id").val(res[0].id);

                $("#name").val(res[0].scenic_name);

                $("#city").val(res[0].place);

                $("#consumption").val(res[0].price);

                $("#characteristic").html(res[0].show);

                $("#imgHidden").attr("src","images/"+res[0].photo);
                $("#imgHidden").attr("style","display: block;");

            }
        })

        //图片回显:
        function preview(file) {
            $("#imgHidden").css("display", "none");
            var prevDiv = document.getElementById('preview');
            if (file.files && file.files[0]) {
                var reader = new FileReader();
                reader.onload = function(evt) {
                    prevDiv.innerHTML = '<img class="updateImg" src="' + evt.target.result + '" />';
                }
                reader.readAsDataURL(file.files[0]);
            } else {
                prevDiv.innerHTML = '<div class="img" style="width: 100px;height:100px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' +
                    file.value + '\'"></div>';
            }
        }
    </script>

</div>
</body>

</html>