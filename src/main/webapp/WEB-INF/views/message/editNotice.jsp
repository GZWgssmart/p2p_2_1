<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2017/12/27
  Time: 11:12
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
    <title>修改公司公告</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>

<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12" id="view" style="margin-right: 60px;">
           <%-- <script id="demo" type="text/html">--%>
                <form id="editNotice" class="layui-form" action="">

                    <div class="layui-form-item" style="margin-top: 20px;">
                        <label class="layui-form-label">公告标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" id="title" lay-verify="title" autocomplete="off"
                                   class="layui-input" lay-verify="title"/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">公告内容</label>
                        <div class="layui-input-block">
                        <textarea class="layui-textarea" name="content" id="content" lay-verify="content"></textarea>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">时间</label>
                        <div class="layui-input-inline">
                            <input type="text" name="editNoticeTime" id="editNoticeTime" lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <div class="layui-input-block">
                            <input type="hidden" name="nid" id="nid" lay-verify autocomplete="off"
                                   class="layui-input" readonly/>
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
    var noticeId = GetQueryString("noticeId");
    layui.use(['form', 'laytpl', 'layedit','laydate'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;
        var laydate = layui.laydate;

       $.get('<%=path %>/data/message/noticeDetail?noticeId=' + noticeId,
            function (data) {
                $('#nid').val(data.nid);
                $('#title').val(data.title);
                $('#editNoticeTime').val(formatDate(data.createdTime));
                layedit.setContent(editIndex,data.content);
       });

        form.verify({
            title: function(value){
                if(value.length < 1){
                    return '需要填写标题';
                }
            }
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

        laydate.render({
            elem: '#editNoticeTime' //指定元素
            , type: 'datetime'
        });

        //修改媒体报道
        form.on('submit(fabu)', function (data) {
            //增加这句话，才可以准确，的获取到，编辑器里的数据。
            $('#content').val(layedit.getContent(editIndex));
            $.post('<%=path %>/data/message/editNotice',
                $('#editNotice').serialize(),
                function (res) {
                    if (res.code === 0) {
                        layer.msg('提交成功', {
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            window.close();
                            parent.location.reload();
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
