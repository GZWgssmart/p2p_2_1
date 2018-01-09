<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2018/1/5
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>修改站内信</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12" id="view" style="margin-right: 60px;">
            <%-- <script id="demo" type="text/html">--%>
            <form id="editLetter" class="layui-form" action="">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="hidden" name="lid" id="lid" lay-verify autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" id="title" lay-verify="title" autocomplete="off"
                               class="layui-input" lay-verify="title"/>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <input type="text" name="content" id="content" lay-verify="content" autocomplete="off"
                               class="layui-input" lay-verify="content"/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <select name="status" lay-filter="status" lay-verify="status">
                            <option value="">不选择为原始值</option>
                            <option value="1">激活</option>
                            <option value="0">冻结</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn"  lay-submit lay-filter="fabu">修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
            <%--   </script>--%>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/lay/modules/laydate.js"></script>
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
    var letterId = GetQueryString("letterId");
    layui.use(['form', 'laytpl', 'layedit'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;

        $.get('<%=path %>/data/message/letterDetail?letterId=' + letterId,
            function (data) {
                $('#lid').val(data.lid);
                $('#title').val(data.title);
                $('#content').val(data.content);
                $('#status').val(data.status);
            });
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

        /*var getTpl = demo.innerHTML
         , view = document.getElementById('view');*/
        /*  $.get('<path >/data/message/editNotice?nid=' + 1,*/
        /*  function (data) {
         laytpl(getTpl).render(data, function (html) {
         view.innerHTML = html;
         });
         });*/

        //修改媒体报道
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/message/editLetter',
                $('#editLetter').serialize(),
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
