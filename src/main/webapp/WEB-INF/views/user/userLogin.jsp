<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/22
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path %>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/front/login.css">
</head>
<link rel="icon" href="<%=path %>/static/images/logo_title.jpg" type="image/x-icon"/>
<body>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="<%=path %>/"><img src="<%=path %>/static/images/logo.png" alt="普金资本"></a></div>
        <p class="index"><a href="<%=path %>/" class="icon icon-home">普金资本首页</a></p>
    </div>
</div>
<div class="login-content">
    <div class="wrap">
        <div class="login-box">
            <div class="login-top cl">
                <p class="welcome">欢迎登录</p>
                <p>没有账户，<a href="<%=path %>/page/reg">免费注册</a></p>
            </div>
            <p class="error-msg icon icon-error"></p>
            <form id="loginForm">
                <div class="from">
                    <label for="phone" class="icon icon-user"></label>
                    <input type="text" name="phone" id="phone" autocomplete="off" placeholder="输入手机号" maxlength="11" value="${requestScope.phone }"/>
                </div>
                <div class="from">
                    <label for="password" class="icon icon-pwd"></label>
                    <input type="password" name="upwd" id="password" autocomplete="new-password" placeholder="输入登录密码" value="${requestScope.upwd }"/>
                </div>
                <div class="from">
                    <div class="pull-box">
                        <div class="pull-bg" style="width: 0px;"></div>
                        <div class="pull-default">请按住滑块，拖动到最右边</div>
                        <div class="pull-btn"></div>
                    </div>
                </div>
                <div class="">
                    <input type="radio" name="choose" value="0">记住帐号密码
                </div>
                <input class="btn" type="button" value="登录" onclick="submitLogin();"/>
            </form>
        </div>
    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script>
    var pullTest = false;
    utils.initInput();
    //进度登录条
    var X = $('.pull-box').offset().left;
    var Width = $('.pull-box')[0].offsetWidth;
    var bX = -1;
    $('.pull-btn').bind('mousedown', function () {
        $(document).bind('mousemove', function (e) {
            bX = e.pageX - X;
            if (bX < 0) {
                return;
            }
            if ((bX + 45) >= Width) {
                $(document).unbind('mousemove');
                //验证通过
                $('.pull-default').attr('class', 'pull-default-true');
                $('.pull-btn').addClass('pull-btn-true');
                $('.pull-bg').html('验证通过').css('width', Width - 46 + 'px');
                pullTest = true;
                return;
            }
            $('.pull-btn').css('left', bX + 'px');
            $('.pull-bg').css('width', bX + 'px');
        });
    });
    $(document).mouseup(function () {
        $(document).unbind('mousemove');
        if ((bX + 47) >= Width) {
            bX = Width - 47;
            $('.pull-btn').css('left', bX + 'px');
        } else {
            $('.pull-btn').animate({left: "-1px"});
            $('.pull-bg').animate({width: "0px"})
        }
    })
    //登录
    function submitLogin() {
        var phone = $('#phone').val();
        var password = $('#password').val();
        if (phone == '') {
            showError('请输入手机号', $('#phone'));
            return;
        }

        if (password == '') {
            showError('请输入密码', $('#password'));
            return;
        }

        if (!pullTest) {
            utils.toast('请拖动验证码到正确位置');
            return;
        }

        $('.btn').addClass('disabled').text('登录中...').unbind('click');
        $.post('<%=path %>/data/user/login',
            $('#loginForm').serialize(),
            function (data) {
                if (data.code == '0') {
                    window.location.href = '<%=path %>/page/user/account';
                } else {
                    utils.alert('手机号或密码错误！');
                }
                $('.btn').text('登录').removeClass('disabled');
            }, 'json'
        );
    }

    //错误提示
    function showError(msg, obj) {
        $('.error-msg').text(msg).addClass('show');
        obj.parent('.from').addClass('error');
        obj.focus(function () {
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        });
    }
</script>
</body>

</html>
