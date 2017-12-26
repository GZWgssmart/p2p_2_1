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
    <title>安全设置</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/datepicker.css">
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
                    <li class="layui-this">安全中心</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="safe-content" style="width: 900px;">
                            <ul class="safe-list">
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
                                    </div>
                                    <div class="safe-list-2" id="cellPhone-text">${user.phone}</div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="cellPhone" class="on">已绑定</a>
                                        <a href="javascript:;" id="changePhone">修改</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-wrong" id="email-icon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                                    </div>
                                    <div class="safe-list-2" id="email-text">获取最新的投资讯息和账户信息变动通知</div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="email">进行绑定</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-wrong" id="realName-icon">身份认证</p>
                                    </div>
                                    <div class="safe-list-2" id="realName-text">一旦实名认证通过将不能修改</div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="realName">去认证</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true">登录密码</p>
                                    </div>
                                    <div class="safe-list-2">
                                        ******
                                    </div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="password_btn">修改</a>
                                    </div>
                                </li>
                                <!-- <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true">交易密码</p>
                                    </div>
                                    <div class="safe-list-2">
                                        ******
                                    </div>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>

                <div style="display: none;" id="editEmail">
                    <div class="popup-from">
                        <div class="label cl">
                            <label>添加邮箱</label><input type="text" id="addEmail" maxlength="30" placeholder="输入您的邮箱地址">
                        </div>
                        <button type="button" class="btn" id="email-submit">添加邮箱</button>
                    </div>
                </div>
                <div style="display: none;" id="editPhone">
                    <div class="popup-from step1">
                        <div class="label cl">
                            <label>原手机号</label>
                            <p class="text" id="oldPhoneNum"></p>
                        </div>
                        <div class="label label-msg cl">
                            <label>验证码</label>
                            <input type="text" id="oldMobliePhoneCode" maxlength="6" placeholder="输入您短信验证码">
                            <button type="button" id="getMsgCodeOld">获取验证码</button>
                        </div>
                        <button type="button" class="btn" id="phone-submit-one">验证</button>
                    </div>
                    <div class="popup-from step2">
                        <div class="label cl">
                            <label>新手机号</label>
                            <input type="text" id="newMobliePhone" maxlength="11" placeholder="输入您的新手机号码">
                        </div>
                        <div class="label label-msg cl">
                            <label>验证码</label>
                            <input type="text" id="newMobliePhoneCode" maxlength="6" placeholder="输入您短信验证码">
                            <button type="button" id="getMsgCode">获取验证码</button>
                        </div>
                        <button type="button" class="btn" id="phone-submit">修改</button>
                    </div>
                    <div class="popup-result">
                        <div class="success">
                            <p>手机号修改成功，请重新登录！</p>
                            <button type="button" class="btn" id="phone-submit-success">确定</button>
                        </div>
                    </div>
                </div>
                <div style="display: none;" id="editPwd">
                    <div class="popup-from">
                        <div class="label cl">
                            <label>原始密码</label><input type="password" id="oldPassword" maxlength="18" autocomplete="new-password" placeholder="输入原始密码">
                        </div>
                        <div class="label cl">
                            <label>新密码</label><input type="password" id="newPassword" maxlength="18" autocomplete="new-password" placeholder="输入新密码">
                        </div>
                        <div class="label cl">
                            <label>确认密码</label><input type="password" id="confirmPassword" maxlength="18" autocomplete="new-password" placeholder="再次输入新密码">
                        </div>
                        <button type="button" class="btn" id="pwd-submit">确定</button>
                    </div>
                    <div class="popup-result">
                        <div class="success">
                            <p>密码修改成功!</p>
                            <button type="button" class="btn" id="submit-success">确定</button>
                        </div>
                    </div>
                </div>
                <div style="display: none;" id="editIdType">
                    <div class="popup-from">
                        <div class="label cl">
                            <label>选择证件</label><input type="text"  maxlength="18"  placeholder="....">
                        </div>
                        <div class="label cl">
                            <label>证件号</label><input type="text"  maxlength="18" placeholder="输入证件号">
                        </div>
                        <div class="label cl">
                            <label>真实姓名</label><input type="text" placeholder="输入真实姓名">
                        </div>
                        <button type="button" class="btn" id="IdType-submit">确定</button>
                    </div>
                    <div class="popup-result">
                        <div class="success">
                            <p>密码修改成功!</p>
                            <button type="button" class="btn" id="">确定</button>
                        </div>
                    </div>
                </div>

            </div>
    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    $('.sidebar-top').click(function(){
        $('body').scrollTop(0);
    });
    layui.use(['element','layer'], function () {
        var $ = layui.jquery
            , element = layui.element,
        layer = layui.layer;

        $('#email').on('click', function() {
            var myemail = $('#editEmail').html();
            layer.open({
                title: ['绑定邮箱','text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '300px'],
                content: myemail,
            });
        });

        $('#changePhone').on('click', function() {
            var myphone = $('#editPhone').html();
            layer.open({
                title: ['修改手机号','text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myphone,
            });
        });

        $('#password_btn').on('click', function() {
            var myPwd = $('#editPwd').html();
            layer.open({
                title: ['更改密码','text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myPwd,
            });
        });

        $('#realName').on('click', function() {
            var myIdType = $('#editIdType').html();
            layer.open({
                title: ['认证信息','text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myIdType,
            });
        });

    });
</script>
</html>
