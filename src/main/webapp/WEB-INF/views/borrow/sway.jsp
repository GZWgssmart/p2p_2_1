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
    <title>还款方式</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>


<div class="layui-btn-group demoTable" >
    <button class="layui-btn" data-type="add">新增还款方式</button>
    <button class="layui-btn" data-type="update">修改还款方式</button>
    <button class="layui-btn" data-type="delete">删除还款方式</button>
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="allArticle_table" lay-filter="demo"></table>
<script type="text/html" id="statusID">
    {{#  if(d.status == 0){ }}
    <span style="color: red;">冻结</span>
    {{#  } else { }}
    <span style="color: green;">激活</span>
    {{#  } }}
</script>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#allArticle_table'
            ,url: '<%=path %>/data/sway/swayPage'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'way', title:'还款方式', width:150}
                ,{field:'fw', title:'利率', width:150}
                ,{field:'status', title:'状态', width:100,templet:'#statusID'}


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
                    $.get('<%=path %>/data/sway/delete?swayId=' + data[0].sid,
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
                    title: '还款方式',
                    area: ['700px', '400px'],
                    content: '<%=path %>/page/sway/addsway'
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
                        content:"<%=path %>/page/sway/updateSway?huankuanId="+data[0].sid
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