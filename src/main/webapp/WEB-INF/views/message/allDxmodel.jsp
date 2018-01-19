<%--
  Created by IntelliJ IDEA.
  User: CMY
  Date: 2018/1/16
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>短信模板</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body style="padding-top: 20px">


<div class="layui-btn-group demoTable" id="barDemo">

    <button class="layui-btn" data-type="add">添加</button>
    <button class="layui-btn" data-type="update">修改</button>
    <button class="layui-btn" data-type="delete">删除</button>
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="dxModel" lay-filter="demo"></table>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#dxModel'
            ,url: '<%=path %>/data/message/dxmodelPage'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'content', title:'内容', width:700}
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
            delete:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $.get('<%=path %>/data/message/dxdelete?dxId=' + data[0].dxid,
                        function (data) {
                            if(data.code==0){
                                layer.msg("删除成功！")
                                location.reload(true);
                            }else {
                                layer.msg("删除失败！")
                            }
                        });
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            },
            refresh:function () {
                location.reload(true);
            }

            ,add: function(){ //借款类型添加

                layer.open({
                    type: 2,
                    title: '添加',
                    area: ['700px', '400px'],
                    content: '<%=path %>/page/message/addDxmodel'
                });
            }
            ,update: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['700px', '400px'],
                        maxmin:true,
                        content:"<%=path %>/page/message/updayteDxmodel?dxId="+data[0].dxid
                    })
                } else {
                    layer.msg("请选择一行！");
                }

            },
            refresh:function () {
                location.reload(true);
            },
        };


    });
</script>
</body>
</html>
