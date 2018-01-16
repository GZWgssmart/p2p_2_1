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
    <div class="layui-btn-group demoTable">
        <button class="layui-btn" data-type="add">添加角色</button>
        <button class="layui-btn" data-type="edit">编辑角色</button>
        <button class="layui-btn" data-type="remove">删除角色</button>
        <button class="layui-btn" data-type="fpJur">分配权限</button>
    </div>

    <table id="RoleList"></table>

<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['form', 'table','layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;

        table.render({
            elem: '#RoleList'
            ,url: '<%=path %>/data/Role/roleList'
            ,cols: [[
                {checkbox: true, fixed: true}
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
                var checkStatus = table.checkStatus('checkId')
                    ,data = checkStatus.data;
                layer.open({
                    type: 2,
                    area: ['600px', '400px'],
                    maxmin:true,
                    scrollbar:false,
                    content:"<%=path %>/page/Role/add"
                })
            },
            edit: function(){ //先获取行数据，将数据跳转到编辑页。
                var checkStatus = table.checkStatus('checkId')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['600px', '400px'],
                        maxmin:true,
                        scrollbar:false,
                        content:"<%=path %>/page/Role/update?roleId="+data[0].rid
                    })
                } else {
                    layer.msg("请选择一行！");
                }

            }
            ,detail: function(){ //获取选中数据
                var checkStatus = table.checkStatus('checkId')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['800px', '600px'],
                        maxmin:true,
                        scrollbar:false,
                        content:"<%=path %>/page/Role/roleDetail?roleId="+data[0].rid
                    })
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            }
            ,remove:function () {
                var checkStatus = table.checkStatus('checkId')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $.post('<%=path %>/data/Role/remove'
                        ,{
                            rid:data[0].rid
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
            }
            ,fpJur:function () {
                var checkStatus = table.checkStatus('checkId')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['760px', '500px'],
                        maxmin:true,
                        scrollbar:false,
                        content:"<%=path %>/page/Role/rolejur?"+data[0].rid
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
