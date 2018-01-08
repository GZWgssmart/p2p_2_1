<%--
  Created by IntelliJ IDEA.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>我的赠券</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/datepicker.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <%--信息披露里的左侧边栏--%>
    <%--<%@include file="../master/aboutLeft.jsp"%>--%>
    <div class="account-right">
        <%-- 在此处写用户后台模块代码--%>
            <div class="layui-tab layui-tab-brief" lay-filter="zhuanqian" style="float: left;">
                <ul class="layui-tab-title">
                    <li class="layui-this">我的赠券</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;width: 100%;padding-top: 40px;">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-row">
                            <form id="borrowQuery" class="layui-form">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <input type="text" id="name" name="cpname" placeholder="请输入券的名字" class="layui-input layui">
                                    </div>
                                    <div class="layui-input-inline">
                                        <select name="type" id="type">
                                            <%--// TODO 标种从数据库循环--%>
                                            <option value="">所有券</option>
                                            <option value="0">现金券</option>
                                            <option value="1">代金券</option>
                                            <option value="2">加息券</option>
                                        </select>
                                    </div>
                                    <a href="javascript:void(0);" class="layui-btn" id="searchBtn" data-type="reload">搜索</a>
                                </div>
                            </form>
                        </div>

                        <table id="allTicket" lay-filter="demo"></table>

                    </div>
                </div>
            </div>
    </div>
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
<script type="text/html" id="money">
    {{# if(d.type == 2) { }}
    <span>{{ d.tkmoney }}%</span>
    {{# } else { }}
    <span>{{ d.tkmoney }} 元</span>
    {{# } }}
</script>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    layui.use(['element','layer','table','form'], function () {
        var $ = layui.jquery
            , element = layui.element,
            layer = layui.layer
            ,table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#allTicket'
            , url: '<%=path %>/data/ticket/userAll?uid=' + ${user.uid}
            , cols: [[
//                {checkbox: true, fixed: true},
                {field: 'name', title: '券名', width: 176}
                , {field: 'type', title: '类型', width: 176, templet: '#typeName'}
                , {field: 'tkmoney', title: '金额', width: 150, templet: '#money'}
                , {field: 'lqtime', title: '领券时间', width: 190, templet: '<div>{{ formatDate(d.lqtime) }}</div>'}
                , {field: 'tktime', title: '有效时间', width: 190, templet: '<div>{{ formatDate(d.tktime) }}</div>'}
            ]]
            , id: 'idTest'
            , page: true
            , width: 889
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
        });

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type].call(this);
        });

        var active = {
            reload: function(){
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name : $('#name').val()
                        ,type : $('#type').val()
                    }
                });
            }
        };



    });
</script>
</html>
