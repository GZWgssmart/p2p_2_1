<%--
  Created by IntelliJ IDEA.
  User: CMY
  Date: 2018/1/10
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>update短信模板</title>
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
                        <input type="hidden" name="dxid" id="dxid" lay-verify="dxid" autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>



                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">短信内容</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="content"  type="text" name="content" lay-verify="content"  class="layui-textarea"></textarea>
                    </div>
                </div>


                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="update">修改</button>
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
    var dxId = GetQueryString("dxId");
    layui.use(['form', 'laytpl', 'layedit'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;

        $.get('<%=path %>/data/message/dxModelDetail?dxId=' + dxId,
            function (data) {
                $('#dxid').val(data.dxid);
                $('#content').val(data.content);
//                $('#status').val(data.status);
            });
        form.verify({
            content: function(value){
                if(value.length < 1){
                    return '需要填写内容';
                }

            }
        });


        //修改媒体报道
        form.on('submit(update)', function (data) {
            $.post('<%=path %>/data/message/update',
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