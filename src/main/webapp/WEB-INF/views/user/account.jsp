<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/25
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>前台用户中心模板</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>
    <%--信息披露里的左侧边栏--%>
    <%--<%@include file="../master/aboutLeft.jsp"%>--%>
    <div class="account-right">
        <%-- 在此处写用户后台模块代码--%>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">用户总览</li>
                <li>用户信息</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <!-- 用户总览-->
                <div class="layui-tab-item layui-show layui-row">
                    <div class="layui-col-md12" style="padding-top: 50px;">
                        <div class="layui-col-md5">
                            <div class="center-header">
                                <img src="<%=path %>/${user.face}" id="face" width="120" height="120">
                            </div>
                            <div class="center-self">
                                <p class="name">${user.phone}</p>
                                <p class="safety">安全等级： <span id="safeLevel">低</span></p>
                                <p class="center-icon">
                                    <a href="#" class="icon icon-c-phone"></a>
                                    <a href="#" class="icon icon-c-mail"></a>
                                </p>
                                <p id="registpay"><a href="javascript:;">注册汇付</a></p>
                                <p id="reset"></p>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <p class="amt color"><span id="usableSum" style="font-size: 36px;">0.00</span>元</p>
                            <p class="text"><i></i>可用余额</p>
                            <p class="link">
                                <a href="#" class="active">充值</a>
                                <a href="#">提现</a>
                            </p>
                        </div>
                        <div class="layui-col-md4">
                            <p class="amt"><span id="earnSum" style="font-size: 36px;">0.00</span>元</p>
                            <p class="text">收益总额</p>
                            <p class="icon-quan" style="padding-top: 30px;">代金券 <b id="voucher" style="color: red">0</b>
                                张，现金券 <b id="cashMap" style="color: dodgerblue">0</b> 张</p>
                        </div>
                        <div class="layui-col-md5">
                            <div class="canvas">
                                <div class="center-total">
                                    <p id="allTotal">0.00</p>
                                    <p class="text">总资产</p>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md7">
                            <div class="center-data">
                                <p><i class="color color1"></i>投资总额：<span id="investSum">0.00</span></p>

                                <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">0.00</span></p>

                                <p><i class="color color3"></i>待收总额：<span id="forPaySum">0.00</span></p>

                                <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">0.00</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 用户信息-->
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <form id="addArticleForm" class="layui-form" lay-filter="shuaxin">
                                <div class="layui-form-item">
                                    <div class="layui-upload">
                                        <label class="layui-label hidden" style="float: left;display: block;padding: 9px 15px;width: 80px;
                                font-weight: 400;text-align: right;">
                                            <button type="button" class="layui-btn" id="test0">修改头像</button>
                                        </label>
                                        <div class="layui-upload-list">
                                            <img class="layui-upload-img" src="<%=path %>/${user.face}"
                                                 id="demo1" width="120" height="120"/>
                                            <p id="demoText"></p>
                                        </div>
                                    </div>
                                    <input type="hidden" name="face" id="firstImg"/>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">昵称</label>
                                    <div class="layui-input-block" style="width: 250px">
                                        <input type="text" name="uname" lay-verify autocomplete="off"
                                               value="${user.uname }" class="layui-input" id="uname">
                                    </div>
                                </div>
                                <input type="hidden" name="uid" value="${user.uid}"/>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="hidden" name="sex" value=0 checked/>
                                        <input type="radio" name="sex" value=1 title="男"/>
                                        <input type="radio" name="sex" value=2 title="女"/>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="edit">修改信息</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    $("input[name='sex'][value=${user.sex}]").attr("checked",true);
    $('.sidebar-top').click(function () {
        $('body').scrollTop(0);
    });
    layui.use(['element', 'table', 'form', 'upload'], function () {
        var $ = layui.jquery
            , element = layui.element
            , table = layui.table
            , form = layui.form
            , upload = layui.upload;

        //上传封面图
        var uploadInst = upload.render({
            elem: '#test0'
            , url: '<%=path %>/file/firist'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res > 0) {
                    return layer.msg('失败！');
                } else {
                    return $('#firstImg').val(res.msg);
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        //修改信息
        form.on('submit(edit)', function (data) {
            $.post('<%=path %>/data/user/edit',
                data.field,
                function (data) {
                    if (data.code === 0) {
                        layer.msg('修改成功！');
                        $('#face').empty();
                        $('#face').attr('src','/' + data.data.face);
                    } else {
                        layer.msg("修改失败，请重新再试")
                    }
                }, 'json'
            );
            return false;
        });

    });
</script>
</html>



