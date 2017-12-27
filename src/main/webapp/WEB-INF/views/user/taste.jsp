<%--
  Created by IntelliJ IDEA.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>我的赠券</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/datepicker.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <%--信息披露里的左侧边栏--%>
    <%--<%@include file="../master/aboutLeft.jsp"%>--%>
    <div class="account-right">
        <%-- 在此处写用户后台模块代码--%>
            <div class="layui-tab layui-tab-brief" lay-filter="zhuanqian" style="float: left;">
                <ul class="layui-tab-title">
                    <li class="layui-this">代金券</li>
                    <li>加息券</li>
                    <li>现金券</li>
                    <li>体验金</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;width: 100%;padding-top: 40px;">
                    <div class="layui-tab-item layui-show">
                        <div class="searchType">
                            <div class="layui-inline">
                                <button class="layui-btn layui-bg-orange">未使用</button>
                            </div>
                            <div class="layui-inline">
                                <button class="layui-btn layui-bg-orange">已使用</button>
                            </div>
                            <button class="layui-btn layui-bg-orange" data-type="reload">已过期</button>
                        </div>
                        <table class="layui-table" lay-data="{height:400, url:'#', page:true, id:'daijinquan', skin: 'row', even: true}">
                            <thead>
                            <tr>
                                <th lay-data="{field:'username', width:200}">金额</th>
                                <th lay-data="{field:'sex', width:200, sort: true}">获得日期</th>
                                <th lay-data="{field:'sign', width:200}">过期日期</th>
                                <th lay-data="{field:'xinxi', width:300}">说明</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="layui-tab-item">内容2</div>
                    <div class="layui-tab-item">内容3</div>
                </div>
            </div>
    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    $('.sidebar-top').click(function(){
        $('body').scrollTop(0);
    });
    layui.use(['element','layer','table'], function () {
        var $ = layui.jquery
            , element = layui.element,
            layer = layui.layer
            ,table = layui.table;

    });
</script>
</html>
