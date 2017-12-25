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
                <li>生利宝</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <!-- 用户总览-->
                <div class="layui-tab-item layui-show layui-row">
                    <div class="layui-col-md12" style="padding-top: 50px;">
                        <div class="layui-col-md5">
                            <div class="center-header">
                                <img src="<%=path %>/static/${user.face}" width="120" height="120">
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
                <!-- 生利宝-->
                <div class="layui-tab-item">
                    <div class="slb-all">
                        <div class="slb-left">
                            <p><span id="slbSum">0.00</span>元</p>
                            <h1>总金额</h1>
                            <a href="javascript:slbaoTrading();">转入/转出</a>
                        </div>
                        <ul class="slb-right">
                            <li>
                                <h2><span id="annuRate">0.000</span>%</h2>
                                <p>最近7日年化收益率</p>
                            </li>
                            <li>
                                <h2><span id="prdRate">0.000</span>%</h2>
                                <p>最新收益率</p>
                            </li>
                            <li>
                                <h2><span id="totalProfit">0.00</span>元</h2>
                                <p>生利宝历史累计收益</p>
                            </li>
                        </ul>
                    </div>
                    <div class="layui-tab layui-tab-brief" lay-filter="zhuanqian" style="float: left;">
                        <ul class="layui-tab-title">
                            <li class="layui-this">转出</li>
                            <li>转入</li>
                            <li>收益</li>
                        </ul>
                        <div class="layui-tab-content" style="height: 100px;">
                            <div class="layui-tab-item layui-show">
                                <table class="layui-table" lay-data="{height:400, url:'#', page:true, id:'zhuanqian', skin: 'row', even: true}">
                                    <thead>
                                    <tr>
                                        <th lay-data="{field:'username', width:200}">日期</th>
                                        <th lay-data="{field:'sex', width:150, sort: true}">金额</th>
                                        <th lay-data="{field:'city', width:150}">生利宝余额</th>
                                        <th lay-data="{field:'sign', width:150}">订单号</th>
                                        <th lay-data="{field:'xinxi', width:150}">信息</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="layui-tab-item">内容2</div>
                            <div class="layui-tab-item">内容3</div>
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
<!-- 客服QQ -->
<script type="text/javascript" src="<%=path %>/static/js/front/account.js"></script>
<script>
    $('.sidebar-top').click(function () {
        $('body').scrollTop(0);
    });
    layui.use(['element','table'], function () {
        var $ = layui.jquery
            , element = layui.element
            ,table = layui.table;



    });
</script>
</html>



