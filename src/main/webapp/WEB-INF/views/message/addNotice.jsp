<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2017/12/26
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>添加公告</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addNotice" class="layui-form">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">公告标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入公告标题"
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">公告内容</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容"  type="text" name="content" lay-verify="content" placeholder="请输入公告内容" class="layui-textarea"></textarea>
                    </div>
                </div>


                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="fabu">立即提交</button>
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

        form.verify({
            title: function(value){
                if(value.length < 1){
                    return '需要填写标题';
                }
            },content: function(value){
                if(value.length < 1){
                    return '需要填写内容';
                }
            }
        });

        //提交媒体报道
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/message/addNotice',
                $('#addNotice').serialize(),
                function (res) {
                    if (res.code === 0) {
                        layer.msg('提交成功', {
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            location.reload(true);
                        });
                    } else {
                        layer.msg(res.message);
                    }
                }, 'json'
            );
            return false;
        });

    });
</script>
</body>
</html>
