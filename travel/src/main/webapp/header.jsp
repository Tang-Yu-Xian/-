<%@ page import="main.java.com.jsu.bean.user" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 头部 start -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/smoothness/jquery-ui-1.9.2.custom.css">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/myJS.js"></script>

<header id="header">
        <div class="top_banner">
            <img src="images/top_banner2.jpg" alt="">
        </div>
        <div class="shortcut" id="loginStatus">

<%--                  <c:if test="${empty sessionScope.User}">--%>
                    <%
                     if (session.getAttribute("User") == null) {
                    %>
                      <div class="login_out">
                          <a href="login.jsp">登录</a>
                          <a href="register.jsp">注册</a>
                      </div>
                    <%
                         } else {
                     %>
<%--                  </c:if>--%>

<%--                  <c:if test="${not empty sessionScope.User}">--%>

                      <div class="login">
                          <span>欢迎回来,<font color='blue'><%=((user)session.getAttribute("User")).getName()%></font></span>
                          <a href="" class="collection">我的收藏</a>
                          <a href="/travel/userServlet">退出</a>
                      </div>
<%--                  </c:if>--%>
                    <%
                        }
                    %>
        </div>
        <div class="header_wrap">
            <div class="topbar">
                <div class="logo">
                    <a href="/travel/index.jsp"><img src="images/logo2.jpg" alt="" width="207px" height="56px"></a>
                </div>
                <div class="search">
<%--                    <input oninput="myAutoComplete(this.value)" onblur="setCook(this.value)" id="searchBtn" name="" type="text" placeholder="请输入路线名称" class="search_input">--%>
<%--                    <a href="javascript:;" class="search-button" onclick="findRouteByPage(1)" id="searchSub">搜索</a>--%>
                </div>
                <div class="hottel">
                    <div class="hot_pic">
                        <img src="images/hot_tel.jpg" alt="">
                    </div>
                    <div class="hot_tel">
                        <p class="hot_time">客服热线(9:00-6:00)</p>
                        <p class="hot_num">400-618-9090</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 头部 end -->
     <!-- 首页导航 -->
    <div class="navitem">
        <ul class="nav">
            <li class="nav-active" id="categoryList"><a href="index.jsp">首页</a></li>
        </ul>
    </div>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/getParameter.js"></script>


    