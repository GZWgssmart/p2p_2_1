<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">

</head>

<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>

    <div class="account-right">
        <div id="myDebitCard" class="account-content">
            <div id="card3" class="bank-card_3" onclick="addBankCard();" style="cursor:pointer;">
                <div class="bank-addCard"><a href="javascript:;">添加银行卡</a></div>
            </div>
        </div>


        <%--<div class="layui-container">--%>
        <%--<div class="layui-row">--%>
        <%--<div class="layui-col-md8">--%>
        <%--<div id="allCards">--%>
        <%--<script type="text/html" id="demo">--%>
        <%--{{#  layui.each(d, function(index, card){ }}--%>
        <%--<div style="border: solid 1px red">--%>
        <%--<p>{{ card.rname }}</p>--%>
        <%--<p>{{ card.type }}</p>--%>
        <%--<p>{{ card.cardno }}</p>--%>
        <%--</div>--%>
        <%--{{# } }}--%>
        <%--</script>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
    </div>
</div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<!-- 客服QQ -->
<script type="text/javascript" src="<%=path %>/static/js/front/account.js"></script>

<script>
    <%-- 跳转到银行卡的添加页面 uid传递过去 --%>
    function addBankCard() {
        window.location.href = "<%=path%>/page/bankCard/addCard"
    }
</script>
<%--<script>--%>
<%--layui.use(['element', 'layer', 'laytpl'], function () {--%>
<%--var $ = layui.$;--%>
<%--var element = layui.element;--%>
<%--var layer = layui.layer;--%>
<%--var laytpl = layui.laytpl;--%>

<%--var getTpl = $('#demo').html()--%>
<%--, view = document.getElementById('allCards');--%>
<%--// 获取数据--%>
<%--$.get('<%=path %>/data/bankCard/allCards?uid='+${user.uid},--%>
<%--function (data) {--%>
<%--fenye(data[0]);--%>
<%--});--%>

<%--// 渲染数据--%>
<%--function fenye(data) {--%>
<%--laytpl(getTpl).render(data, function (html) {--%>
<%--view.innerHTML = html;--%>
<%--});--%>
<%--}--%>

<%--});--%>
<%--</script>--%>

</html>
