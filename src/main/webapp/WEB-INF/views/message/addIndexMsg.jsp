<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>添加首页信息</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addMediaReport" class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test1">轮播图一</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="pic1" width="600" height="200">
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
                            <img class="layui-upload-img" id="pic2" width="600" height="200">
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
                            <img class="layui-upload-img" id="pic3" width="600" height="200">
                            <p id="demoText3"></p>
                        </div>
                    </div>
                    <input type="hidden" name="pic3" id="firstImg3"/>
                </div>
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test4">二维码</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="pic4" width="600" height="200">
                            <p id="demoText4"></p>
                        </div>
                    </div>
                    <input type="hidden" name="ewm" id="firstImg4"/>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="number" autocomplete="off" placeholder="请输入电话"
                               class="layui-input" maxlength="11">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">url1</label>
                    <div class="layui-input-block">
                        <input type="text" name="url1" lay-verify autocomplete="off" placeholder="请输入轮播图一的地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">url2</label>
                    <div class="layui-input-block">
                        <input type="text" name="url2" lay-verify autocomplete="off" placeholder="请输入轮播图二的地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">url3</label>
                    <div class="layui-input-block">
                        <input type="text" name="url3" lay-verify autocomplete="off" placeholder="请输入轮播图三的地址"
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
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/current.js"></script>
<script>
    layui.use(['form', 'upload'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var upload = layui.upload;

        //上传轮播图
        uploadImg(upload, 'test1', '<%=path %>/file/firist', 'pic1', 'firstImg1', 'demoText1');
        uploadImg(upload, 'test2', '<%=path %>/file/firist', 'pic2', 'firstImg2', 'demoText2');
        uploadImg(upload, 'test3', '<%=path %>/file/firist', 'pic3', 'firstImg3', 'demoText3');
        uploadImg(upload, 'test4', '<%=path %>/file/firist', 'pic4', 'firstImg4', 'demoText4');

        //提交信息
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/home/addIndexMsg',
                $('#addMediaReport').serialize(),
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
