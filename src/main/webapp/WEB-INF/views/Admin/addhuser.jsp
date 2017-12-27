<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2017/12/27
  Time: 8:51
  To  this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>添加后台用户</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addAdmin" class="layui-form layui-col-xs6">
                <div class="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">请输手机号</label>
                    <div class="layui-input-block">
                        <input type="text" id="phone" name="phone" lay-verify="required" class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">请输入昵称</label>
                    <div class="layui-input-block">
                        <input type="text" id="rname" name="rname" lay-verify="required" class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">请输入密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="pwd" name="resstr1" lay-verify="pass" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选择角色</label>
                    <div class="layui-input-block">
                        <select name="interest" lay-filter="aihao">
                            <option value=""></option>
                            <option value="0">写作</option>
                            <option value="1" selected="">阅读</option>
                            <option value="2">游戏</option>
                            <option value="3">音乐</option>
                            <option value="4">旅行</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 10px;">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal">添加</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"src="<%=path%>/static/layui/layui.js"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        //自定义验证规则
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

    });
</script>
</body>
</html>
