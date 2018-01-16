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
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<style>

    span1{
        color: #999;
        float:right;
        margin-left: 10px;
        padding-right:40px;
    }
    #view{
        width: 88%;
        line-height: 30px;
        background-color: white;
        margin:0 auto;
        padding-bottom: 40px;
    }
</style>
<body>
<div>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
</div>
<div class="layui-container" style="margin-top: 30px;">
    <div id="view">
        <script id="demo" type="text/html">
            <h3 style="font-weight: normal;text-align: center;font-size: 18px;">【普金资本】{{ d.title }}</h3>
            <span1><a href="<%=path %>/page/about/indexNotice" style="color: #319bff;">返回列表</a></span1><span1><div>{{ formatDate(d.createdTime) }}</div></span1></br>
            <div style="margin-left: 20px;margin-right: 20px;">
                {{ d.content }}
            </div>
        </script>
    </div>
    <div>
    <%@include file="../master/footer.jsp" %>
    </div>
</div>
</body>

<!-- 客服QQ -->
<script charset="utf-8" type="text/javascript" src="<%=path%>/static/js/ccf_js/wpa.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/ccf_js/countup.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/ccf_js/about.js"></script>

<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>

<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
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
