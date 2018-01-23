<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2017/12/26
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
        <title>实时数据</title>
        <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
        <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
        <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl">
    <%--<%@include file="../master/left.jsp" %>--%>
    <%--信息披露里的左侧边栏--%>
    <%@include file="../../master/aboutLeft.jsp" %>
    <div class="account-right">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this">实时数据</li>
                <li>数据报告</li>
            </ul>
            <div class="layui-tab-content" style="height: 60%;">
                <div class="layui-tab-item layui-show layui-row">
                    <div class="about-content" id="sssjDiv" style="display: block;">
                        <script id="demo" type="text/html">
                            <div class="btnDiv">
                                撮合交易总额（元）
                            </div>
                            <div class="moneyDiv" style="text-align:center;">
                                <div class="item_Div" style="padding-top: 20px">{{ d.tmoney }}.00</div>
                            </div>
                            <div class="btnDiv">平台数据总览</div>
                            <div class="sjList sjList-2">
                                <div class="item-yh">
                                    <i class="icon-userTotal"></i>
                                    <div class="itemText">总注册用户数（人）</div>
                                    <div class="itemSJ color-b" id="userTotal">{{ d.tuser }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-investorCount"></i>
                                    <div class="itemText">月注册人数（人）</div>
                                    <div class="itemSJ color-g" id="investorCount">{{ d.muser }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-borrowerCount"></i>
                                    <div class="itemText">总投资人数（人）</div>
                                    <div class="itemSJ color-y" id="borrowerCount">{{ d.ttzno }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-avgUserInvest"></i>
                                    <div class="itemText">月投资人数（人）</div>
                                    <div class="itemSJ color-b" id="avgUserInvest">{{ d.mtzno }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-avgInvest"></i>
                                    <div class="itemText">总贷款人数（人）</div>
                                    <div class="itemSJ color-g" id="avgInvest">{{ d.tdkno }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-investorNew"></i>
                                    <div class="itemText">月贷款人数（人）</div>
                                    <div class="itemSJ color-y" id="investorNew">{{ d.mdkno }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-borrowerNew"></i>
                                    <div class="itemText">总贷款笔数（笔）</div>
                                    <div class="itemSJ color-b" id="borrowerNew">{{ d.tdkbno }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-AssociationNumber"></i>
                                    <div class="itemText">月贷款笔数（笔）</div>
                                    <div class="itemSJ color-g" id="AssociationNumber">{{ d.mdkbno }}</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-AssociationSum"></i>
                                    <div class="itemText">月交易总额（元）</div>
                                    <div class="itemSJ color-y" id="AssociationSum">{{ d.mmoney }}</div>
                                </div>
                            </div>
                        </script>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <a href="http://pujinziben.com/upload/operatereport/front/2018/1/20180103141623751.pdf" target="_blank">
                        <img src="/static/images/ydata/12.jpg" />
                    </a>
                </div>
            </div>
        </div>

    </div>

</div>
<%@include file="../../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element','laytpl'], function () {
        var $ = layui.jquery
        var element = layui.element;
        var laytpl = layui.laytpl;

        var getTpl = demo.innerHTML
            , view = document.getElementById('sssjDiv');
        $.get('/data/ydata/new',
            function (data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
            }
        );

    });
</script>
</body>
</html>
