<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2018/1/2
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>后台用户管理</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<body>
<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="fpRole">分配角色</button>
</div>
<table id="HuserList"></table>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem: '#HuserList'
            ,url: '<%=path %>/data/admin/adminList'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'rolename', title:'角色名称', width:100}
                ,{field:'huname', title:'用户名', width:120}
                ,{field:'rname', title:'姓名', width:120}
                ,{field:'phone', title:'手机号', width:200}
                ,{field:'email', title:'邮箱', width:200}
            ]]
            ,id: 'idTest'
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
    });
</script>
</body>
</html>
