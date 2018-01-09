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
    <title>所有合作商</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body style="padding-top: 20px">

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="allFriend_table" lay-filter="demo"></table>

<script type="text/html" id="imgUtil">
    {{#  if(d.fpic !== null && d.fpic != ''){ }}
    <img src="<%=path %>/{{ d.fpic }}" alt="d.fpic" />
    {{#  } else { }}
    <span>没有封面图</span>
    {{#  } }}
</script>
<script type="text/html" id="urlUtil">
    {{#  if(d.furl !== null && d.furl != ''){ }}
    <a target="_blank" href="http://{{ d.furl }}">{{ d.furl }}</a>
    {{#  } else { }}
    <span>没有链接</span>
    {{#  } }}
</script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var $ = layui.$;

        table.render({
            elem: '#allFriend_table'
            ,url: '<%=path %>/data/message/pagerFriend'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'fid', title:'ID', width:50, fixed: 'left'}
                ,{field:'fpic', title:'图片', width:300,height:200, templet: '#imgUtil'}
                ,{field:'furl', title:'链接', width:300, templet: '#urlUtil'}
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
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
           refresh:function () {
                location.reload(true);
            }

        };

        $('.searchType .layui-btn').on('click', function(){
            var type = $(this).data('type');
            search[type] ? search[type].call(this) : '';
        });

        var search = {
            reload: function(){
                var title = $('#title');
                var url = $('#url');
                var createTime =$('#createTime');
                //执行重载
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        title: title.val(),
                        url:url.val(),
                        createTime:createTime.val()
                    }
                });
            }
        };
    });
</script>
</body>
</html>

