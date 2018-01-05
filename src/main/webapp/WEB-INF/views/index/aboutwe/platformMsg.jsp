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
    <title>平台资质</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body onhashchange="hashChange()">
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl">
    <%@include file="../../master/aboutLeft.jsp" %>
    <div class="account-right"   style="width:800px">
            <div class="about-right-nav">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="active">平台资质</a>
                </div>
                <em class="em-line"></em>
            </div>
            <div class="about-content">
                <div class="layui-tab layui-tab-card">
                    <ul class="layui-tab-title">
                        <li class="layui-this">公司证件</li>
                        <li>荣誉资质</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <div id="zhengjian" class="content">
                                <div class="text-banner clearfix" style="display: block;">
                                    <div class="credit-right fl" style="width:299px;margin-left:140px;">
                                        <p class="credit-pic" onclick="zjPicBanner(0)">
                                            <img src="<%=path %>/static/images/about/ptzz_06_big.jpg" width="299"
                                                 height="190">
                                            <span style="width: 299px; height: 190px; display: none;">
                                                    <span>开户许可证</span>
                                            </span>
                                        </p>
                                        <p class="credit-pic" style="margin-top:20px;" onclick="zjPicBanner(1)">
                                            <img src="<%=path %>/static/images/about/ptzz_07_big.jpg" width="299"
                                                 height="190">
                                            <span style="width:299px;height:190px;display: none;">
						                            <span>机构信用代码证</span>
					                        </span>
                                        </p>
                                    </div>
                                    <div class="credit-right fl" style="width:299px;margin-left:19px;">
                                        <p class="credit-pic" onclick="zjPicBanner(2)">
                                            <img src="<%=path %>/static/images/about/ptzz_09_big.jpg" width="299"
                                                 height="190">
                                            <span style="width: 299px; height: 190px; display: none;">
						                            <span>汇付天下合同协议</span>
					                        </span>
                                        </p>
                                        <p class="credit-pic" style="margin-top:20px;" onclick="zjPicBanner(3)">
                                            <img src="<%=path %>/static/images/about/ptzz_08_big.jpg" width="299"
                                                 height="190">
                                            <span style="width:299px;height:190px;display: none;">
						                            <span>国资委备案</span>
					                        </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div id="zizhi" class="content" >
                                <div class="text-banner clearfix text-banner-two" style="position: relative;">
                                    <p class="credit-pic">
                                        <img src="<%=path %>/static/images/about/ptzz_001.jpg" width="265" height="182">
                                        <span style="display: none;">
						                        <span>先进单位</span>
                                        </span>
                                    </p>
                                    <p class="credit-pic">
                                        <img src="<%=path %>/static/images/about/ptzz_002.jpg" width="265" height="182">
                                        <span style="display: none;">
						                        <span>先进单位</span>
					                    </span>
                                    </p>
                                    <p class="credit-pic">
                                        <img src="<%=path %>/static/images/about/ptzz_003.jpg" width="265" height="182">
                                        <span style="display: none;">
						                        <span>先进单位</span>
					                    </span>
                                    </p>
                                    <p class="credit-pic" style="margin-right:0;">
                                        <img src="<%=path %>/static/images/about/ptzz_05.jpg" width="265" height="182">
                                        <span style="display: none;">
						                        <span>信息工作先进单位</span>
					                    </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
    </div>

</div>
<%@include file="../../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/about.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/countUp.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element'], function () {
        var $ = layui.jquery
            , element = layui.element;
    });
</script>
</body>
</html>
