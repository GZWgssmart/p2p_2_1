<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2018/1/5
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<body>

<table id="RoleList"></table>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem: '#RoleList'
            ,url: '<%=path %>/data/Role/roleList'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'rid', title:'ID', width:70, fixed: 'left'}
                ,{field:'rname', title:'角色名称', width:150}
                ,{field:'content', title:'角色内容', width:200}
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
    });
</script>
</body>
</html>
