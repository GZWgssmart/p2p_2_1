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
<table id="HuserList"></table>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table'], function(){
        var table = layui.table;
        table.render({
            elem: '#HuserList'
            ,url: '<%=path %>/data/admin/adminList'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'huid', title:'ID', width:70, fixed: 'left'}
                ,{field:'jurl', title:'权限', width:100}
                ,{field:'rolename', title:'角色名称', width:100}
                ,{field:'huname', title:'用户名', width:100}
                ,{field:'rname', title:'姓名', width:100}
                ,{field:'phone', title:'手机号', width:100}
                ,{field:'email', title:'邮箱', width:100}
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
                        huid : $('#huid').val()
                        ,jurl : $('#jurl').val()
                        ,rolename : $('#rolename').val()
                        ,huname : $('#huname').val()
                        ,rname : $('#rname').val()
                        ,phone : $('#phone').val()
                        ,email : $('#email').val()
                    }
                });
            }
        };
    });
</script>
</body>
</html>
