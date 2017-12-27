<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2017/12/25
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
    <meta charset="utf-8">
    <title>媒体报道详情</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
</head>
<body>
<ul class="layui-nav layui-bg-blue" lay-filter="">
    <li class="layui-nav-item"><a href="">首页</a></li>
    <li class="layui-nav-item"><a href="<%=path %>/user/loginPage">用户登录</a></li>
</ul>
<div class="layui-container">
    <div id="view">
        <script id="demo" type="text/html">
            {{#  if(d.url !== null && d.url != ''){ }}
            <a target="_blank" href="{{ d.url }}">{{ d.url }}</a>
            {{#  } else { }}
            <span><a href="#"></a></span>
            {{#  } }}
            <h3>{{ d.title }}</h3>
            <p>{{ d.summary }}</p>
            {{#  if(d.pic !== null){ }}
            <img src="<%=path %>/{{ d.pic }}" alt="d.pic"style="width: 600px;height: auto"/>
            {{#  } else { }}
            <span>-----------------</span>
            {{#  } }}
            <div>
                {{ d.content }}
            </div>
            <p><div>{{ formatDate(d.createdTime) }}</div></p>
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
    var mediaId = GetQueryString("mediaId");
    layui.use(['element', 'laytpl'], function () {
        var $ = layui.$;
        var element = layui.element;
        var laytpl = layui.laytpl;

        var getTpl = demo.innerHTML
            , view = document.getElementById('view');
        $.get('<%=path %>/data/company/details?mediaId=' + mediaId,
            function (data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
            });

    });
</script>
</html>
