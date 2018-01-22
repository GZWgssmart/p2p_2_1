<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="layui-tab layui-tab-brief" style="float: left;">
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
                            <c:choose>
                                <c:when test="${user.email != null}">
                                    <li>
                                        <div class="safe-list-1">
                                            <p class="icon icon-true">
                                                邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                                        </div>
                                        <div class="safe-list-2" id="userEmail">${user.email}</div>
                                        <div class="safe-list-3">
                                            <a href="javascript:;" class="email">更改邮箱</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <div class="safe-list-1">
                                            <p class="icon icon-wrong" id="email-icon">
                                                邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                                        </div>
                                        <div class="safe-list-2" id="email-text">获取最新的投资讯息和账户信息变动通知</div>
                                        <div class="safe-list-3">
                                            <a href="javascript:;" class="email">进行绑定</a>
                                        </div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li id="view">
                                <script id="demo" type="text/html">
                                    {{#  if(d.isvip == 0){ }}
                                        <div class="safe-list-1">
                                            <p class="icon icon-wrong" id="realName-icon">身份认证</p>
                                        </div>
                                        <div class="safe-list-2" id="realName-text">一旦实名认证通过将不能修改</div>
                                        <div class="safe-list-3">
                                            <form class="layui-form">
                                                <a href="javascript:;" id="realName" lay-submit lay-filter="real">去认证</a>
                                            </form>
                                        </div>
                                    {{#  } else if(d.isvip == 1) { }}
                                        <div class="safe-list-1">
                                            <p class="icon icon-true">身份认证</p>
                                        </div>
                                        <div class="safe-list-2">{{ d.rname }}&nbsp;{{ d.idno }}</div>
                                    {{#  } else if(d.isvip == 2) { }}
                                        <div class="safe-list-1">
                                            <p class="icon icon-wrong">身份认证</p>
                                        </div>
                                        <div class="safe-list-2">正在审核中......</div>
                                    {{#  } else if(d.isvip == 3) { }}
                                        <div class="safe-list-1">
                                            <p class="icon icon-wrong">身份认证</p>
                                        </div>
                                        <div class="safe-list-2">您的身份认证被驳回！</div>
                                        <div class="safe-list-3">
                                            <a target="_blank" href="tencent://message/?uin=1531952273&amp;Site=&amp;Menu=yes">联系客服</a>
                                        </div>
                                    {{#  } }}
                                </script>
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
                            <li>
                                <div class="safe-list-1">
                                    <p class="icon icon-true">交易密码</p>
                                </div>
                                <div class="safe-list-2">
                                    ******
                                </div>
                                <div class="safe-list-3">
                                    <a href="javascript:;">修改</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 添加邮箱-->
            <div style="display: none;" id="editEmail">
                <div class="popup-from">
                    <form class="layui-form">
                        <div class="label cl layui-form-item">
                            <label>邮箱地址</label><input type="text" name="email" id="addEmail" lay-verify="required|email"
                                                      autocomplete="off" placeholder="输入您的邮箱地址" class="layui-input"
                                                      value="${user.email}"/>
                            <input type="hidden" name="uid" value="${user.uid}"/>
                        </div>
                        <div class="layui-form-item">
                            <button type="button" class="btn layui-btn" lay-submit lay-filter="emailSubmit">添加邮箱
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 修改手机号-->
            <div style="display: none;" id="editPhone">
                <div class="popup-from step2">
                    <div class="label cl layui-form-item">
                        <span>原手机号</span>
                        <span>&nbsp;&nbsp;${user.phone}</span>
                    </div>
                    <form class="layui-form">
                        <div class="label cl">
                            <label>手机号</label>
                            <input type="text" name="phone" id="phone" onblur="chosePhone(this)" maxlength="11"
                                   placeholder="输入您的新手机号码"
                                   class="layui-input" lay-verify="required">
                            <input type="hidden" name="uid" value="${user.uid}"/>
                        </div>
                        <button type="button" class="btn layui-btn" id="button_id" lay-submit lay-filter="phoneSubmit">修改</button>
                    </form>
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
                                   lay-verify="required" autocomplete="off" placeholder="再次输入新密码" class="layui-input"/>
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
                            <label>证件</label>
                            <input type="text" name="idtype" lay-verify="required" class="layui-input"
                                   value="身份证">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>证件号</label><input type="text" name="idno" lay-verify="required" class="layui-input"
                                                     maxlength="18" placeholder="输入证件号">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>真实姓名</label><input type="text" name="rname" lay-verify="required" class="layui-input"
                                                      placeholder="输入真实姓名">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>学历</label><input type="text" name="xl" lay-verify="required" class="layui-input"
                                                    placeholder="输入您的学历">
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
                            <label>毕业院校</label><input type="text" name="bschool" lay-verify="required"
                                                      class="layui-input" placeholder="输入毕业院校">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>居住地</label><input type="text" name="addr" lay-verify="required" class="layui-input"
                                                     placeholder="输入居住地">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>工作</label><input type="text" name="work" lay-verify="required" class="layui-input"
                                                    placeholder="输入工作">
                        </div>
                        <div class="label cl layui-form-item">
                            <label>年龄</label><input type="text" name="age" lay-verify="required|number"
                                                    class="layui-input" placeholder="输入年龄">
                        </div>
                        <input type="hidden" name="uid" value="${user.uid}"/>
                        <input type="hidden" name="isvip" value="2"/>
                        <div class="layui-form-item">
                            <button type="button" class="btn layui-btn" lay-submit lay-filter="typeSubmit">添加认证信息
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    $('.sidebar-top').click(function () {
        $('body').scrollTop(0);
    });
    layui.use(['element', 'layer', 'form','laytpl'], function () {
        var $ = layui.jquery
        var element = layui.element;
        var layer = layui.layer;
        var form = layui.form;
        var laytpl = layui.laytpl;

        var getTpl = demo.innerHTML
            , view = document.getElementById('view');
        $.get('<%=path %>/data/user/getById',{uid:${user.uid}},
            function (data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
            }
        );

        $('.email').on('click', function () {
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

        form.on('submit(real)', function (data) {
            var myIdType = $('#editIdType').html();
            layer.open({
                title: ['认证信息', 'text-align:center;font:26px;'],
                type: 1,
                area: ['600px', '400px'],
                content: myIdType,
            });
            return false;
        });

        //添加邮箱
        form.on('submit(emailSubmit)', function (data) {
            $.post('<%=path %>/data/user/edit',
                data.field,
                function (data) {
                    if (data.code == 0) {
                        layer.closeAll();
                        layer.msg("添加成功");
                        $('#userEmail').empty();
                        $('#userEmail').append(data.data.email);
                        window.href.reload();
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
            if (one != two) {
                layer.msg("密码不一致")
            } else {
                $.post('<%=path %>/data/user/edit',
                    data.field,
                    function (data) {
                        if (data.code == 0) {
                            layer.closeAll();
                            layer.msg("修改成功！")
                        } else {
                            layer.msg("修改失败，请重新再试！")
                        }
                    }, 'json'
                );
            }
            return false;
        });

        // 认证信息
        form.on('submit(typeSubmit)', function (data) {
            $.post('<%=path %>/data/user/saveUserRzvip',
                data.field,
                function (data) {
                    if (data.code == 0) {
                        layer.closeAll();
                        layer.msg("正在审核中，请等待...",{time:1500},function () {
                            window.location.reload(true);
                        });
                    } else {
                        layer.msg("添加失败，请重新再试")
                    }
                }, 'json'
            );
            return false;
        });

        form.on('submit(phoneSubmit)', function (data) {
            $.post('<%=path %>/data/user/edit',
                data.field,
                function (data) {
                    if (data.code == 0) {
                        layer.closeAll();
                        layer.msg("修改成功");
                        parent.location.reload()
                    } else {
                        layer.msg("修改失败，请重新再试")
                    }
                }, 'json'
            );
            return false;
        });
    });
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
            data: {phone: phone},
            dataType: 'json',
            success: function (data) {
                if (data.code == '0') {
                    layer.msg('手机号已经注册!');
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

    function check() {
        alert(1);
    }
</script>
</body>
</html>
