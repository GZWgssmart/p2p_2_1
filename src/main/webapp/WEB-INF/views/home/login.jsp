<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/12
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>登录</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="<%=path %>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/home/login.css" media="all"/>
</head>
<body class="beg-login-bg">
<%--<div class="nav-out">--%>
    <%--<div class="wrap cl">--%>
        <%--<p class="index"><a href="<%=path %>/" class="icon icon-home">普金资本首页</a></p>--%>
    <%--</div>--%>
<%--</div>--%>
<div class="beg-login-box">
    <header>
        <h1>后台登录</h1>
    </header>
    <div class="beg-login-main">
        <form id="loginFrom" class="layui-form">
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input type="text" name="phone" lay-verify="required" autocomplete="off" placeholder="手机号（必填）" maxlength="11" class="layui-input">
            </div>

            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" name="pwd" lay-verify="pass" placeholder="请输入密码（必填）" autocomplete="off" class="layui-input">
            </div>

            <div class="layui-form-item">
                <div class="beg-pull-left beg-login-remember">
                    <button class="layui-btn" lay-submit lay-filter="login">登录</button>
                </div>
                <div class="beg-pull-right">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
                <div class="beg-clear"></div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;

        //自定义验证规则
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

        //监听提交
        form.on('submit(login)', function (data) {
            layer.load(0, {shade: false});
            $.post('<%=path %>/data/admin/login',
                data.field,
                function (res) {
                    if (res.code === 0) {
                        window.location.href = "<%=path %>/page/home/homePage";
                    } else {
                        layer.msg("手机号或者密码错误！");
                        layer.close(layer.load());
                    }
                }, 'json'
            );
            return false;
        });

    });
</script>
</body>
</html>
