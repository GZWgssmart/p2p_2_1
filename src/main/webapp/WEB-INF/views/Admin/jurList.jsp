<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2018/1/5
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>权限列表</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<body>

<table id="JurList"></table>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem: '#JurList'
            ,url: '<%=path %>/data/Jur/jurList'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'jid', title:'ID', width:70, fixed: 'left'}
                ,{field:'jurl', title:'权限url', width:150}
                ,{field:'content', title:'权限内容', width:200}
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
