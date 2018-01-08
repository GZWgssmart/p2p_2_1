<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/22
  Time: 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path %>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/front/login.css">
</head>
<link rel="icon" href="<%=path %>/static/images/logo_title.jpg" type="image/x-icon"/>
<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.
</div>
<![endif]-->
<!-- top -->
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="/"><img src="<%=path %>/static/images/logo.png" alt="普金资本"></a>
        </div>
        <p class="to-login">已有账号，<a href="<%=path %>/page/login">立即登录</a></p>
    </div>
</div>
<div class="regist-content">
    <div class="regist-exp">
        <p>普金资本理财资金由汇付天下托管</p>
    </div>
    <div class="regist-box">
        <h3>欢迎注册</h3>
        <p class="error-msg icon icon-error"></p>

        <form id="regForm">
            <div class="from">
            <label for="username" class="icon icon-user"></label>
            <input type="text" name="uname" id="username" maxlength="18" placeholder="输入用户名"/>
        </div>
            <div class="from">
                <label for="phone" class="icon icon-mobile"></label>
                <input type="text" name="phone" id="phone" onblur="chosePhone(this)" autocomplete="new-password"
                       maxlength="11" placeholder="输入手机号"/>
            </div>
            <div class="from">
                <label for="upwd" class="icon icon-pwd"></label>
                <input type="password" name="upwd" id="upwd" autocomplete="new-password" placeholder="输入密码"
                       maxlength="18"/>
            </div>
            <div class="from-text">
                <p class="code icon icon-bottom">推荐码(选填)</p>
            </div>
            <div class="from from-ext">
                <label for="useCode" class="icon icon-ext"></label>
                <input type="text" name="tid" id="useCode" placeholder="输入邀请码"/>
            </div>
            <button class="btn" type="button" onclick="regist();">注册</button>
            <div class="agree"><input type="checkbox" id="agree">我已阅读并同意《<a href="javascript:AgreeMent(0);">普金资本服务协议</a>》和《<a
                    href="javascript:AgreeMent(1);">风险提示书</a>》
            </div>
        </form>
    </div>
</div>

<div id="popup-captcha"></div>
<div class="popup AgreeMent">
    <p class="title left">普金资本服务协议</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-area">

    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script>
    var one = window.location.search;
    if(one != null || one != '') {
        one = one.replace("?","");
        $('#useCode').val(one);
        $('.from-ext').attr('class', 'from fadeOutUpBig');
    }
    var isPhoneRegist, isUserRegist;
    $(function () {
        utils.initInput();
        $('.code').one('click', function () {
            $('.from-ext').attr('class', 'from fadeOutUpBig');
        });
    });

    function regist() {
        var phone = $('#phone').val();
        var upwd = $('#upwd').val();
        var useCode = $('#useCode').val();
        if (phone == '') {
            showError('请输入手机号', $('#phone'));
            return;
        }
        ;
        if (utils.isPhone(phone)) {
            showError('请输入正确手机号', $('#phone'));
            return;
        }
        ;
        if (upwd == '') {
            showError('请输入登录密码', $('#upwd'));
            return;
        }
        ;
        if (!$('#agree').is(':checked')) {
            utils.alert('请勾选服务协议');
            return;
        }
        if(useCode != '') {
            $('#useCode').val(useCode - 100000);
        }
        $('.btn').text('注册中...').addClass('disabled');
        utils.ajax({
            url: '<%=path %>/data/user/reg',
            data: $('#regForm').serialize(),
            dataType: 'json',
            success: function (data) {
                if (data.code == '0') {
                    utils.alert('注册成功！', function () {
                        window.location.href = '<%=path %>/page/login';
                    })
                } else {
                    utils.alert('注册失败，请重试！');
                }
                $('.btn').text('注册').removeClass('disabled');
            }
        })

    }
    //验证手机号是否注册
    function chosePhone(obj) {
        isPhoneRegist = false;
        var phone = $(obj).val();
        if (phone == '') {
            showError("请输入手机号码", $(obj));
            return;
        }
        utils.ajax({
            url: '<%=path %>/data/user/regPhone',
            data: $('#phone').serialize(),
            dataType: 'json',
            success: function (data) {
                if (data.code == '0') {
                    utils.toast('手机号已经注册!');
                    isPhoneRegist = true;
                } else {
                    isPhoneRegist = false;
                }
            }
        })
    };
    //错误提示
    function showError(msg, obj) {
        $('.error-msg').text(msg).addClass('show');
        obj.parent('.from').addClass('error');
        obj.focus(function () {
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        });
    }
    //查看平台服务协议
    function AgreeMent(val) {
        var id = '31';
        if (val == 1) {
            id = '12';
            $('.AgreeMent .title').text('风险提示书');
        } else {
            $('.AgreeMent .title').text('普金资本服务协议');
        }
        utils.Dialog(true);
        $('.AgreeMent').fadeIn();
        $('.AgreeMent .close').click(function () {
            $('.AgreeMent').hide();
            utils.Dialog();
        });
        $('.AgreeMent .popup-area').empty();
        var param = {TypeId: id};
        utils.ajax({
            url: 'querytips.do',
            data: JSON.stringify(param),
            dataType: 'json',
            success: function (data) {
                if (data.error == '0') {
                    $('.AgreeMent .popup-area').html(data.content);
                }
            }
        })
    }
</script>
</body>
</html>
