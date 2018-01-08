<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/25
  Time: 8:29
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
    <%--信息披露里的左侧边栏--%>
    <%--<%@include file="../master/aboutLeft.jsp"%>--%>
    <div class="account-right">
        <%-- 在此处写用户后台模块代码--%>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">消息中心</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <!-- 消息中心-->
                <div class="layui-tab-item layui-show layui-row">
                    <div class="layui-btn-group demoTable">
                        <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
                        <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
                        <button class="layui-btn" data-type="isAll">验证是否全选</button>
                        <button class="layui-btn" data-type="">删除</button>
                        <button class="layui-btn" data-type="">标记已读</button>
                        <button class="layui-btn" data-type="">标记未读</button>
                    </div>
                    <table id="allArticle_table" lay-filter="demo"></table>

                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    $('.sidebar-top').click(function () {
        $('body').scrollTop(0);
    });
    layui.use(['element', 'table'], function () {
        var $ = layui.jquery
            , element = layui.element
            , table = layui.table

        table.render({
            elem: '#allArticle_table'
            ,url: '#'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'id', title:'ID', width:50, fixed: 'left'}
                ,{field:'laiyuan', title:'来源', width:250}
                ,{field:'title', title:'标题', width:250}
                ,{field:'createdTime', title:'创建时间', width:250, sort: true, templet:'<div>{{ formatDate(d.createdTime)}}</div>'}
            ]]
            ,id: 'idTest'
            ,page: true
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
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
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
        };

    });
</script>
</html>



