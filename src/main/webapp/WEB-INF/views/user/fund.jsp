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
            </ul>
            <div class="layui-tab-content" style="height: 100px;padding-top: 40px;">
                <div class="layui-tab-item layui-show">
                    <div class="fund-param-list">
                        <p>交易类型：</p>
                        <ul class="cl">
                            <li class="active"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">投资</a></li>
                            <li><a href="javascript:;">充值</a></li>
                            <li><a href="javascript:;">提现</a></li>
                            <li><a href="javascript:;">还款</a></li>
                            <li><a href="javascript:;">奖励</a></li>
                            <li><a href="javascript:;">冻结</a></li>
                        </ul>
                    </div>
                    <div class="account-form cl">
                        <p class="text long">交易时间：</p>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="begin" placeholder="开始时间">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="end" placeholder="结束时间">
                        </div>
                        <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                        <button type="button" class="search" id="fundSearch">搜索</button>
                    </div>
                    <table class="layui-table" lay-data="{height:400, url:'#', page:true, id:'daijinquan', skin: 'row', even: true}">
                        <thead>
                        <tr>
                            <th lay-data="{field:'username', width:200}">日期</th>
                            <th lay-data="{field:'sex', width:150, sort: true}">金额</th>
                            <th lay-data="{field:'sign', width:150}">订单号</th>
                            <th lay-data="{field:'xinxi', width:150}">信息</th>
                        </tr>
                        </thead>
                    </table>
                </div>
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
    layui.use(['element','layer','laydate','table'], function () {
        var $ = layui.jquery
            , element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate
        ,table = layui.table;

        laydate.render({
            elem: '#begin'
        });

        laydate.render({
            elem: '#end'
            ,min:$('#begin').val()
            ,max:'2080-10-14'
        });

    });
</script>
</html>
