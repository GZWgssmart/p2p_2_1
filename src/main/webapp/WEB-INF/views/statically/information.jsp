<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2017/12/25
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>信息披露</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>

<div class="about cl">
    <div class="about-left">
        <div class="about-left-nav">
            <div id="animateDiv" class="animateDiv">
                <ul id="animateUl" class="sub-nav">
                    <li class="xxpl" class="active"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
                </ul>
            </div>
            <ul class="sub-nav">
                <li><div class="hr"></div></li>
                <li id="gd"><a href="#gdbj" class="icon-about about-gudong">股东背景</a></li>
                <li><a href="#gsjj" class="icon-about about-jianjie">公司简介</a></li>
                <li><a href="#ptzz" class="icon-about about-zizhi">平台资质</a></li>
                <!-- <li><a href="#gltd" class="icon-about about-guanli">管理团队</a></li> -->
                <li><a href="#gwtd" class="icon-about about-guwen">顾问团队</a></li>
                <li><a href="#gsdt" class="icon-about about-dongtai">公司动态</a></li>
                <li><a href="#ptgg" class="icon-about about-gonggao">平台公告</a></li>
                <li><a href="#zxns" class="icon-about about-zhaopin">招贤纳士</a></li>
                <li><a href="#lxwm" class="icon-about about-lianxi">联系我们</a></li>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="about-right">

    </div>
    <!-- end -->
</div>
<%@include file="../master/footer.jsp"%>
</body>
</html>
