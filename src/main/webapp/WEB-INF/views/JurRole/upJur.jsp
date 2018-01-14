<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2018/1/11
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>修改权限</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12" id="view" style="margin-right: 60px;">
            <form id="editJur" class="layui-form" action="">
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="hidden" name="jid" id="jid" lay-verify autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">权限url</label>
                    <div class="layui-input-block">
                        <input type="text" name="jurl" id="jurl" lay-verify="jurl" autocomplete="off"
                               class="layui-input"/>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">权限描述</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="content" id="content" lay-verify="content"></textarea>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn"  lay-submit lay-filter="up">修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    //获取url上的值,获取页面传过来的值
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }
    var jurId = GetQueryString("jurId");
    layui.use(['form', 'laytpl', 'layedit'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;

        $.get('<%=path %>/data/Jur/jurDetail?jurId=' + jurId,
            function (data) {
                $('#jid').val(data.jid);
                $('#jurl').val(data.jurl);
                $('#content').val(data.content);
            });
        form.verify({
            jurl: function(value){
                if(value.length < 1){
                    return '需要填写URL';
                }
            },content: function(value){
                if(value.length < 1){
                    return '需要填写内容';
                }
            }
        });
        //修改权限
        form.on('submit(up)', function (data) {
            $.post('<%=path %>/data/Jur/update',
                $('#editJur').serialize(),
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
