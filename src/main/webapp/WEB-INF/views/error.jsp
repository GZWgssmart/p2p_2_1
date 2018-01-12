<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/8/28
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%><!DOCTYPE html>
<html>
<head>
    <title>报错了耶</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/css/404.css"/>
</head>
<body>
<div class="demo">
    <p><span>出</span><span>错</span><span>了</span></p>
    <p>赶紧通知程序猿吧(´･ω･`)</p>
</div>
<div class="fanhui">
    <p><a href="<%=path %>/">返回首页</a><a href="javascript:;" onclick="window.history.go(-1)">返回上一页</a></p>
</div>
<script src="<%=path %>/static/js/jquery.min.js"></script>
</body>
</html>
