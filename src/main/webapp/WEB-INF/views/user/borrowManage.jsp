<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/26
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>前台用户中心模板</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <div class="account-right">
        <h1>借款管理</h1>
        <hr/>
    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
</html>
