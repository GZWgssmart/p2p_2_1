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
    <title>奖励发放管理</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<body>
<div class="account cl">
    <div class="account-right">
        <h1>奖励发放管理</h1>
        <hr/>
        <div class="layui-row">
            <form id="borrowQuery" class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <select name="status" id="status">
                            <option value="">请选择发放状态</option>
                            <option value="1">已发放</option>
                            <option value="0">未发放</option>
                        </select>
                    </div>
                    <a href="javascript:void(0);" class="layui-btn" id="searchBtn" data-type="reload">搜索</a>
                </div>
            </form>
        </div>

        <table id="borrowList"></table>

    </div>
</div>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table','form', 'layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;

        table.render({
            elem: '#borrowList'
            ,url: '<%=path %>/data/reward/rewardList'
            ,cols: [[
                {field:'phone', title:'手机号', width:120}
                ,{field:'tmoney', title:'投资总额', width:120}
                ,{field:'money', title:'奖励金额', width:120}
                ,{field:'status', title:'发放状态', width:120, templet:'<div>{{formatRewardStatus(d.status)}}</div>'}
                ,{field:'rewardTime', title:'发放时间', width:180, sort: true, templet:'<div>{{ formatDate(d.rewardTime)}}</div>'}
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

        var $ = layui.$, active = {
            reload: function(){
                table.reload('checkId', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        status : $('#status').val()
                    }
                });
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type].call(this);
        });
    });
</script>
</html>
