<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2017/12/26
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
        <title>公司动态</title>
        <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
        <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
        <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl">
    <%--<%@include file="../master/left.jsp" %>--%>
    <%--信息披露里的左侧边栏--%>
    <%@include file="../../master/aboutLeft.jsp" %>
    <div class="account-right">
        <div class="layui-tab layui-tab-brief" style="float: left;">
            <ul class="layui-tab-title">
                <li class="layui-this">基本信息</li>
                <li>治理信息</li>
                <li>网站或平台信息</li>
            </ul>
            <div class="layui-tab-content" style="width: 900px">
                <div class="layui-tab-item layui-show">

                </div>

                <div class="layui-tab-item">

                </div>

            </div>
        </div>
    </div>

</div>
<%@include file="../../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element'], function () {
        var $ = layui.jquery
            ,element = layui.element;
    });
</script>
</body>
</html>
