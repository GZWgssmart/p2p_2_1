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
    <title>添加权限</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addJur" class="layui-form layui-col-xs6">
                <div class="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">权限URL</label>
                    <div class="layui-input-block">
                        <input type="text" id="jurl" name="jurl" lay-verify="required" placeholder="请输入权限URL"
                               class="layui-input">
                    </div>
                </div>
                <div lass="layui-form-item" style="margin-top: 10px;">
                    <label class="layui-form-label">权限内容</label>
                    <div class="layui-input-block">
                        <input type="text" id="content" name="content" lay-verify="required" placeholder="请输入权限内容"
                               class="layui-input">
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

        //添加权限
        form.on('submit(add)', function (data) {
            $.post('<%=path %>/data/Jur/save',
                {
                    jurl:$('#jurl').val()
                    ,content:$('#content').val()
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
