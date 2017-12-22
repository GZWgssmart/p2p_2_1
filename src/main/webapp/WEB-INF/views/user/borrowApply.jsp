<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/22
  Time: 8:42
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
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <div class="account-right">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入真实姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">申请金额</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入申请金额" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">借款类型</label>
                <div class="layui-input-block">
                    <select name="interest" lay-filter="jkqx">
                        <option value=""></option>
                        <option value="1">个人</option>
                        <option value="2">企业</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">标种</label>
                <div class="layui-input-block">
                    <select name="interest" lay-filter="jkqx">
                        <option value=""></option>
                        <option value="1">普金宝</option>
                        <option value="2" selected="">恒金宝</option>
                        <option value="3">多金宝</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">借款期限</label>
                <div class="layui-input-block">
                    <select name="interest" lay-filter="jkqx">
                        <option value=""></option>
                        <option value="3">3个月</option>
                        <option value="6" selected="">6个月</option>
                        <option value="12">12个月</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">截止时间</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="deadline" placeholder="yyyy-MM-dd">
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<!-- 客服QQ -->
<script type="text/javascript" src="<%=path %>/static/js/front/account.js"></script>
<script>
    $('.sidebar-top').click(function(){
        $('body').scrollTop(0);
    });
    var nowDate = new Date();
    //    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    var year = nowDate.getFullYear();
    var month = nowDate.getMonth()+1;
    var day = nowDate.getDate();
    var monthValue = 3;
    if(monthValue + month > 12) {
        year += 1;
        month = monthValue + month - 12;
    }
    layui.use(['form', 'laydate'], function() {
        var laydate = layui.laydate;
        var form = layui.form;
        var $ = layui.jquery, layer = layui.layer;
        laydate.render({
            elem: '#deadline'
            ,value: year + '-' + month + '-' + day
        });
    });
</script>
</html>
