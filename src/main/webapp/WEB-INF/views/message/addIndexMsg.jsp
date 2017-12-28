<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/13
  Time: 16:53
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
    <title>添加首页信息</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addIndexMsg" class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test1">轮播图一</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="pic1" width="200" height="200">
                            <p id="demoText1"></p>
                        </div>
                    </div>
                    <input type="hidden" name="pic1" id="firstImg1"/>
                </div>
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test2">轮播图二</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="pic2" width="200" height="200">
                            <p id="demoText2"></p>
                        </div>
                    </div>
                    <input type="hidden" name="pic2" id="firstImg2"/>
                </div>
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test3">轮播图三</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="pic3" width="200" height="200">
                            <p id="demoText3"></p>
                        </div>
                    </div>
                    <input type="hidden" name="pic3" id="firstImg3"/>
                </div>
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="testEwm">二维码</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="ewm" width="200" height="200">
                            <p id="ewmText"></p>
                        </div>
                    </div>
                    <input type="hidden" name="ewm" id="firstEwm"/>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="phone" autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">链接1</label>
                    <div class="layui-input-block">
                        <input type="text" name="url1" autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">链接2</label>
                    <div class="layui-input-block">
                        <input type="text" name="url2" autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">链接3</label>
                    <div class="layui-input-block">
                        <input type="text" name="url3"autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
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
    layui.use(['form', 'layedit','laydate', 'upload'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var layedit = layui.layedit;
        var upload = layui.upload;

        //上传轮播图一
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '<%=path %>/file/firist'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#pic1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res > 0) {
                    return layer.msg('失败！');
                } else {
                    return $('#firstImg1').val(res.msg);
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText1');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        //上传轮播图二
        var uploadInst = upload.render({
            elem: '#test2'
            , url: '<%=path %>/file/firist'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#pic2').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res > 0) {
                    return layer.msg('失败！');
                } else {
                    return $('#firstImg2').val(res.msg);
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText2');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        //上传轮播图三
        var uploadInst = upload.render({
            elem: '#test3'
            , url: '<%=path %>/file/firist'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#pic3').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res > 0) {
                    return layer.msg('失败！');
                } else {
                    return $('#firstImg3').val(res.msg);
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText3');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        //上传轮播图三
        var uploadInst = upload.render({
            elem: '#testEwm'
            , url: '<%=path %>/file/firist'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#ewm').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res > 0) {
                    return layer.msg('失败！');
                } else {
                    return $('#firstEwm').val(res.msg);
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#ewmText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        //提交首页信息
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/home/addIndexMsg',
                $('#addIndexMsg').serialize(),
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
