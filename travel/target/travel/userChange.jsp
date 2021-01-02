<%@ page import="java.text.SimpleDateFormat" %>
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
            var email=document.getElementById("email").value;
            var pas=document.getElementById("pas").value;
            var pho=document.getElementById("pho").value;
            var bir=document.getElementById("bir").value;

            if(name==''){
                alert("用户名不能为空！");
                return false;
            }else if (email==''){
                alert("邮箱不能为空！");
                return false;
            }else if(pas==''){
                alert("密码不能为空！");
                return false;
            }else if(pho==''){
                alert("电话不能为空！");
                return false;
            }else if(bir==''){
                alert("出生日期不能为空！");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
    <div class="dvcontent">


        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
                用户信息修改
            </div>
            <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4" style="padding-top: 30px;">
                <form class="am-form am-form-horizontal"
                      action="/travel/userUpdateServlet" method="post" onsubmit="return validate()">
                    <div class="add_main center">
                        <input type = "text" id="Id" name="Id" style="display: none" value="">
                        <div class="username">姓名：<input class="shurukuang" type="text" id="name" name="name" size="20" placeholder="" maxlength="15" value=""></div>
                        <div class="username">邮箱：<input class="shurukuang" type="text" id="email" name="email" size="20" placeholder="" maxlength="25" value=""></div>
                        <div class="username">密码：<input class="shurukuang" type="text" id="pas" name="pas" size="20"  maxlength="16" placeholder="" value=""></div>
                        <div class="username">电话：<input class="shurukuang" type="text" id="pho" name="pho" placeholder="电话" value=""></div>
                        <div class="username">性别：<input class="shurukuang" type="radio" id="m" name="gen" value="男" checked>男
                                                    <input class="shurukuang" type="radio" id="f" name="gen" value="女">女
                        </div>
                        <div class="username">生日：<input class="shurukuang" type="date" id="bir" name="bir" value="" placeholder="年/月/日"></div>
                        <div class="login_submit"><input class="submit" type="submit" name="submit" value="保存"/></div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
    <script src="js/_layout.js"></script>
    <script src="js/plugs/jquery.SuperSlide.source.js"></script>
    <script>
        var rid = getParameter("userId");
        // console.log(rid);
        //页面加载完成，ajax请求旅游路线的详情
        $.ajax({
            url:"/travel/userLoadServlet",
            data:{"rid":rid},
            dataType:"json",
            success:function (res) {


                $("#Id").val(res[0].id);
                // console.log(res[0].id+"我")
                $("#name").val(res[0].name);

                $("#email").val(res[0].email);

                $("#pas").val(res[0].pwd);

                $("#pho").val(res[0].telephone);

                var test=new Date(res[0].birthday);
                var mm = ((test.getMonth()+1)<10)?"0"+(test.getMonth()+1):(test.getMonth()+1);
                var dd = (test.getDate()<10)?"0"+test.getDate():test.getDate();
                var date = test.getFullYear()+"-"+mm+"-"+dd;
                $("#bir").attr("value",date);
                $("#bir").val(date);

               if (res[0].gender=="男"){
                   $("#m").attr("checked","checked");
               }
                else if(res[0].gender=="女"){
                   $("#f").attr("checked","checked");
               }

            }
        })
    </script>

</div>
</body>

</html>
