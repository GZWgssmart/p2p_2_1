<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/22
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>普金资本</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/home/jquery.slider.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="master/top.jsp"%>
<%@include file="master/header.jsp"%>
    <div class="layui-row">
        <!-- banner -->
        <div class="banner">
            <div class="slider">
                <div><a href="www.baidu.com"><img src="<%=path %>/static/images/slide1.jpg" alt="" style="width:100%;height:340px"></a></div>
                <div><a href="www.youtube.com"><img src="<%=path %>/static/images/slide2.jpg" alt="" style="width:100%;height:340px"></a></div>
                <div><a href="www.bilibili.com"><img src="<%=path %>/static/images/slide3.jpg" alt="" style="width:100%;height:340px"></a></div>
                <div><a href="www.weibo.com"><img src="<%=path %>/static/images/slide4.jpg" alt="" style="width:100%;height:340px"></a></div>
            </div>
        </div>
    </div>
<%@include file="master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/jquery.slider.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".slider").slideshow({
            width: 1366,
            height: 340,
            transition: ['bar', 'Rain', 'square', 'squareRandom', 'explode']
        });
    });
</script>
</html>