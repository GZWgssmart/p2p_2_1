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
    <title>添加合作商</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addFriend" class="layui-form">
                <div class="layui-form-item" style="margin-top: 20px; width: 500px">
                    <label class="layui-form-label">图片链接</label>
                    <div class="layui-input-block">
                        <input type="text" name="furl" lay-verify autocomplete="off" placeholder="请输入图片的链接"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;padding: 12px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test0">合作商图</button>
                        </label>
                        <div class="layui-upload-list" >
                            <img class="layui-upload-img" id="fpic" width="200" height="200">
                            <p id="demoText"></p>
                        </div>
                    </div>
                    <input type="hidden" name="fpic" id="firstImg"/>
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


        //上传封面图
        var uploadInst = upload.render({
            elem: '#test0'
            , url: '<%=path %>/file/firist'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#fpic').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res > 0) {
                    return layer.msg('失败！');
                } else {
                    return $('#firstImg').val(res.msg);
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        //提交媒体报道
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/message/addFriend',
                $('#addFriend').serialize(),
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
