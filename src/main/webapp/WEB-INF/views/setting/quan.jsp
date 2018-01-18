<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/4
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>奖励券</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="searchType">
    <div class="layui-inline">
        <input class="layui-input" name="name" id="name" autocomplete="off" placeholder="搜索券名"/>
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="getCheckData">添加券</button>
    <button class="layui-btn" data-type="delete">删除券</button>
    <button class="layui-btn" data-type="jieshu">结束</button>
</div>

<table id="allTicket" lay-filter="demo" lay-size="lg"></table>

<!-- 添加-->
<div style="display: none;" id="addTicket">
    <form class="layui-form">
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">券名</label>
            <div class="layui-input-block" style="width: 400px;">
                <input type="text" name="name" lay-verify autocomplete="off" placeholder="券的名字"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block" style="width: 400px;">
                <select name="type" lay-verify="required">
                    <option value="0">现金券</option>
                    <option value="1">代金券</option>
                    <option value="2">加息券</option>
                    <option value="3">推荐奖励券</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">价值</label>
            <div class="layui-input-block" style="width: 400px;">
                <input type="text" name="tkmoney" lay-verify="number" autocomplete="off" placeholder="金额"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;">
            <label class="layui-form-label">有效时间</label>
            <div class="layui-input-inline" style="width: 400px;">
                <input type="text" name="whatTime" id="time" lay-verify="laydate" placeholder="yyyy-MM-dd HH:mm:ss"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;width: 400px;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="fabu">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="typeName">
    {{# if(d.type == 0) { }}
    <span>现金券</span>
    {{# } else if(d.type == 1) { }}
    <span>代金券</span>
    {{# } else if(d.type == 2) { }}
    <span>加息券</span>
    {{# } else if(d.type == 3) { }}
    <span>推荐奖励券</span>
    {{# } }}
</script>
<script type="text/html" id="statusName">
    {{# if(d.status == 0) { }}
    <span>发放中</span>
    {{# } else if(d.status == 1) { }}
    <span>已结束</span>
    {{# } }}
</script>
<script type="text/html" id="url">
    <input value="http://localhost:8080/page/user/getticket?{{ d.kid }}" class="layui-input" />
</script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['form', 'table', 'laydate'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var table = layui.table;
        var laydate = layui.laydate;

        table.render({
            elem: '#allTicket'
            , url: '<%=path %>/data/ticket/all'
            , cols: [[
                {checkbox: true, fixed: true},
                {field: 'name', title: '名字', width: 170}
                , {field: 'type', title: '类型', width: 170, templet: '#typeName'}
                , {field: 'tkmoney', title: '金额', width: 100}
                , {field: 'tktime', title: '有效时间', width: 190, templet: '<div>{{ formatDate(d.tktime) }}</div>'}
                , {field: 'status', title: '状态', width: 100, templet: '#statusName'}
                , {field: 'right', title:'领券链接', width: 350, templet: '#url'}
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

        //执行一个laydate实例
        laydate.render({
            elem: '#time' //指定元素
            , type: 'datetime'
            , min: 0
        });

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            getCheckData: function () { //获取选中数据
                layer.open({
                    type: 1,                //弹窗类型
                    title: '添加券',     //显示标题
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
                var kid = '';
                if(data.length == 0) {
                    layer.msg('请选中一行！');
                } else {
                    for(var i = 0; i < data.length; i++) {
                        kid +=data[i].kid + ",";
                    }
                    $.post('<%=path %>/data/ticket/status',{kid:kid},
                        function (res) {
                            if(res.code == 0) {
                                layer.msg('操作成功！',function () {
                                    //执行重载
                                    table.reload('idTest', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                });
                            } else {
                                layer.msg('失败');
                            }
                        }
                    );
                }
            }
            ,delete:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $.post('<%=path %>/data/ticket/remove',{kid:data[0].kid},
                        function (res) {
                            if(res.code == 0) {
                                layer.msg('操作成功！',{time:2000},function () {
                                    table.reload('idTest', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                });
                            } else {
                                layer.msg('操作失败');
                            }
                        }
                    );
                } else {
                    layer.msg('请选中一行！');
                }
            }
        };

        //添加券
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/ticket/save',
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

        $('.searchType .layui-btn').on('click', function () {
            var type = $(this).data('type');
            search[type] ? search[type].call(this) : '';
        });

        var search = {
            reload: function () {
                var name = $('#name');
                //执行重载
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        name: name.val(),
                    }
                });
            }
        };

    });
</script>
</body>
</html>
