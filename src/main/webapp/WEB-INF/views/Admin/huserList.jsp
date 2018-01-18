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
    <button class="layui-btn" data-type="add">添加后台用户</button>
    <button class="layui-btn" data-type="edit">编辑后台用户</button>
    <button class="layui-btn" data-type="remove">删除后台用户</button>
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
                ,{field:'huname', title:'用户名', width:120}
                ,{field:'rolename', title:'所属角色', width:100}
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
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            add: function(){ //先获取行数据，将数据跳转到编辑页。
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.open({
                    type: 2,
                    area: ['500px', '420px'],
                    maxmin:true,
                    scrollbar:false,
                    content:"<%=path %>/page/admin/add"
                })
            },
            edit: function(){ //先获取行数据，将数据跳转到编辑页。
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['600px', '430px'],
                        maxmin:true,
                        scrollbar:false,
                        content:"<%=path %>/page/admin/update?huid="+data[0].huid
                    })
                } else {
                    layer.msg("请选择一行！");
                }

            }
            ,detail: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['800px', '600px'],
                        maxmin:true,
                        scrollbar:false,
                        content:"<%=path %>/page/admin/HuserDetail?huid="+data[0].huid
                    })
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            }
            ,remove:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $.post('<%=path %>/data/admin/remove'
                        ,{
                            huid:data[0].huid
                        },
                        function (res) {
                            if (res.code === 0) {
                                layer.msg('删除成功', {
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function () {
                                    location.reload(true);
                                });
                            } else {
                                layer.msg(res.message);
                            }
                        }, 'json'
                    );
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            },
            fpRole: function(){ //先获取行数据，将数据跳转到编辑页。
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['760px', '500px'],
                        maxmin:true,
                        scrollbar:false,
                        content:"<%=path %>/page/Role/rolehuser?"+data[0].huid
                    })
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            }
        };
    });
</script>
</body>
</html>
