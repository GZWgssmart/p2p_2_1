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
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<style>
    body {
        line-height: 50px;
    }
    #view{
        width: 1160px;
        background-color: white;
        margin:0 auto;
        padding-bottom: 15%;
    }
    .li{
        color: #999;
        float:right;
        margin-left: 10px;
    }
    #contentDiv p{
        text-indent: 2em; /*em是相对单位，2em即现在一个字大小的两倍*/
    }
    #contentDiv img{
        width: 600px;
        margin-top: 20px;
    }
</style>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="layui-container" style="margin-top: 30px;">
    <div id="view">
        <script id="demo" type="text/html">
            <h3 style="font-weight: normal;text-align: center;font-size: 18px;padding-top: 20px;">{{ d.title }}</h3>
            {{#  if(d.pic !== null){ }}
            <a href="{{ d.url }}"><i class="layui-icon" style="font-size: 20px; color: #999;margin-left: 30px;">&#xe64c;</i></a>
            {{#  } else { }}
            <span>无链接</span>
            {{#  } }}
            <span class="li"><a href="<%=path %>/page/dynamic/indexDynamic#test1=1" style="color: #319bff;margin-right: 10px;">返回列表</a></span><span class="li"><div>{{ formatDate(d.createdTime) }}</div></span>
            <p style="margin-left: 50px;margin-top: 60px;">{{ d.summary }}</p>
            <div style="margin-left: 20px;margin-right: 20px;" id="contentDiv">
                {{ d.content }}
            </div>
        </script>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
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
