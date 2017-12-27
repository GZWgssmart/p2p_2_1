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
                                    <p class="icon icon-true" id="cellPhone-icon">
                                        手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
                                </div>
                                <div class="safe-list-2" id="cellPhone-text">${user.phone}</div>
                                <div class="safe-list-3">
                                    <a href="javascript:;" id="cellPhone" class="on">已绑定</a>
                                    <a href="javascript:;" id="changePhone">修改</a>
                                </div>
                            </li>
                            <li>
                                <div class="safe-list-1">
                                    <p class="icon icon-wrong" id="email-icon">
                                        邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
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
            <!-- 添加邮箱-->
            <div style="display: none;" id="editEmail">
                <div class="popup-from">
                    <form class="layui-form">
                        <div class="label cl layui-form-item">
                            <label>添加邮箱</label><input type="text" name="email" id="addEmail" lay-verify="required|email" autocomplete="off" placeholder="输入您的邮箱地址" class="layui-input"/>
                            <input type="hidden" name="uid" value="${user.uid}"/>
                        </div>
                    <div class="layui-form-item">
                        <button type="button" class="btn layui-btn" lay-submit lay-filter="emailSubmit">添加邮箱</button>
                    </div>
                    </form>
                </div>
            </div>
            <!-- 修改手机号-->
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
            <!-- 修改密码-->
            <div style="display: none;" id="editPwd">
                <div class="popup-from">
                    <form class="layui-form">
                        <div class="label cl layui-form-item">
                            <label>原始密码</label>
                            <input type="password" id="oldPassword" lay-verify="required" autocomplete="off"
                                                      maxlength="18" placeholder="输入原始密码" class="layui-input"/>
                        </div>
                        <div class="label cl">
                            <label>新密码</label>
                            <input type="password" name="newpwd" maxlength="18"
                                   lay-verify="required" autocomplete="off" placeholder="输入新密码" class="layui-input"/>
                        </div>
                        <div class="label cl">
                            <label>确认密码</label>
                            <input type="password" name="upwd" maxlength="18"
                                   lay-verify="required" autocomplete="off" placeholder="再次输入新密码" class="layui-input" />
                            <input type="hidden" name="uid" value="${user.uid}"/>
                        </div>
                        <div class="layui-form-item">
                            <button type="button" class="btn layui-btn" lay-submit lay-filter="upwdSubmit">修改密码</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 审核 -->
            <div style="display: none;" id="editIdType">
                <div class="popup-from">
                    <form class="layui-form">
                        <div class="label cl layui-form-item">
                            <label>选择证件</label>
                                <select name="idtype">
                                    <option></option>
                                    <option value="身份证">身份证</option>
                                    <option value="驾照">驾照</option>
                                </select>
                        </div>
                        <div class="label cl layui-form-item">
                            <label>证件号</label><input type="text" name="idno" lay-verify="required" class="layui-input" maxlength="18" placeholder="输入证件号">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>真实姓名</label><input type="text" name="rname" lay-verify="required" class="layui-input" placeholder="输入真实姓名">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>学历</label><input type="text" name="xl" lay-verify="required" class="layui-input" placeholder="输入您的学历">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>婚否</label>
                            <div class="layui-input-block">
                                <input type="radio" name="ism" value="未婚" title="未婚" checked="">
                                <input type="radio" name="ism" value="已婚" title="已婚">
                                <input type="radio" name="ism" value="保密" title="保密">
                            </div>
                        </div>
                        <div class="label cl layui-form-item">
                            <label>毕业院校</label><input type="text" name="bschool" lay-verify="required" class="layui-input" placeholder="输入毕业院校">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>居住地</label><input type="text" name="addr" lay-verify="required" class="layui-input" placeholder="输入居住地">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>工作</label><input type="text" name="work" lay-verify="required" class="layui-input" placeholder="输入工作">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>年龄</label><input type="text" name="age" lay-verify="required|number" class="layui-input" placeholder="输入年龄">
                        </div>
                        <input type="hidden" name="uid" value="${user.uid}"/>
                        <div class="layui-form-item">
                            <button type="button" class="btn layui-btn" lay-submit lay-filter="typeSubmit">添加认证信息</button>
                        </div>
                    </form>
                </div>
                <div class="popup-result">
                    <div class="success">
                        <p>请等待审核!</p>
                        <button type="button" class="btn" id="">确定</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>

<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    $('.sidebar-top').click(function () {
        $('body').scrollTop(0);
    });
    layui.use(['element', 'layer', 'form'], function () {
        var $ = layui.jquery
        var element = layui.element;
        var layer = layui.layer;
        var form = layui.form;

        $('#email').on('click', function () {
            var myemail = $('#editEmail').html();
            layer.open({
                title: ['绑定邮箱', 'text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '300px'],
                content: myemail,
            });
        });

        $('#changePhone').on('click', function () {
            var myphone = $('#editPhone').html();
            layer.open({
                title: ['修改手机号', 'text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myphone,
            });
        });

        $('#password_btn').on('click', function () {
            var myPwd = $('#editPwd').html();
            layer.open({
                title: ['更改密码', 'text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myPwd,
            });
        });

        $('#realName').on('click', function () {
            var myIdType = $('#editIdType').html();
            layer.open({
                title: ['认证信息', 'text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myIdType,
            });
        });

        //添加邮箱
        form.on('submit(emailSubmit)', function (data) {
            $.post('<%=path %>/data/user/edit',
                data.field,
                function (data) {
                    if (data.code == 0) {
                        layer.closeAll();
                        layer.msg("添加成功");
                    } else {
                        layer.msg("添加失败，请重新再试")
                    }
                }, 'json'
            );
            return false;
        });

        // 修改密码
        form.on('submit(upwdSubmit)', function (data) {
            var one = data.field.newpwd;
            var two = data.field.upwd;
            if(one != two) {
                layer.msg("密码不一致")
            }
            $.post('<%=path %>/data/user/edit',
                data.field,
                function (data) {
                    if (data.code == 0) {
                        layer.closeAll();
                        layer.alert('这里写内容',{
                            title: ' ',
                            btnAlign:'c'
                        });
                    } else {
                        layer.msg("修改失败，请重新再试！")
                    }
                }, 'json'
            );
            return false;
        });

        // 认证信息
        form.on('submit(typeSubmit)', function (data) {
            $.post('<%=path %>/data/user/saveUserRzvip',
                data.field,
                function (data) {
                    if (data.code == 0) {
                        layer.closeAll();
                        layer.msg("正在审核中，请等待...");
                    } else {
                        layer.msg("添加失败，请重新再试")
                    }
                }, 'json'
            );
            return false;
        });

    });
</script>
</body>
</html>