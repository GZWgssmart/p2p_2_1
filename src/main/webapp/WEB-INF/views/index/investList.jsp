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
    <title>投资列表</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/index.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="invest-list">
    <div class="wrap">
        <div class="invest-top">
            <div class="invest-top-left">
                <div class="invest-top-list">
                    <p>项目期限：</p>
                    <ul class="cl">
                        <li class="active"><a href="#0">全部</a></li>
                        <li><a href="#1">1-3个月</a></li>
                        <li><a href="#2">3-6个月</a></li>
                        <li><a href="#3">6-9个月</a></li>
                        <li><a href="#4">大于9个月</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>年化收益：</p>
                    <ul>
                        <li class="active"><a href="#00">全部</a></li>
                        <li><a href="#01"><=10%</a></li>
                        <li><a href="#02">10%-15%</a></li>
                        <li><a href="#03">15%-25%</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>项目类型：</p>
                    <ul>
                        <li class="active"><a href="#000">全部</a></li>
                        <li><a href="#003">多金宝</a></li>
                        <li><a href="#004">普金保</a></li>
                        <li><a href="#006">恒金保</a></li>
                        <li><a href="#005">新手标</a></li>
                    </ul>
                </div>
            </div>
            <div class="invest-top-right">
                <div class="invest-top-list">
                    <div class="textmiddle">借款标题</div>
                    <input type="text" class="text" id="claimm-can-title"/>
                    <a type="button" href="javascript:void(0);" class="search" onclick="searchBorrow();">搜索</a>
                </div>
            </div>
        </div>
        <div class="invest-list-bottom">
            <ul class="invest-row listData creditor-row">
                <li>
                    <div class="invest-title cl"><p>item.bzname</p><h3><a>item.cpname</a></h3></div>
                    <div class="invest-content cl">
                        <ul>
                            <li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">item.nprofit<span>%</span></p></li>
                            <li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">item.term个月</p></li>
                            <li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li>
                            <li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">item.money-item.ymoney万元 / item.money万元</p></li>
                            <li class="row5">
                                <div class="line">
                                    <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px" lay-showPercent="yes">
                                        <div class="layui-progress layui-progress-bar layui-bg-red"></div>
                                    </div>
                                </div>
                                <p class="row-top">募集进度</p></li>
                            <li class="row6">
                                <button type="button" class="btn" onclick="">立即投标</button>
                                <%--<button type="button" class="btn disabled" onclick="">还款中</button>--%>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <div id="demo3"></div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script>
    function searchBorrow() {
        $.post('<%=path %>/data/borrow/frontList'
//            , $('#borrowApplyDetail').serialize(),
//            function (res) {
//                if (res.code === 0) {
//                    layer.msg('提交成功', {
//                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
//                    }, function () {
//                        location.reload(true);
//                    });
//                } else {
//                    layer.msg(res.message);
//                }
//            }
            , 'json'
        );
    }
</script>
</html>
