<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/9/15
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>404了哟</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/css/404.css"/>
</head>
<body>
<div class="demo">
    <p><span>4</span><span>0</span><span>4</span></p>
    <p>该页面不存在(´･ω･`)</p>
</div>
<div class="fanhui">
    <p><a href="<%=path %>/">返回首页</a><a href="javascript:;" onclick="window.history.go(-1)">返回上一页</a></p>
</div>
<script src="<%=path %>/static/js/jquery.min.js"></script>
</body>
</html>
