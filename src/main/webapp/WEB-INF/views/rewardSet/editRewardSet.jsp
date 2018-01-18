<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2018/1/2
  Time: 20:04
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
    <title>修改投资奖励设置</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12" id="view">
            <%-- <script id="demo" type="text/html">--%>
            <form id="editRewardSet" class="layui-form" action="">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="hidden" name="rwsid" id="rwsid" lay-verify autocomplete="off"
                               class="layui-input" readonly/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">最小金额</label>
                    <div class="layui-input-block">
                        <input type="number" name="minmoney" id="minmoney" lay-verify="minmoney" autocomplete="off"
                               class="layui-input" lay-verify="minmoney"/>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">最大金额</label>
                    <div class="layui-input-block">
                        <input type="number" name="maxmoney" id="maxmoney" lay-verify="maxmoney" autocomplete="off"
                            class="layui-input" lay-verify="minmoney"/>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">奖励百分比</label>
                    <div class="layui-input-block">
                        <input type="number" name="percent" id="percent" lay-verify="percent" autocomplete="off" placeholder="请输入奖励百分比"
                               class="layui-input">
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
    var rewardSetId = GetQueryString("rewardSetId");
    layui.use(['form', 'laytpl', 'layedit'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var layedit = layui.layedit;

        $.get('<%=path %>/data/rewardSet/rewardSetById?rewardSetId=' + rewardSetId,
            function (data) {
                $('#rwsid').val(data.rwsid);
                $('#minmoney').val(data.minmoney);
                $('#maxmoney').val(data.maxmoney);
                $('#percent').val(data.percent);
            });
        form.verify({
            minmoney: function(value){
                if(value.length < 1){
                    return '需要输入最小金额';
                }

            }, maxmoney: function(value){
                if(value.length < 1){
                    return '需要输入最大金额';
                }
            }, percent: function(value){
                if(value.length < 1){
                    return '需要填写内容';
                }
            }
        });
        //修改媒体报道
        form.on('submit(fabu)', function (data) {
            $.post('<%=path %>/data/rewardSet/editRewardSet',
                $('#editRewardSet').serialize(),
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
