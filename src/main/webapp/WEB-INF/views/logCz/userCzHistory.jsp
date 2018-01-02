<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/29
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>前台用户中心模板</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>
    <div class="account-right">
        <%--<div class="searchType">--%>
            <%--<div class="layui-inline">--%>
                <%--<input class="layui-input" name="typeName" id="typeName" autocomplete="off" placeholder="搜索类别"/>--%>
            <%--</div>--%>
            <%--<div class="layui-inline">--%>
                <%--<input class="layui-input" name="title" id="title" autocomplete="off" placeholder="搜索标题"/>--%>
            <%--</div>--%>
            <%--<button class="layui-btn" data-type="reload">搜索</button>--%>
        <%--</div>--%>
        <div class="layui-btn-group demoTable">
            <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
            <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
            <button class="layui-btn" data-type="isAll">全选</button>
            <button class="layui-btn" data-type="delete">删除记录</button>
        </div>
        <table id="allArticle_table" lay-filter="demo"></table>
    </div>
</div>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.$;
        table.render({
            elem: '#allArticle_table'
            , url: '<%=path %>/data/logCz/listPagerCriteria?uid=' + ${user.uid}
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'bankcard', title: '银行卡号', width: 150, fixed: 'left'}
                , {field: 'banktype', title: '所属银行', width: 150}
                , {field: 'money', title: '充值金额', width: 100}
                , {
                    field: 'created_time',
                    title: '充值时间',
                    width: 180,
                    sort: true,
                    templet: '<div>{{ formatDate(d.createdTime)}}</div>'
                }
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

        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            }
        });

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            , getCheckLength: function () { //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
            }
            , isAll: function () { //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选' : '未全选')
            }
            , delete: function () { //验证是否全选
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                if (data.length == 1) {
                    layer.confirm('真的删除行么', function (index) {
                        layer.msg('假装删除了');
                        layer.close(index);
                    });
                } else {
                    layer.msg('请选中一行！', {time: 1500});
                }
            }
        };


        $('.searchType .layui-btn').on('click', function () {
            var type = $(this).data('type');
            search[type] ? search[type].call(this) : '';
        });

        var search = {
            reload: function () {
                var typeName = $('#typeName');
                var title = $('#title');
                //执行重载
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        typeName: typeName.val()
                        , title: title.val()
                    }
                });
            }
        };

    });
</script>

<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
</html>
