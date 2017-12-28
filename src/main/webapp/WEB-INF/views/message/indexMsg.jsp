<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2017/12/22
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>首页信息</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body style="padding-top: 20px">

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="edit"  lay-submit lay-filter="edit">编辑报道</button>
    <button class="layui-btn" data-type="refresh">刷新</button>
</div>

<table id="allIndex_msg" lay-filter="demo"></table>

<script type="text/html" id="imgUtil1">
    {{#  if(d.pic1 !== null && d.pic1 != ''){ }}
    <img src="<%=path %>/{{ d.pic1 }}" alt="d.pic1" />
    {{#  } else { }}
    <span>没有轮播图</span>
    {{#  } }}
</script>
<script type="text/html" id="imgUtil2">
    {{#  if(d.pic2 !== null && d.pic2 != ''){ }}
    <img src="<%=path %>/{{ d.pic2 }}" alt="d.pic2" />
    {{#  } else { }}
    <span>没有轮播图</span>
    {{#  } }}
</script>
<script type="text/html" id="imgUtil3">
    {{#  if(d.pic3 !== null && d.pic3 != ''){ }}
    <img src="<%=path %>/{{ d.pic3 }}" alt="d.pic3" />
    {{#  } else { }}
    <span>没有轮播图</span>
    {{#  } }}
</script>
<script type="text/html" id="urlUtil1">
    {{#  if(d.url1 !== null && d.url1 != ''){ }}
    <a target="_blank" href="{{ d.url1 }}">{{ d.url1 }}</a>
    {{#  } else { }}
    <span>没有链接</span>
    {{#  } }}
</script>
<script type="text/html" id="urlUtil2">
    {{#  if(d.url2 !== null && d.url2 != ''){ }}
    <a target="_blank" href="{{ d.url2 }}">{{ d.url2 }}</a>
    {{#  } else { }}
    <span>没有链接</span>
    {{#  } }}
</script>
<script type="text/html" id="urlUtil3">
    {{#  if(d.url3 !== null && d.url3 != ''){ }}
    <a target="_blank" href="{{ d.url3 }}">{{ d.url3 }}</a>
    {{#  } else { }}
    <span>没有链接</span>
    {{#  } }}
</script>
<div class="layui-container"style="display: none">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form  class="layui-form" id="editIndexMsg">
                <div class="layui-form-item">
                    <div class="layui-upload">
                        <label class="layui-label" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                            <button type="button" class="layui-btn" id="test1">轮播图一</button>
                        </label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="pic1" width="200" height="200" name="pic1">
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
                            <img class="layui-upload-img" id="pic2" width="200" height="200" name="pic2">
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
                            <img class="layui-upload-img" id="pic3" width="200" height="200" name="pic2">
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
                            <img class="layui-upload-img" id="ewm" width="200" height="200" name="ewm">
                            <p id="ewmText"></p>
                        </div>
                    </div>
                    <input type="hidden" name="ewm" id="firstEwm"/>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="phone" id="phone" autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">链接1</label>
                    <div class="layui-input-block">
                        <input type="text" name="url1" id="url1" autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">链接2</label>
                    <div class="layui-input-block">
                        <input type="text" name="url2" id="url2" autocomplete="off" placeholder="请输入地址"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">链接3</label>
                    <div class="layui-input-block">
                        <input type="text" name="url3" id="url3" autocomplete="off" placeholder="请输入地址"
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
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table','form', 'layedit', 'upload'], function(){
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var layedit = layui.layedit;
        var upload = layui.upload;

        table.render({
            elem: '#allIndex_msg'
            ,url: '<%=path %>/data/home/indexMsg'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'hid', title:'ID', width:50, fixed: 'left'}
                ,{field:'pic1', title:'轮播图一', width:140, templet: '#imgUtil1'}
                ,{field:'pic2', title:'轮播图二', width:140, templet: '#imgUtil2'}
                ,{field:'pic3', title:'轮播图三', width:140, templet: '#imgUtil3'}
                ,{field:'ewm', title:'二维码', width:120, templet: '#ewm'}
                ,{field:'phone', title:'电话', width:120}
                ,{field:'url1', title:'链接', width:120, templet: '#urlUtil1'}
                ,{field:'url2', title:'链接', width:120, templet: '#urlUtil2'}
                ,{field:'url3', title:'链接', width:120, templet: '#urlUtil3'}
            ]]
            ,id: 'idTest'
            ,page: true
            ,height: 500
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        var active = {
            edit:function () {
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length == 1) {
                    $editIndexMsg=$("#editIndexMsg").html();
                    layer.open({
                        type: 1,                //弹窗类型
                        title: '编辑首页信息',     //显示标题
                        closeBtn: 1,         //是否显示关闭按钮
                        shadeClose: true, //显示模态窗口
                        fixed:false,    //层是否固定在可视区域
                        move: false,//禁止拖拽
                        area: ['890px', '560px'], //宽高
                        content: $editIndexMsg,  //弹窗内容

                    });
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            },
            refresh:function () {
                location.reload(true);
            },
        };
        form.on('submit(edit)', function (data) {
            var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
        $.get('<%=path %>/data/home/getById?hid=' + data[0.].hid,
            function (data) {
                $("#pic1").attr('src',"/"+data.pic1);
                $("#pic2").attr('src',"/"+data.pic2);
                $("#pic3").attr('src',"/"+data.pic3);
                $("#ewm").attr('src',"/"+data.ewm);
                $("#phone").val(data.phone);
                $("#url1").val(data.url1);
                $("#url2").val(data.url2);
                $("#url3").val(data.url3);
            });
            return false;
        });
        //上传轮播图一
        var uploadInst1 = upload.render({
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
                var item = this.item;
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText1');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst1.upload();
                });
            }
        });
        //上传轮播图二
        var uploadInst2 = upload.render({
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
                    uploadInst2.upload();
                });
            }
        });
        //上传轮播图三
        var uploadInst3 = upload.render({
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
                    uploadInst3.upload();
                });
            }
        });
        //上传轮播图三
        var uploadInst4 = upload.render({
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
                    uploadInst4.upload();
                });
            }
        });
        //提交首页信息
        form.on('submit(fabu)', function (data) {
            var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
            $.post('<%=path %>/data/home/editIndexMsg?hid='+data[0].hid,
                $('#editIndexMsg').serialize(),
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

