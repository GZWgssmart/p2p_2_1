<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2017/12/22
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>所有VIP用户</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body style="padding-top: 20px">
<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="allVIP" lay-filter="demo"></table>

<script type="text/html" id="imgUtil">
    {{#  if(d.pic !== null && d.pic != ''){ }}
    <img src="<%=path %>/{{ d.face }}" alt="d.face" style="border-radius:50%;height: 30px;width: 30px;"/>
    {{#  } else { }}
    <span>没有头像</span>
    {{#  } }}
</script>
<script type="text/html" id="sex">
    {{#  if(d.sex == 0){ }}
        <span>保密</span>
    {{#  } else if(d.sex == 1) { }}
        <span>男</span>
    {{#  } else if(d.sex == 2) { }}
        <span>女</span>
    {{#  } }}
</script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#allVIP'
            ,url: '<%=path %>/data/vip/userVip'
            ,cols: [[
                {field:'face', title:'头像', width:60,templet: '#imgUtil'}
                ,{field:'uname', title:'昵称', width:80}
                ,{field:'rname', title:'真实姓名', width:100}
                ,{field:'sex', title:'性别', width:80,templet: '#sex'}
                ,{field:'phone', title:'电话', width:120}
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

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>

