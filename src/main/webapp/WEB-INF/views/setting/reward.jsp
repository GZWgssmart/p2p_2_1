<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/8
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>投资奖励设置</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="getCheckData">添加投资奖励</button>
    <button class="layui-btn" data-type="jieshu">编辑</button>
</div>
<table id="allReward" lay-filter="demo"></table>

<!-- 添加-->
<div style="display: none;" id="addTicket">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">最小金额</label>
            <div class="layui-input-block" style="width: 400px;">
                <input type="text" name="minmoney" lay-verify="number" autocomplete="off" placeholder="最小金额"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">最大金额</label>
            <div class="layui-input-block" style="width: 400px;">
                <input type="text" name="maxmoney" lay-verify="number" autocomplete="off" placeholder="最大金额"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">投资奖励百分比</label>
            <div class="layui-input-block" style="width: 400px;">
                <input type="text" name="percent" lay-verify="number" autocomplete="off" placeholder="投资奖励百分比"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;width: 400px;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="fabu">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['form', 'table'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var table = layui.table;

        table.render({
            elem: '#allReward'
            , url: '<%=path %>/data/reward/all'
            , cols: [[
                {checkbox: true, fixed: true},
                {field: 'minmoney', title: '最小金额', width: 170}
                , {field: 'maxmoney', title: '最大金额', width: 170}
                , {field: 'percent', title: '投资百分比', width: 100}
            ]]
            , id: 'idTest'
            , page: true
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
        });

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            getCheckData: function () { //获取选中数据
                layer.open({
                    type: 1,                //弹窗类型
                    title: '添加',     //显示标题
                    closeBtn: 1,         //是否显示关闭按钮
                    shadeClose: true, //显示模态窗口
                    fixed: false,    //层是否固定在可视区域
                    move: false,//禁止拖拽
                    area: ['700px', '500px'], //宽高
                    content: $("#addTicket"),  //弹窗内容
                });
            }
            ,jieshu:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 0) {
                    layer.msg('请选中一行！');
                } else {
                    layer.alert('哦，请你不要这样子');
                }
            }
        };

        //添加
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/reward/save',
                data.field,
                function (res) {
                    if (res.code === 0) {
                        layer.closeAll();
                        layer.msg('提交成功', {
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {

                            table.reload('idTest', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        });
                    } else {
                        layer.msg('提交失败，请重新再试！');
                    }
                }, 'json'
            );
            return false;
        });

    });
</script>
</body>
</html>
