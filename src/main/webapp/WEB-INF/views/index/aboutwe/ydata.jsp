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
        <title>公司动态</title>
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
        <div class="about-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="active" id="sssj">实时数据</a>
            </div>
            <em class="em-line" style="left: 0px;"></em>
        </div>
        <div class="about-content" id="sssjDiv" style="display: block;">
            <div class="btnDiv">
                撮合交易总额（元）
            </div>
            <div class="moneyDiv">
                <div class="item_Div">3</div>
                <div class="marginLeft"></div>
                <div class="item_Div">4</div>
                <div class="marginLeft">,</div>
                <div class="item_Div">2</div>
                <div class="marginLeft">
                </div><div class="item_Div">2</div>
                <div class="marginLeft"></div>
                <div class="item_Div">1</div>
                <div class="marginLeft">,</div>
                <div class="item_Div">1</div>
                <div class="marginLeft"></div>
                <div class="item_Div">8</div>
                <div class="marginLeft"></div>
                <div class="item_Div">4</div>
                <div class="marginLeft">.</div>
                <div class="item_Div">0</div>
                <div class="marginLeft"></div>
                <div class="item_Div">0</div>
                <div class="marginLeft"></div>
            </div>
            <div class="btnDiv">平台数据总览</div>
            <div class="sjList sjList-1">
                <div class="item">
                    <div class="item-icon icon-dealNumber"></div>
                    <div class="itemText">交易笔数（笔）</div>
                    <div class="itemSJ" id="dealNumber">1,947</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-repayAmount"></div>
                    <div class="itemText">已还本金（元）</div>
                    <div class="itemSJ" id="repayAmount">22,401,677.26</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-unRepayAmount"></div>
                    <div class="itemText">待还本金（元）</div>
                    <div class="itemSJ" id="unRepayAmount">11,370,632.00</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-unRepayNumber"></div>
                    <div class="itemText">待还笔数（笔）</div>
                    <div class="itemSJ" id="unRepayNumber">27</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-hasInteres"></div>
                    <div class="itemText">为用户创造的收益（元）</div>
                    <div class="itemSJ" id="hasInterest">621,769.00</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-compensatoryMoney"></div>
                    <div class="itemText">累计代偿金额（元）</div>
                    <div class="itemSJ" id="compensatoryMoney">0.00</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-compensatoryNumber"></div>
                    <div class="itemText">累计代偿笔数（笔）</div>
                    <div class="itemSJ" id="compensatoryNumber">0</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-overdueMoney"></div>
                    <div class="itemText">逾期金额（元）</div>
                    <div class="itemSJ" id="overdueMoney">12.26</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-overdueNumber"></div>
                    <div class="itemText">逾期笔数（笔）</div>
                    <div class="itemSJ" id="overdueNumber">3</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-overtimeNumber"></div>
                    <div class="itemText">逾期90天以上笔数（笔）</div>
                    <div class="itemSJ" id="overtimeNumber">0</div>
                </div>
                <div class="item">
                    <div class="item-icon icon-overtimeMoney"></div>
                    <div class="itemText">逾期90天以上金额（元）</div>
                    <div class="itemSJ" id="overtimeMoney">0.00</div>
                </div>
            </div>
            <div class="btnDiv btnDiv-P">平台用户数据</div>
            <div class="sjList sjList-2">
                <div class="item-yh">
                    <i class="icon-userTotal"></i>
                    <div class="itemText">注册用户数（人）</div>
                    <div class="itemSJ color-b" id="userTotal">11,224</div>
                </div>
                <div class="item-yh">
                    <i class="icon-investorCount"></i>
                    <div class="itemText">累计出借人数量（人）</div>
                    <div class="itemSJ color-g" id="investorCount">439</div>
                </div>
                <div class="item-yh">
                    <i class="icon-borrowerCount"></i>
                    <div class="itemText">累计借款人数量（人）</div>
                    <div class="itemSJ color-y" id="borrowerCount">35</div>
                </div>
                <div class="item-yh">
                    <i class="icon-avgUserInvest"></i>
                    <div class="itemText">人均累计投资金额（元）</div>
                    <div class="itemSJ color-b" id="avgUserInvest">77,952.58</div>
                </div>
                <div class="item-yh">
                    <i class="icon-avgInvest"></i>
                    <div class="itemText">笔均投资额（元）</div>
                    <div class="itemSJ color-g" id="avgInvest">17,576.37</div>
                </div>
                <div class="item-yh">
                    <i class="icon-investorNew"></i>
                    <div class="itemText">当期出借人数量（人）</div>
                    <div class="itemSJ color-y" id="investorNew">140</div>
                </div>
                <div class="item-yh">
                    <i class="icon-borrowerNew"></i>
                    <div class="itemText">当期借款人数量（人）</div>
                    <div class="itemSJ color-b" id="borrowerNew">20</div>
                </div>
                <div class="item-yh">
                    <i class="icon-AssociationNumber"></i>
                    <div class="itemText">关联关系借款笔数（笔）</div>
                    <div class="itemSJ color-g" id="AssociationNumber">0</div>
                </div>
                <div class="item-yh">
                    <i class="icon-AssociationSum"></i>
                    <div class="itemText">关联关系借款余额（元）</div>
                    <div class="itemSJ color-y" id="AssociationSum">0.00</div>
                </div>
                <div class="item-yh">
                    <i class="icon-borrowerPer"></i>
                    <div class="itemText">前十大借款代还金额占比（%）</div>
                    <div class="itemSJ color-b" id="borrowerPer">41.96</div>
                </div>
                <div class="item-yh">
                    <i class="icon-bigBorrowerPer"></i>
                    <div class="itemText">最大借款代还金额占比（%）</div>
                    <div class="itemSJ color-g" id="bigBorrowerPer">7.00</div>
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
    layui.use(['element'], function () {
        var $ = layui.jquery
            ,element = layui.element;
    });
</script>
</body>
</html>
