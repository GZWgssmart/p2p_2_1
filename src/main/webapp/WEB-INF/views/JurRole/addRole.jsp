<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2018/1/5
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>添加角色</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addRole" class="layui-form layui-col-xs6">
                <div class="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <input type="text" id="rname" name="rname" lay-verify="required" placeholder="请输入角色名称"
                               class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">角色内容</label>
                    <div class="layui-input-block">
                        <input type="text" id="content" name="content" lay-verify="required" placeholder="请输入角色内容"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">选择权限</label>
                    <div class="layui-input-block">
                        <select name="jid" id="type">
                            <script id="demo" type="text/html">
                                {{#  layui.each(d, function(index, jur){ }}
                                <option value="{{ jur.jid }}">{{ jur.content }}</option>
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

        // 获取类别
        var getTpl = demo.innerHTML
            , view = document.getElementById('type');
        $.get('<%=path %>/data/Jur/listAll', function (data) {
            laytpl(getTpl).render(data, function (html) {
                view.innerHTML = html;
            });
            form.render('select');
        });

        //添加角色
        form.on('submit(add)', function (data) {
            $.post('<%=path %>/data/Role/save',
                {
                    rname:$('#rname').val()
                    ,content:$('#content').val()
                    ,jid:$('#type').val()
                },
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
            return false;
        });
    });
</script>
</body>
</html>
