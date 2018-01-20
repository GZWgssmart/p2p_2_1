<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>前台用户中心</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/datepicker.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/login.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
    <div class="account cl" style="height: 820px;background-color: white">
        <%@include file="left.jsp" %>
        <div class="account-right">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li class="layui-this">恒金保</li>
                    <li>普金保</li>
                    <li>多金宝</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">
                        <div class="content">
                            <p class="text">
                                以保理公司持有的大型知名企业签发并承兑的商业承兑汇票为还款保障的金融产品，借款到期时，保理公司以承兑企业无条件支付的票面资金用于归还借款本息。
                            </p>
                            <img src="<%=path %>/static/images/help/pujin.png" width="890" class="img">
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="content">
                            <p class="text">
                                基于供应链上下游的采购贸易，为采购方或项目方提供融资，融资方以应收账款质押、保证金担保等形式为借款提供担保。
                            </p>
                            <img src="<%=path %>/static/images/help/pujin.png" width="890" class="img">
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="content" style="width: 890px">
                            <p class="text">
                                企业由于生产经营周转或项目投资需要资金，提供足值的不动产或动产作为抵质押物申请借款。
                            </p>
                            <img src="<%=path %>/static/images/help/duojin.png" width="650" height="450" class="img">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="../../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element'], function () {
        var $ = layui.jquery
            , element = layui.element

    });
</script>
</html>
