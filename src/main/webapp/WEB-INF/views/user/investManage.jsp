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
    <title>投资管理</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <div class="account-right">
        <h1>投资管理</h1>
        <hr/>
        <div id="manageBtn" class="layui-row">
            <a href="javascript:void(0);" class="layui-btn" id="borrowShow" data-type="edit">查看投标详情</a>
            <a href="javascript:void(0);" class="layui-btn" id="planShow" data-type="edit">查看收款计划</a>
        </div>

        <table id="borrowList"></table>

    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    layui.use(['table','form', 'layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;

        table.render({
            elem: '#borrowList'
            ,url: '<%=path %>/data/tz/userInvest'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'money', title:'投资金额', width:90}
                ,{field:'term', title:'还款期限', width:90, templet:'<div>{{d.term}}个月</div>'}
                ,{field:'cpname', title:'产品名称', width:120}
                ,{field:'nprofit', title:'年化利率', width:90, templet:'<div>{{d.nprofit}}%</div>'}
                ,{field:'tztime', title:'投资时间', width:180, sort: true, templet:'<div>{{ formatDate(d.tztime)}}</div>'}
            ]]
            ,id: 'checkId'
            ,page: true
            ,height: 500
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
        });

        $('#borrowShow').on('click', function () {
            var checkStatus = table.checkStatus('checkId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                window.location.href='<%=path %>/page/borrowApply/detail/'+ data[0].baid;
            } else {
                layer.msg('请选中一行！', {time:1500});
            }
        });
    });
</script>
</html>
