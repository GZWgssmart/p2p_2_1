<%--
  Created by IntelliJ IDEA.
  User: CMY
  Date: 2018/1/3
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>添加还款方式</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addSway" class="layui-form">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">还款方式</label>
                    <div class="layui-input-block">
                        <input type="text" name="way" lay-verify autocomplete="off" placeholder="请输入还款方式"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">还款利率</label>
                    <div class="layui-input-block">
                        <input type="text" name="fw" lay-verify autocomplete="off" placeholder="请输入还款利率"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="status" value="1" title="激活" checked>
                        <input type="radio" name="status" value="0" title="冻结">
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['form', 'laytpl', 'upload','laydate'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var upload = layui.upload;
        var laydate = layui.laydate;
        form.on('submit(add)', function (data) {
            $.post('<%=path %>/data/sway/addSway',
                $('#addSway').serialize(),
                function (res) {
                    if (res.code === 0) {
                        layer.msg('添加成功', {
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            location.reload(true);
                        });
                        layer.closeAll("iframe");
                    } else {
                        layer.msg(res.message);
                    }
                }, 'json'
            );
            return false;
        });
    })
</script>
</body>
</html>
