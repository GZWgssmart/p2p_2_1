<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2017/12/26
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>所有公告</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body style="padding-top: 20px">

<div class="searchType">
    <div class="layui-inline">
        <input class="layui-input" name="title" id="title" autocomplete="off" placeholder="搜索标题"/>
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<br/>
<div class="layui-btn-group demoTable" id="barDemo">
    <button class="layui-btn" data-type="detail">查看</button>
    <button class="layui-btn" data-type="edit">编辑</button>
    <button class="layui-btn" data-type="remove">删除</button>
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="allNotice_table" lay-filter="demo"></table>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#allNotice_table'
            ,url: '<%=path %>/data/message/pagerNotice'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'title', title:'标题', width:200}
                ,{field:'content', title:'内容', width:300,height:200}
                ,{field:'createdTime', title:'创建时间',width:250, sort: true, templet:'<div>{{ formatDate(d.createdTime)}}</div>'}
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
                    window.open("<%=path %>/page/message/editNotice?noticeId="+data[0].nid)
                } else {
                    layer.msg("请选择一行！");
                }

            }
            ,detail: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    window.open("<%=path %>/page/about/noticeDetail?noticeId="+data[0].nid)
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            },remove:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $.post('<%=path %>/data/message/removeNotice?nid='+data[0].nid,
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

        $('.searchType .layui-btn').on('click', function(){
            var type = $(this).data('type');
            search[type] ? search[type].call(this) : '';
        });

        var search = {
            reload: function(){
                //获取input框的值对 ，要进行几个搜索框 ，就传入几个值
                var title = $('#title');
                //执行重载
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        //把需要搜索的条件都，写上
                        title: title.val(),
                    }
                });
            }
        };
    });
</script>
</body>
</html>

