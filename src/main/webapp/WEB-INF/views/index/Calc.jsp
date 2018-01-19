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
    <title>收益计算器</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>

<div class="account cl">
    <div class="layui-container" style="background-color: #ffffff;padding-top: 50px;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>收益计算器</legend>
        </fieldset>
        <form class="layui-form" style="margin: 20px;">
            <div class="layui-inline">
                <label class="layui-form-label">投资金额</label>
                <div class="layui-input-inline" style="width: 100px">
                    <input type="text" lay-verify="required" name="totalMoney" id="totalMoney" placeholder="投资金额" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年化收益(%)</label>
                <div class="layui-input-inline" style="width: 100px">
                    <input type="text" lay-verify="required" name="nprofit" id="nprofit" placeholder="年化收益率" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">还款方式</label>
                <div class="layui-input-inline" style="width: 120px">
                    <select name="type" id="type">
                        <option value="1" selected="">等额本息</option>
                        <option value="0">等额本金</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">还款期限</label>
                <div class="layui-input-inline" style="width: 120px">
                    <select name="month" id="month">
                        <option value="12" selected="">12月</option>
                        <option value="6">6月</option>
                        <option value="3">3月</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" style="margin-left: -50px;">
                <div class="layui-input-block">
                    <a href="javascript:void(0);" class="layui-btn" id="Calculation">立即计算</a>
                </div>
            </div>
        </form>

        <div style="height: 600px;">
            <table id="List"></table>
        </div>
    </div>
</div>

<%@include file="../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    layui.use(['table','form', 'layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;

        $('#Calculation').on('click', function(){
            var money = $('#totalMoney').val();
            var nprofit  = $('#nprofit').val();
            if(money !== null && money.trim() !== '' && !isNaN(money)
                && money >= 0 && nprofit !== null && nprofit.trim() !== ''
                && !isNaN(nprofit) && nprofit > 0 && nprofit <= 100) {
                table.render({
                    elem: '#List'
                    ,url: '<%=path %>/data/calc/calc'
                    ,where: {
                        totalMoney : money
                        ,nprofit : nprofit
                        ,type : $('#type').val()
                        ,month : $('#month').val()
                    }
                    ,cols: [[
                        {field:'repayment', title:'本月还款金额', width:120, fixed: 'left'}
                        ,{field:'payPrincipal', title:'支付本金', width:120}
                        ,{field:'interest', title:'利息', width:120}
                        ,{field:'remainTotal', title:'剩余本金', width:120}
                        ,{field:'month', title:'还款期限', width:120}
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
            } else {
                utils.alert("请正确填写数据！");
            }
        });
    });
</script>
</body>
</html>
