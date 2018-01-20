<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2018/1/3
  Time: 14:58
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
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl " style="background-color: white">
    <%@include file="left.jsp" %>
    <div class="account-right ">

        <div class="account-content" style="padding-top:0;">
            <div class="content nonu-list">
                <a onclick="show(1)">绑定银行卡</a>
                <a onclick="show(2)" >充值</a>
                <a onclick="show(3)">待收本金</a>
                <a onclick="show(4)">待收收益</a>
                <a onclick="show(5)">等额本息</a>
                <a onclick="show(6)">冻结资金</a>
                <a onclick="show(7)">罚息</a>
                <a onclick="show(8)">回款</a>
                <a onclick="show(9)">汇付账户交易密码</a>
                <a onclick="show(10)">借款人</a>
                <a onclick="show(11)">净收益</a>
                <a onclick="show(12)">可用余额</a>
                <a onclick="show(13)">累计净收益</a>
                <a onclick="show(14)">连带担保</a>
                <a onclick="show(15)">流标</a>
                <a onclick="show(16)">满标</a>
                <a onclick="show(17)">年化利率</a>
                <a onclick="show(18)">年化收益率</a>
                <a onclick="show(19)">三方托管账户</a>
                <a onclick="show(20)">提前还款</a>
                <a onclick="show(21)">提前赎回</a>
                <a onclick="show(22)">提现</a>
                <a onclick="show(23)">投资进度</a>
                <a onclick="show(24)">投资人</a>
                <a onclick="show(25)">先息后本</a>
                <a onclick="show(26)">逾期</a>
                <a onclick="show(27)">债权</a>
                <a onclick="show(28)">账户余额</a>
                <a onclick="show(29)">账户总资产</a>
                <a onclick="show(30)">转让费用</a>
            </div>
            <div class="nonu-list-answer">
                <div  id="d1" name="dv">在普金资本平台将以实名认证信息开户的银行卡添加到平台中，进行提现/充值需要。</div>
                <div   id="d2" name="dv"style="display: none;">指投资人可以通过与普金资本合作的第三方支付平台以及网上银行进行充值。为保障投资人的资金安全，投资人在充值前必须完成实名认证。</div>
                <div  id="d3" name="dv" style="display: none;">投资人已投资而尚未收回的本金。</div>
                <div  id="d4" name="dv" style="display: none;">投资人已投资而尚未收回的收益之和。</div>
                <div  id="d5" name="dv" style="display: none;">指等额本息还款将借款本金和利息总额之和等月拆分，借款人每月偿还相同数额的本息部分。这种计算本息还款的方式中，借款人每月还款额中的本金比重逐月递增、利息比重逐月递减。等额本息还款法的计算公式：<br>每月还款额=[贷款本金×月利率×（1+月利率）^还款月数]÷[（1+月利率）^还款月数－1]<br>因计算中存在四舍五入，最后一期还款金额与之前略有不同。采用等额本息还款旨在减轻借款人阶段性还款压力，有助于降低借款人违约风险，从而为投资人降低系统性风险；同时，投资人的回款资金流动性更大，有助于提高加权收益率。</div>
                <div  id="d6" name="dv" style="display: none;">冻结资金分为购买冻结和提现冻结。<br>
                    购买冻结：指您的购买的项目进度达到100%之前，您的购买资金会被冻结；当项目进度达到100%时，这部分资金将转给借款人；若在限定时间内项目进度没有达到100%，即流标，这部分资金将解除冻结返至您的平台账户。<br>
                    提现冻结：指您提交提现申请后，这部分资金会被冻结，待提现审核通过后，这部分资金将解除冻结，由第三方支付公司划拨至您绑定的银行卡。
                </div>
                <div  id="d7" name="dv" style="display: none;">指当借款人逾期时，借款人需支付额外的利息作为罚息。罚息的具体规则请参见各《借款协议》。</div>
                <div  id="d8" name="dv" style="display: none;">普金资本平台推出的不同产品会因各自的产品规则，在每月产品对应日期返还利息/本息至普金资本账户。</div>
                <div  id="d9" name="dv" style="display: none;">汇付天下账户分登录密码和账户交易密码两个密码，而账户交易密码是您投资和提现时需要输入的密码。您注册之后，进入 "我的账户"-"账户总览"-"开通汇付天下账户"-"开通账户交易密码"，即可设置账户交易密码。 账户交易密码是不同于登录密码的资金安全保护机制，是专门用来保护您的资金安全的交易密码，即使您的登录密码处于异常状态，有交易密码保护就可以确保您的账户资金不被他人挪用。</div>
                <div  id="d10" name="dv" style="display: none;">指由与普金资本合作机构审核推荐并提供连带保证担保的借款人。</div>
                <div  id="d11" name="dv" style="display: none;">指投资人在普金资本所获得的所有投资收益以及其他收益（包括但不限于罚息、推广活动收入等）。</div>
                <div  id="d12" name="dv" style="display: none;">可用余额指账户内投资人可自由支配的资金。</div>
                <div  id="d13" name="dv" style="display: none;">投资人在普金资本已真实获得的投资收益。包括已使用的红包收益、罚息。</div>
                <div  id="d14" name="dv" style="display: none;">指向普金资本审核推荐借款人的合作机构对其推荐的借款人的按时还款负有不可撤销的连带责任，即当借款人出现逾期或不还款时，该机构会向投资人代偿借款人当期未归还的本息。</div>
                <div  id="d15" name="dv" style="display: none;">指因未能在规定时间内成功完成资金募集而终止的项目。</div>
                <div  id="d16" name="dv" style="display: none;">指标的在规定时间内成功完成资金筹集，等待放款的状态。</div>
                <div  id="d17" name="dv" style="display: none;">指借款人对应一年借款所需偿还的利率，即把真实借款利率换算成以年为单位的借款利率。</div>
                <div  id="d18" name="dv" style="display: none;">指投资人对应一年投资所获的收益率。</div>
                <div  id="d19" name="dv" style="display: none;">指为保障投资人的资金安全，普金资本在指定第三方支付公司开设的专款专用的资金保管账户，与普金资本自有资金账户实行完全的物理隔离。资金保管账户中的每笔划转均需在合作保管的支付公司落地操作，符合由普金资本及第三方支付公司事先确定的划转要求的申请才会被批准，以保证投资者资金存放的安全。</div>
                <div  id="d20" name="dv" style="display: none;">借款人提前归还借款。</div>
                <div  id="d21" name="dv" style="display: none;">在普金资本平台投资的产品因个人资金需要，在未到期前退出投资。</div>
                <div  id="d22" name="dv" style="display: none;">将普金资本账户中的资金提取到银行卡中。</div>
                <div  id="d23" name="dv" style="display: none;">指项目或计划已被投资金额与总额的百分比。</div>
                <div  id="d24" name="dv"style="display: none;">指在普金资本完成注册流程的投资用户。投资人可以在普金资本进行投资。成为普金资本投资人的基本条件是：1)满18周岁或年满16周岁且以自己的劳动收入为主要生活来源的具有完全民事权利能力和民事行为能力的个人；2)开通了网银功能，可通过网银进行第三方支付充值。</div>
                <div  id="d25" name="dv" style="display: none;">先息后本指在还款期内，每月偿还固定利息，到期一次性偿还最后一个月的利息及本金。<br>
                    先息后本还款法的计算公式：<br>
                    每月还款金额（第1,2...N-1月）=本金*预期年化收益率/12<br>
                    第N个月还款金额=本金*（1+预期年化收益率/12）<br>
                    注：N为该项目的期限；如项目期限为12个月，则N=12。<br>
                    例如：客户投资100,000，期限12个月，预期年化收益率15%，那么前11个月客户每月收到的还款金额=100,000*15%/12=1,250元；第12个月客户收到的还款金额=100,000*（1+15%/12）=101,250元。
                </div>
                <div  id="d26" name="dv" style="display: none;">指当借款人没有在约定还款日归还当期应还款项的，此笔借款即为逾期款项。</div>
                <div  id="d27" name="dv" style="display: none;">指投资用户与借款人之间的债务约定。</div>
                <div  id="d28" name="dv" style="display: none;">指普金资本平台账户内投资人可自由支配的资金（不包括投资中的待收本金及待收利息）。</div>
                <div  id="d29" name="dv" style="display: none;">账户总资产 = 可用余额 + 投资中冻结金额 + 提现中冻结金额 + 待收本金 + 待收收益</div>
                <div  id="d30" name="dv" style="display: none;">指投资人选择赎回项目或计划，所需支付给受让人的费用。</div>
            </div>
        </div>

    </div>
</div>
<%@include file="../../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/help.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'layer'], function () {
        var $ = layui.jquery
            , element = layui.element
    });
    function show(id){
        var divs = document.getElementsByName("dv")
        for (var i = 0 ; i < divs.length ; i++){
            if (divs[i].id == "d"+id ){
                divs[i].style.display=""
            }else{
                divs[i].style.display="none"

            }
        }
    }
</script>
</html>
