<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
    <head>
        <title>公司简介</title>
        <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
        <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
        <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
    </head>
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
                <a href="javascript:void(0);" class="active">公司简介</a>
            </div>
            <em class="em-line"></em>
        </div>
        <div class="about-content">
            <div class="content">
                <p class="text">普金资本运营（赣州）有限公司（简称：普金资本）由赣州城兴投资管理有限公司联合赣州盛汇资产管理有限公司共同出资设立的互联网金融平台，2016年3月注册成立于原中央苏区振兴发展示范区--赣州。普金资本系获赣州市国资委备案的互联网金融平台，将专注围绕赣州国有企业、大型集团上下游供应链投融资服务。</p>
                <img src="<%=path %>/static/images/about/pj_01.png" class="img">
                <p class="text">普金资本团队汇聚金融行业、城建行业、供应链管理行业一批专业人才，拥有丰富的从业经验，具备成熟的产品开发设计能力、严格的风险管理能力、优秀的企业管理能力。致力于打造“专业、稳健、诚信、高效”的互联网金融平台，成为赣南苏区振兴发展投融资服务的示范性平台。</p>
                <img src="<%=path %>/static/images/about/pj_02.png" class="img">
            </div>
        </div>
    </div>

</div>
<%@include file="../../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
</body>
</html>
