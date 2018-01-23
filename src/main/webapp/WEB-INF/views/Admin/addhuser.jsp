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
            <form id="addAdmin" class="layui-form layui-col-xs8">
                <div class="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" id="phone" name="phone" lay-verify="required" placeholder="请输入手机号"
                               maxlength="11" class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <input type="text" id="rname" name="rname" lay-verify="required" placeholder="请输入真实姓名"
                               class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-block">
                        <input type="text" id="huname" name="huname" lay-verify="required" placeholder="请输入真实姓名"
                               class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" id="email" name="email" lay-verify="required|email" placeholder="请输入邮箱"
                               class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="pwd" name="pwd" lay-verify="pass" placeholder="请输入密码"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">选择角色</label>
                    <div class="layui-input-block">
                        <select name="rid" id="type">
                            <script id="demo" type="text/html">
                                {{#  layui.each(d, function(index, role){ }}
                                <option value="{{ role.rid }}">{{ role.content }}</option>
                                {{#  }); }}
                            </script>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 10px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="add">添加</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script>
    layui.use(['form', 'laytpl'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var laytpl = layui.laytpl;

        //自定义验证规则
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

        // 获取类别
        var getTpl = demo.innerHTML
            , view = document.getElementById('type');
        $.get('<%=path %>/data/Role/listAll', function (data) {
            laytpl(getTpl).render(data, function (html) {
                view.innerHTML = html;
            });
            form.render('select');
        });

        //添加后台用户
        form.on('submit(add)', function (data) {
            $.post('<%=path %>/data/admin/phone',
                {phone: data.field.phone},
                function (phone) {
                    if (phone.code == 0) {
                        layer.msg('手机号已存在', {icon: 5})
                    } else {
                        $.post('<%=path %>/data/admin/addhuser',
                            $('#addAdmin').serialize(),
                            function (res) {
                                if (res.code === 0) {
                                    layer.msg('提交成功', {
                                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                    }, function () {
                                        location.reload(true);
                                    });
                                } else {
                                    layer.msg('提交失败，请重新再试！');
                                }
                            }, 'json'
                        );
                    }
                }, 'json'
            );

            return false;
        });

    });
</script>
</body>
</html>
