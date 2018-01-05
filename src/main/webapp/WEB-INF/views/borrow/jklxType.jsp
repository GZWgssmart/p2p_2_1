<%--
  Created by IntelliJ IDEA.
  User: CMY
  Date: 2018/1/2
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>借款类型</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>


<div class="layui-btn-group demoTable" >
    <button class="layui-btn" data-type="add">新增借款类型</button>
    <button class="layui-btn" data-type="delete">删除借款类型</button>
</div>

<table id="allArticle_table" lay-filter="demo"></table>


<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#allArticle_table'
            ,url: '<%=path %>/data/jklxPage'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'lxid', title:'ID', width:50, fixed: 'left'}
                ,{field:'lxname', title:'借款类型', width:150}
                ,{field:'status', title:'状态', width:100}

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
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }

            ,add: function(){ //借款类型添加

                    layer.open({
                        type: 2,
                        title: '借款类型添加',
                        shadeClose: true,
                        shade: true,
                        area: ['700px', '400px'],
                        content: '<%=path %>/page/jklx/addjklx'
                    });
            }
            ,delete: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.confirm('真的要删除？', function(index){
                        layer.msg('假装删除了');
                        layer.close(index);
                    });
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            }
        };
    });
</script>
</body>
</html>