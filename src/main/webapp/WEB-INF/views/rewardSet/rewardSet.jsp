<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2018/1/2
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>投资奖励设置</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body style="padding-top: 20px">

<div class="layui-btn-group demoTable" id="barDemo">
    <button class="layui-btn" data-type="addRewardSet">添加</button>
    <button class="layui-btn" data-type="edit">编辑</button>
    <button class="layui-btn" data-type="remove">删除</button>
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="RewardSetting_table" lay-filter="demo"></table>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#RewardSetting_table'
            ,url: '<%=path %>/data/rewardSet/pagerRewardSet'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'minmoney', title:'最小金额', width:200}
                ,{field:'maxmoney', title:'最大金额', width:300,height:200}
                ,{field:'percent', title:'奖励百分比', width:300,height:200}
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
           edit: function(){ //先获取行数据，将数据跳转到编辑页。
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    layer.open({
                        type: 2,
                        area: ['700px', '400px'],
                        maxmin:true,
                        content:"<%=path %>/page/rewardSet/editRewardSet?rewardSetId="+data[0].rwsid
                    })
                } else {
                    layer.msg("请选择一行！");
                }

            }
            ,addRewardSet: function(){ //获取选中数据
                layer.open({
                    type: 2,
                    area: ['700px', '400px'],
                    maxmin:true,
                    content:"<%=path %>/page/rewardSet/addRewardSet"
                })
            }
            ,remove:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $.post('<%=path %>/data/rewardSet/removeRewardSet?rwsid='+data[0].rwsid,
                        function (data) {
                            if(data.code==0){
                                layer.msg("删除成功！")
                                location.reload(true);
                            }else {
                                layer.msg("删除失败！")
                            }
                        }
                    );
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            }
            ,refresh:function () {
                location.reload(true);
            }
        };

    });
</script>
</body>
</html>

