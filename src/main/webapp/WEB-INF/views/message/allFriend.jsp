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
    <button class="layui-btn" data-type="remove">删除</button>
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

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            remove:function () {
            var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
            if(data.length == 1) {
                $.post('<%=path %>/data/message/removeFriend?fid='+data[0].fid,
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
          , refresh:function () {
                location.reload(true);
            }

        };

    });
</script>
</body>
</html>

