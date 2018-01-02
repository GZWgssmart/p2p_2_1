<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2017/12/28
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
    <meta charset="utf-8">
    <title>公告详情</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
</head>
<body>
<ul class="layui-nav layui-bg-blue" lay-filter="">
    <li class="layui-nav-item"><a href="">首页</a></li>
    <li class="layui-nav-item"><a href="<%=path %>/user/loginPage">用户登录</a></li>
</ul>
<div class="layui-container layui-bg-green">
    <div id="view">
        <script id="demo" type="text/html">
            <p><h1 align="center">{{ d.title }}</h1></p>
            <hr class="layui-bg-orange">
            <p><h2>&nbsp &nbsp &nbsp &nbsp{{ d.content }}</h2></p>

            <p><h3 align="center">{{ formatDate(d.createdTime) }}</h3></p>
        </script>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script src="<%=path %>/static/js/home/public.js"></script>
<script>
    //获取url上的值,获取页面传过来的值
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }
    var noticeId = GetQueryString("noticeId");
    layui.use(['element', 'laytpl'], function () {
        var $ = layui.$;
        var element = layui.element;
        var laytpl = layui.laytpl;

        var getTpl = demo.innerHTML
            , view = document.getElementById('view');
        $.get('<%=path %>/data/message/noticeDetail?noticeId=' + noticeId,
            function (data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
            });

    });
</script>
</html>
