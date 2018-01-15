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
    <title>资金记录</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
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
        <div class="layui-tab layui-tab-brief" style="float: left;">
            <ul class="layui-tab-title">
                <li class="layui-this" id="in">收入</li>
                <li id="out">支出</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show">
                <div class="layui-row">
                    <div class="layui-col-md12">
                        <table id="income"></table>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-col-md12">
                        <table id="outlay"></table>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
<%----%>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    layui.use(['element', 'laytpl','table'] ,function () {
        var element = layui.element;
        var table = layui.table;
        var $ = layui.$;

//        支出
        $('#out').on('click', function () {
            table.render({
                elem: '#outlay'
                , url: '<%=path %>/data/logMoney/record'
                ,where: {
                    type : 1
                }
                , cols: [[
                    {field: 'outlay', title: '金额', width: 180}
                    , {
                        field: 'created_time',
                        title: '支出时间',
                        width: 180,
                        sort: true,
                        templet: '<div>{{formatDate(d.createdTime)}}</div>'
                    }
                ]]
                , id: 'outlay'
                , page: true
                , response: {
                    statusName: 'status'
                    , statusCode: 0
                    , msgName: 'message'
                    , countName: 'total'
                    , dataName: 'rows'
                }
            });
        });
//        收入
        table.render({
            elem: '#income'
            , url: '<%=path %>/data/logMoney/record'
            ,where: {
                type : 0
            }
            , cols: [[
               {field: 'income', title: '金额', width: 180}
                , {
                    field: 'created_time',
                    title: '支出时间',
                    width: 180,
                    sort: true,
                    templet: '<div>{{formatDate(d.createdTime)}}</div>'
                }
            ]]
            , id: 'income'
            , page: true
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
        });
    });
</script>
<script>
    function formatType(type) {
        if(type === 0) {
            return "收入";
        } else {
            return "支出";
        }
    }
</script>
</html>
