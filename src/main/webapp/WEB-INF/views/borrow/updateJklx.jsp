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
    <title>修改借款类型</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="update" class="layui-form">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="hidden" name="lxid" id="lxid" lay-verify="lxid" autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">借款类型</label>
                    <div class="layui-input-block">
                        <input type="text" name="lxname" id="lxname" lay-verify="lxname" autocomplete="off"
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
                        <button class="layui-btn" lay-submit lay-filter="update">修改提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script src="<%=path %>/static/js/home/public.js"></script>
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
    var leixingId = GetQueryString("leixingId");
    layui.use(['form', 'laytpl', 'layedit'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;

        $.get('<%=path %>/data/jklx/jklxDetail?leixingId=' + leixingId,
            function (data) {
                $('#lxid').val(data.lxid);
                $('#lxname').val(data.lxname);
//                $('#status').val(data.status);
            });
        form.verify({
            bzname: function(value){
                if(value.length < 1){
                    return '需要填写类型';
                }

            }
        });


        //修改媒体报道
        form.on('submit(update)', function (data) {
            $.post('<%=path %>/data/jklx/updateJklx',
                $('#update').serialize(),
                function (res) {
                    if (res.code === 0) {
                        layer.msg('修改成功', {
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
