<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2018/1/5
  Time: 14:44
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
    <title>站内信详情</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12" id="view">
            <form id="letterDetail" class="layui-form" action="">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="hidden" name="lid" id="lid" lay-verify autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">标题：</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" id="title" lay-verify="title" autocomplete="off"
                               class="layui-input" lay-verify="title" style="border:none" readonly/>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">内容：</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="content" id="content" lay-verify="content" style="display: none;" readonly></textarea>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">创建时间：</label>
                    <div class="layui-input-block">
                        <input type="datetime" class="layui-input" name="createdTime" id="createdTime" autocomplete="off" style="border:none" readonly/>
                    </div>
                </div>


                <div class="layui-form-item" style="margin-top: 40px;">
                    <label class="layui-form-label">状态：</label>
                    <div class="layui-input-block">
                        <input type="text" name="status" id="status" lay-verify="status" autocomplete="off"
                               class="layui-input" lay-verify="status" style="border:none" readonly/>
                    </div>
                </div>
            </form>
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
                if(data.status==1){
                    $('#status').val("激活");
                }else{
                    $('#status').val("冻结");
                }
                if(data.createdTime) {
                    $('#createdTime').val(formatDate(data.createdTime));
                }
                layedit.setContent(editIndex,data.content);

            });

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


    });

</script>
</body>
</html>

