<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/2
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户认证审核</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="getCheckData">审核</button>
</div>

<table id="allRvip" lay-filter="demo"></table>

<script type="text/html" id="isvip">
    {{#  if(d.isvip == 0){ }}
    <span style="color:red;">否</span>
    {{#  } else { }}
    <span style="color:red;">是</span>
    {{#  } }}
</script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        var laytpl = layui.laytpl;

        table.render({
            elem: '#allRvip'
            , url: '<%=path %>/data/vip/novip'
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'rname', title: '用户姓名', width: 170}
                , {field: 'idtype', title: '证件', width: 150}
                , {field: 'idno', title: '证件号', width: 190}
                , {field: 'work', title: '工作', width: 170}
                , {field: 'age', title: '年龄', width: 150}
                , {field: 'addr', title: '地址', width: 170}
                , {field: 'isvip', title: '是否vip', width: 90,templet:'#isvip'}
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

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                var uid = '';
                for(var i = 0; i < data.length; i++) {
                    uid +=data[i].uid + ",";
                }
                if(uid !== null || uid.trim() !== '') {
                    $.post('<%=path %>/data/user/vip',{uid:uid},
                        function (res) {
                            if(res.code == 0) {
                                layer.msg('审核成功！',function () {
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
        };

    });
</script>
</body>
</html>
