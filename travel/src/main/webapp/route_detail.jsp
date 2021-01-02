<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>路线详情</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/route-detail.css">
    <script src="js/getParameter.js"></script>
</head>

<body>
<!--引入头部-->
<div id="header"></div>
    <!-- 详情 start -->   
    <div class="wrap">
        <div class="bread_box">
<%--            <a href="/">首页</a>--%>
<%--            <span> &gt;</span>--%>

<%--            <a id="cname" href="#"></a><span> &gt;</span>--%>
<%--            <a id="rname" href="#"></a>--%>
        </div>
        <div class="prosum_box">
            <dl class="prosum_left">
                <dt>
                    <img id="bigImg" alt="" class="big_img" src="">
                </dt>
            </dl>
            <div class="prosum_right">
               <p id="rname2" class="pros_title"></p>
                <p id="routeIntroduce" class="hot"></p>
                <div class="pros_other">
                    <p id="sname"></p>
                    <p id="consphone"></p>
                    <p id="address"></p>
                </div>
                <div class="pros_price">
                    <p class="price"><strong id="price"></strong><span>起</span></p>
                    <p class="collect">



                        <span id="count"></span>
                    </p>
                </div>        
            </div>
        </div>
        <div class="you_need_konw">
            <span>旅游须知</span>
            <div class="notice">
                <p>1、旅行社已投保旅行社责任险。建议游客购买旅游意外保险 <br>

                <p>2、旅游者参加打猎、潜水、海边游泳、漂流、滑水、滑雪、滑草、蹦极、跳伞、滑翔、乘热气球、骑马、赛车、攀岩、水疗、水上飞机等属于高风险性游乐项目的，敬请旅游者务必在参加前充分了解项目的安全须知并确保身体状况能适应此类活动；如旅游者不具备较好的身体条件及技能，可能会造成身体伤害。</p>

                <p>3、参加出海活动时，请务必穿着救生设备。参加水上活动应注意自己的身体状况，有心脏病、冠心病、高血压、感冒、发烧和饮酒及餐后不可以参加水上活动及潜水。在海里活动时，严禁触摸海洋中各种鱼类，水母，海胆，珊瑚等海洋生物，避免被其蛰伤。老人和小孩必须有成年人陪同才能参加合适的水上活动。在海边游玩时，注意保管好随身携带的贵重物品。</p>

                <p>4、根据中国海关总署的规定，旅客在境外购买的物品，在进入中国海关时可能需要征收关税。详细内容见《中华人民共和国海关总署公告2010年第54号文件》。</p>

                <p>5、建议出发时行李托运，贵重物品、常用物品、常用药品、御寒衣物等请随身携带，尽量不要托运。行李延误属于不可抗力因素，我司将全力协助客人跟进后续工作，但我司对此不承担任何责任。</p>
                <p>1、旅行社已投保旅行社责任险。建议游客购买旅游意外保险 <br>

                <p>2、旅游者参加打猎、潜水、海边游泳、漂流、滑水、滑雪、滑草、蹦极、跳伞、滑翔、乘热气球、骑马、赛车、攀岩、水疗、水上飞机等属于高风险性游乐项目的，敬请旅游者务必在参加前充分了解项目的安全须知并确保身体状况能适应此类活动；如旅游者不具备较好的身体条件及技能，可能会造成身体伤害。</p>

                <p>3、参加出海活动时，请务必穿着救生设备。参加水上活动应注意自己的身体状况，有心脏病、冠心病、高血压、感冒、发烧和饮酒及餐后不可以参加水上活动及潜水。在海里活动时，严禁触摸海洋中各种鱼类，水母，海胆，珊瑚等海洋生物，避免被其蛰伤。老人和小孩必须有成年人陪同才能参加合适的水上活动。在海边游玩时，注意保管好随身携带的贵重物品。</p>

                <p>4、根据中国海关总署的规定，旅客在境外购买的物品，在进入中国海关时可能需要征收关税。详细内容见《中华人民共和国海关总署公告2010年第54号文件》。</p>

                <p>5、建议出发时行李托运，贵重物品、常用物品、常用药品、御寒衣物等请随身携带，尽量不要托运。行李延误属于不可抗力因素，我司将全力协助客人跟进后续工作，但我司对此不承担任何责任。</p>
            </div>           
        </div>
    </div>
    <!-- 详情 end -->

    <!--引入头部-->
    <div id="footer"></div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>
    <script>
        var rid = getParameter("name");
        // console.log(rid);
            //页面加载完成，ajax请求旅游路线的详情
        $.ajax({
                url:"/travel/detailServlet",
                data:{"rid":rid},
                dataType:"json",
                success:function (res) {
                    //第一部分  类型和标题
                    // $("#rname").html(res.rname);
                    $("#cname").html(res[0].secnic_name);
                    //第二部分 商家信息
                    // $("#sname").html("商家名称："+res.seller.sname);
                    // $("#consphone").html("联系方式："+"121312321");
                    $("#address").html("地址："+res[0].place);
                    //第三部分 旅游线路信息
                    $("#rname2").html(res[0].scenic_name);
                    $("#routeIntroduce").html(res[0].show);
                    $("#price").html("￥"+res[0].price);
                    // $("#count").html("已收藏"+res.count+"次")
                    //第四部分 图片信息
                    $("#bigImg").attr("src","images/"+res[0].photo);
                }
            })
    </script>
</body>

</html>