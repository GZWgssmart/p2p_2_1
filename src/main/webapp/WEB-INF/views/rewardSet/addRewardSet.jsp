<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2018/1/2
  Time: 20:02
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
    <title>添加公告</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md12">
            <form id="addRewardSet" class="layui-form">

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">最小金额</label>
                    <div class="layui-input-block">
                        <input type="number" name="minmoney" lay-verify="minmoney" autocomplete="off" placeholder="请输入最小金额"
                               class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">最大金额</label>
                    <div class="layui-input-block">
                        <input type="number" name="maxmoney" lay-verify="maxmoney" autocomplete="off" placeholder="请输入最大金额"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">奖励百分比</label>
                    <div class="layui-input-block">
                        <input type="number" name="percent" lay-verify="percent" autocomplete="off" placeholder="请输入奖励百分比"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="fabu">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>

    layui.use(['form', 'laytpl','laydate'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var laydate = layui.laydate;

        form.verify({
            minmoney: function(value){
                if(value.length < 1){
                    return '需要输入最小金额';
                }

            }, maxmoney: function(value){
                if(value.length < 1){
                    return '需要输入最大金额';
                }
            },percent: function(value){
                if(value.length < 1){
                    return '需要选择内容';
                }
            }
        });

        //提交媒体报道
        form.on('submit(fabu)', function (data) {
                $.post('<%=path %>/data/rewardSet/addRewardSet',
                    $('#addRewardSet').serialize(),
                    function (res) {
                        if (res.code === 0) {
                            layer.msg('提交成功', {
                                time: 1000 //1秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                location.reload(true);
                            });
                            layer.close()
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
