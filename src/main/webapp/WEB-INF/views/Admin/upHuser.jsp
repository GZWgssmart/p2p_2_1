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
    <title>修改后台用户</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12" id="view" style="margin-right: 60px;">
            <form id="editHuser" class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="hidden" name="huid" id="huid" lay-verify autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <input type="text" name="rname" id="rname" lay-verify="rname" autocomplete="off"
                               class="layui-input"/>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="phone" id="phone" lay-verify="phone"
                               autocomplete="off"/>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="huname" id="huname" lay-verify="huname" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="email" id="email" lay-verify="email"
                               autocomplete="off"/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn"  lay-submit lay-filter="up">修改</button>
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
    var huid = GetQueryString("huid");
    layui.use(['form', 'laytpl', 'layedit'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;

        $.get('<%=path %>/data/admin/HuserDetail?huid=' + huid,
            function (data) {
                $('#huid').val(data.huid);
                $('#rname').val(data.rname);
                $('#phone').val(data.phone);
                $('#huname').val(data.huname);
                $('#email').val(data.email);
                $('#radio').val(data.radio);
                $('#radio1').val(data.radio);
            });
        form.verify({
            rname: function(value){
                if(value.length < 1){
                    return '需要填写昵称';
                }
            },phone: function(value){
                if(value.length < 1){
                    return '需要填写手机号码';
                }
            },huname: function(value){
                if(value.length < 1){
                    return '需要填写真实姓名';
                }
            },email: function(value){
                if(value.length < 1){
                    return '需要填写邮箱';
                }
            }
        });
        //修改权限
        form.on('submit(up)', function (data) {
            $.post('<%=path %>/data/admin/update',
                $('#editHuser').serialize(),
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
