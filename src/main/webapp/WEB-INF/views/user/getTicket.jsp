<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/4
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>领券</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">



</div>
<%@include file="../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    var one = window.location.search;
    if(one != null || one != '') {
        one = one.replace("?","");
        alert(one);
    }
    layui.use(['form','laytpl'], function () {
        var $ = layui.jquery;
        var form = layui.form;
        var laytpl = layui.laytpl;

        $.post('<%=path %>/data/ticket/getById',
            {kid:one},
            function (data) {
                alert(1);
            }
        );

    });
</script>
</body>
</html>
