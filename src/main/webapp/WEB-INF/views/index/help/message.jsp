<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2018/1/3
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>前台用户中心</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/datepicker.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/login.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl " style="background-color: white">
    <%@include file="left.jsp" %>
    <div class="account-right ">

        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this">服务协议</li>
                <li>借款合同</li>
            </ul>
            <div class="layui-tab-content" style="height: 100%;">
                <div class="layui-tab-item layui-show ">
                    <div class="content">
                        <img src="<%=path %>/static/images/help/fwxy_01.jpg">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_02.jpg" src="<%=path %>/static/images/help/fwxy_02.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_03.jpg" src="<%=path %>/static/images/help/fwxy_03.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_04.jpg" src="<%=path %>/static/images/help/fwxy_04.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_05.jpg" src="<%=path %>/static/images/help/fwxy_05.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_06.jpg" src="<%=path %>/static/images/help/fwxy_06.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_07.jpg" src="<%=path %>/static/images/help/fwxy_07.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_08.jpg" src="<%=path %>/static/images/help/fwxy_08.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_09.jpg" src="<%=path %>/static/images/help/fwxy_09.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_10.jpg" src="<%=path %>/static/images/help/fwxy_10.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_11.jpg" src="<%=path %>/static/images/help/fwxy_11.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_12.jpg" src="<%=path %>/static/images/help/fwxy_12.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_13.jpg" src="<%=path %>/static/images/help/fwxy_13.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_14.jpg" src="<%=path %>/static/images/help/fwxy_14.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/fwxy_15.jpg" src="<%=path %>/static/images/help/fwxy_15.jpg" style="display: inline;">
                    </div>
                </div>

                <div class="layui-tab-item">
                    <div class="content" style="display: block;">
                        <img class="lazy" src="<%=path %>/static/images/help/jkxy_1.jpg">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/jkxy_2.jpg" src="<%=path %>/static/images/help/jkxy_2.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/jkxy_3.jpg" src="<%=path %>/static/images/help/jkxy_3.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/jkxy_4.jpg" src="<%=path %>/static/images/help/jkxy_4.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/jkxy_5.jpg" src="<%=path %>/static/images/help/jkxy_5.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/jkxy_6.jpg" src="<%=path %>/static/images/help/jkxy_6.jpg" style="display: inline;">
                        <img class="lazy" data-original="resources/front/v01/src/images/help/jkxy_7.jpg" src="<%=path %>/static/images/help/jkxy_7.jpg" style="display: inline;">
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%@include file="../../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'layer'], function () {
        var $ = layui.jquery
            , element = layui.element

    });
</script>
</html>
