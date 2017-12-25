<%--
  Created by IntelliJ IDEA.
  User: qingfeng
  Date: 2017/12/25
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>安全保障</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/index.css">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
    <div class="banner">
        <div class="banner-box"><img src="<%=path%>/static/images/safty.jpg"></div>
    </div>
    <div class="safety">
        <div class="item-one">
            <div class="item-title"style="height: 30px;line-height: 30px;margin-top: 60px;background: url(<%=path%>/static/images/safety_line.png) left center repeat-x;">
                <p>01 项目保障</p>
            </div>
            <div class="item-content">
                <p class="title">所有普金资本上线项目，必须经过五级过滤！</p>
                <img class="img" src="<%=path%>/static/images/item1.png"/>
            </div>
        </div>
        <div class="item-two"style="overflow: hidden;background: url(<%=path%>/static/images/item2.png) top center no-repeat;">
            <div class="wrap">
                <div class="item-title">
                    <p style="background-color: transparent">02 项目保障</p>
                </div>
                <div class="item-content">
                    <p class="text">供应链金融：基于城投集团供应链上下游的采购贸易，为采购方或项目方提供融资，融资方以应收账款质押、保证金担保、第三方机构担保等形式为借款提供担保</p>
                    <div class="center">
                        <div class="part1">
                            <div class="left"style="background: url(<%=path%>/static/images/item1-part1.png) center center no-repeat;background-color: rgba(0, 0, 0, 0.2);"></div>
                            <div class="right">
                                <p class="top">国资</p>
                                <p class="bottom">作为一家国资参股互联网金融平台，依托城投集团在本土的优势地位及多年的行业沉淀，通过业务及第三方的市场信息交互对接，对借款项目方的信息流、资金流、现金流拥有更全面的掌握，能够建立包含多个关键指标的风险预警机制，从而具备提高风控效果的实质价值。</p>
                            </div>
                        </div>
                        <div class="part2">
                            <div class="left"style="background: url(<%=path%>/static/images/item2-part2.png) center center no-repeat;background-color: rgba(0, 0, 0, 0.2);"></div>
                            <div class="right">
                                <p class="top">金融</p>
                                <p class="bottom">借助赣州盛汇资产管理公司产业投资、资产收处风控体系，以严谨专业的风控模型，通过严密的审核流程和严格的审核标准，对借款项目进行层层把关。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item-three">
            <div class="item-title"style="height: 30px;line-height: 30px;margin-top: 60px;background: url(<%=path%>/static/images/safety_line.png) left center repeat-x;">
                <p>03 风控流程</p>
            </div>
            <div class="item-content">
                <img class="img" src="<%=path%>/static/images/item3.png"/>
            </div>
        </div>
        <div class="item-four" style="overflow: hidden;background: url(<%=path%>/static/images/item4.png) top center no-repeat;">
            <div class="wrap">
                <div class="item-title">
                    <p style="background-color: transparent">04 资金保障</p>
                </div>
                <div class="item-content">
                    <p class="text">普金资本作为金融信息服务平台，绝不触碰投资人的资金！</p>
                    <div class="center">
                        <div class="part1">
                            <div class="left"style="background: url(<%=path%>/static/images/item4-part1.png) center center no-repeat;background-color: rgba(0, 0, 0, 0.2);"></div>
                            <div class="right">
                                <p class="top">汇付天下（第三方支付托管）</p>
                                <p class="bottom">普金资本作为纯中介性质的互联网金融平台，绝不触碰投资人的资金。为了保证投资资金与平台完全隔离，普金资本与汇付天下合作，实现合规化资金托管，确保您的资金来去清晰、来去自由。</p>
                            </div>
                        </div>
                        <div class="part2">
                            <div class="left"style="background: url(<%=path%>/static/images/item4-part2.png) center center no-repeat;background-color: rgba(0, 0, 0, 0.2);"></div>
                            <div class="right">
                                <p class="top">身份认证体系</p>
                                <p class="bottom">普金资本建立手机认证、实名认证、银行卡认证等全方位认证体系，资金只能转出到本人实名认证及绑定的银行账户。</p>
                            </div>
                        </div>
                        <div class="part3">
                            <div class="left"style="background: url(<%=path%>/static/images/item4-part3.png) center center no-repeat;background-color: rgba(0, 0, 0, 0.2);"></div>
                            <div class="right">
                                <p class="top">资金账户查询</p>
                                <p class="bottom">投资人可实时查看资金账户的详情。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item-five">
            <div class="item-title"style="height: 30px;line-height: 30px;margin-top: 60px;background: url(<%=path%>/static/images/safety_line.png) left center repeat-x;">
                <p>05 技术保障</p>
            </div>
            <div class="item-content">
                <div class="part1">
                    <div class="left" style="background: url(<%=path%>/static/images/item5-part1.png) center center no-repeat;"></div>
                    <div class="right">
                        <p class="top">网络安全</p>
                        <p class="bottom">投资人可实时查看资金账户的详情。</p>
                    </div>
                </div>
                <div class="part2">
                    <div class="left"style="background: url(<%=path%>/static/images/item5-part2.png) center center no-repeat;"></div>
                    <div class="right">
                        <p class="top">数据安全</p>
                        <p class="bottom">使用阿里云服务，实时同步系统在云端的容灾备份点，每份数据具有多个副本，对于SQL注入攻击采用了严格的防范措施，确保用户信息的安全性和完整性。</p>
                    </div>
                </div>
                <div class="part3">
                    <div class="left"style="background: url(<%=path%>/static/images/item5-part3.png) center center no-repeat;"></div>
                    <div class="right">
                        <p class="top">加密验证</p>
                        <p class="bottom">数据库采用多重备份及恢复机制，提供专业的数据优化。防止数据被恶意修改，系统自动验证备份数据的可用性、完整性，确保系统历史数据的永久保存和绝对安全。</p>
                    </div>
                </div>
                <div class="part4">
                    <div class="left"style="background: url(<%=path%>/static/images/item5-part4.png) center center no-repeat;"></div>
                    <div class="right">
                        <p class="top">内控管理</p>
                        <p class="bottom">已有完善的内部管理机制和加密系统，从而确保工作人员不能在任何场合和任何时间下擅自披露、修改、删除系统的相关数据。严格遵守国家相关的法律法规，对用户的隐私信息进行保护。未经用户的同意，我们不会向任何第三方公司、组织和个人披露用户的个人信息、账户信息以及交易信息（法律法规另有规定除外）。</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="item-six"style="overflow: hidden;background: url(<%=path%>/static/images/item6.png) top center no-repeat;">
            <div class="wrap">
                <div class="item-title">
                    <p style="background-color: transparent">06 法律保障</p>
                </div>
                <div class="item-content">
                    <p class="text">普金资本是依法设立的网络借贷中介平台，为借贷双方提供信息撮合服务，属民间借贷范畴，受合同法、民法通则等法律法规及最高人民法院相关司法解释规范。</p>
                    <div class="center">
                        <div class="part1">
                            <div class="left"style="width: 260px;background: url(<%=path%>/static/images/item6-part1.png) center center no-repeat;background-color: rgba(0, 0, 0, 0.2);"></div>
                            <div class="right">
                                <p class="top">相关法律法规</p>
                                <p class="bottom">· 关于网络借贷合法性<br>· 关于投资人及借款人双方民间借贷的合法性<br>· 关于普金资本提供撮合服务的合法性<br>· 关于电子合同的有效性<br>· 普金资本法律顾问</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="../master/footer.jsp"%>
</body>
</html>
