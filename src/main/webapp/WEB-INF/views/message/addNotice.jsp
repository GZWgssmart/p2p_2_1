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


                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">公告内容</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content"
                         id="content"></textarea>
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="addNoticeTime" id="addNoticeTime" lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
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

    layui.use(['form', 'laytpl', 'layedit','laydate'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;
        var laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('content', {
            tool: [
                'strong' //加粗
                , 'left' //左对齐
                , 'center' //居中对齐
                , 'link' //超链接
                , 'unlink' //清除链接
                , 'face' //表情
                , 'image' //插入图片
            ]
        });

        form.verify({
            title: function(value){
                if(value.length < 1){
                    return '需要填写标题';
                }
            }
        });

        laydate.render({
            elem: '#addNoticeTime' //指定元素
            ,type: 'datetime'
        });

        //提交媒体报道
        form.on('submit(fabu)', function (data) {
            $('#content').val(layedit.getContent(editIndex));
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
