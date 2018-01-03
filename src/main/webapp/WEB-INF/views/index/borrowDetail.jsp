<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/28
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>投资详情</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/index.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="layui-container">
<div id="borrowCont">
    <script id="borrowDetail" type="text/html">
    <div class="subject">
        <div class="subject-submit">
            <div class="subject-submit-l" style="display: block;">
                <div class="subject-submit-title">
                    <p id="borrowWayName">{{d.bzname}}</p>
                    <h3 id="borrowTitle">{{d.cpname}}</h3>
                </div>
                <div class="subject-submit-detail">
                    <div class="subject-submit-rate">
                        <p>预期年化收益</p>
                        <p class="text color"><span class="color" id="rate">{{d.nprofit}}</span>%</p>
                    </div>
                    <div class="subject-submit-date">
                        <p>项目期限</p>
                        <p class="text" id="date"><span id="term">{{d.term}}</span>个月</p>
                    </div>
                    <div class="subject-submit-amt">
                        <p class="title_amt">募集总金额</p>
                        <p class="text"><span id="amt">{{d.money}}</span>元</p>
                    </div>
                </div>
                <div class="subject-submit-bottom">
                    <div class="subject-submit-b-l">
                        <p>还款方式：<span id="paymentMode">按月付息，到期还本</span></p>
                        <p>最小投标金额：<span id="minTenderedSum">100.00元</span></p>
                    </div>
                    <div class="subject-submit-b-l">
                        <p>总投标数：<span id="investNum">10</span></p>
                        <p>最大投标金额：<span id="maxTenderedSum">{{d.money-d.moneyCount}}元</span></p>
                    </div>
                    <div class="subject-submit-b-r">
                        <div class="line">
                            <p>投资进度：</p><p class="progress"><em style="width: 100%;"></em></p><p class="progress-text">100.00%</p>
                        </div>
                        <p>截止时间：<span id="publishTime">{{d.deadline}}</span></p>
                    </div>
                </div>
            </div>
            <div class="subject-submit-r" style="display: block;">
                <div class="subject-s-r-u">

                </div>
                <div class="subject-s-r-c">
                    <p>可用余额：<span id="canUseSum">
                    <c:if test="${sessionScope.user != null}"><p id="kymoney">${requestScope.userMoney.kymoney}</p></c:if>
                    <c:if test="${sessionScope.user == null}"><p>登录后查看余额</p></c:if>
                    </span></p>
                    <p class="rate">预期收益：<span class="color" id="reckon">0.00</span></p>
                </div>
                <div class="subject-s-r-c">
                    <p>剩余可投：<span id="investAmount">{{d.money-d.moneyCount}}元</span></p>
                    <p class="rate active" id="increaseP">加息收益：<span class="color" id="increase">0.00</span></p>
                </div>
                <div class="input">
                    <input type="text" placeholder="请输入投资金额" id="tzmoney">
                    <button type="button" onclick="allInvest();">全投</button>
                </div>
                <div class="quan">
                    <select id="selectQuan">
                        <option value="0">当前没有可用的优惠券</option>
                    </select>
                    <a href="calculator.html?repayWay=3&amp;showRate=9+1&amp;time=6" class="icon icon-cal" id="calculator">详细收益明细</a>
                </div>
                {{# if((d.money-d.moneyCount)>0){ }}
                <button type="button" class="btn" onclick="invest(${requestScope.userMoney.kymoney}, '{{d.money-d.moneyCount}}');">立即投标</button>
                {{# } else if(d.ckstatus === 5) { }}
                <button type="button" class="btn disabled" onclick="">已完成</button>
                {{# } else { }}
                <button type="button" class="btn disabled" onclick="">还款中</button>
                {{# } }}
                <p class="agreement" style="height: 0;"></p>
                <div id="productJump"></div>
            </div>
        </div>
    </div>
    <div class="sub-about">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="active" onclick="getDetail(this)">项目详情</a>
            <a href="javascript:void(0);" onclick="getFile(this)" id="getFile" class="">相关文件</a>
            <a href="javascript:void(0);" onclick="getPlan(this)" class="plan" id="getPlan" style="display: inline;">还款计划</a>
            <a href="javascript:void(0);" onclick="getInvest(this)" id="getInvest" class="">投资记录</a>
            <a href="javascript:void(0);" onclick="dangger(this)" class="">风险提示</a>
        </div>
        <em class="em-line"></em>
        <div class="sub-a-box" id="project" style="display: block;">
            <div class="detail cl">
                <p class="title">产品名称：</p><p class="content" id="projectTitle">{{d.cpname}}</p>
            </div>
            <div class="detail cl">
                <p class="title">募集资金：</p><p class="content" id="projectAmount">{{d.money}}元</p>
            </div>
            <div class="detail cl">
                <p class="title">预期年化收益：</p><p class="content" id="projectRate">{{d.nprofit}}%</p>
            </div>
            <div class="detail cl">
                <p class="title">起息日期：</p><p class="content">满标计息</p>
            </div>
            <div class="detail cl">
                <p class="title">资金用途：</p><p class="content" id="moneyPurposes">{{d.mpurpose}}</p>
            </div>
            <div class="detail cl">
                <p class="title">收益方式：</p><p class="content" id="projectType">按月付息，到期还本</p>
            </div>
            <div class="detail cl">
                <p class="title">还款来源：</p><p class="content" id="retsource">{{d.hksource}}</p>
            </div>
            <div class="detail cl">
                <p class="title">借款人介绍：</p><p class="content" id="projectIntro">{{d.suggest}}</p>
            </div>
            <div class="detail cl">
                <p class="title">项目描述：</p><p class="content" id="projectDetail">{{d.xmdes}}</p>
            </div>
            <div class="detail cl">
                <p class="title">保障措施：</p><p class="content" id="safeMeasures">{{d.guarantee}}</p>
            </div>
        </div>
        <div class="sub-a-box files" id="files">
            <p class="icon icon-danger files-title">互联金融将以客观、公正的原则，最大程度地核实借入者信息的真实性，但不保证审核信息100%真实。如果借入者长期逾期，其提供的信息将被公布。</p>
            <ul class="files-box">
                <li class="layui-col-md2">
                    {{# if(d.fpic != null && d.fpic != ''){ }}
                    <img alt="" width="320" height="200" src="<%=path %>/{{d.fpic}}">
                    <p>
                        <span class="icon icon-true">法人身份认证</span>
                    </p>
                    {{# } }}
                </li>
                <li class="layui-col-md2">
                    {{# if(d.ypic != null && d.ypic != ''){ }}
                    <img alt="" width="320" height="200" src="<%=path %>/{{d.ypic}}">
                    <p>
                        <span class="icon icon-true">营业执照</span>
                    </p>
                    {{# } }}
                </li>
                <li class="layui-col-md2">
                    {{# if(d.qpic != null && d.qpic != ''){ }}
                    <img alt="" width="320" height="200" src="<%=path %>/{{d.qpic}}">
                    <p>
                        <span class="icon icon-true">银行账号</span>
                    </p>
                    {{# } }}
                </li>
                <li class="layui-col-md2">
                    {{# if(d.tpic != null && d.tpic != ''){ }}
                    <img alt="" width="320" height="200" src="<%=path %>/{{d.tpic}}">
                    <p>
                        <span class="icon icon-true">其他资料</span>
                    </p>
                    {{# } }}
                </li>
            </ul>
        </div>
        <div class="sub-a-box plan" id="plan">
            <ul class="">
                <li class="title"><div class="children0">序号</div><div class="children1">计划还款日期</div><div class="children2">实际还款日期</div><div class="children3">已还本息</div><div class="children4">待还本息</div><div class="children5">已付罚息</div><div class="children6">待还罚息</div><div class="children7">状态</div></li>
            </ul>
            <ul class="listData">
            </ul>
        </div>
        <div class="sub-a-box invest" id="invest">
            <ul class="">
                <li class="title"><div class="children0">投资人</div><div class="children1">金额</div><div class="children2">投资时间</div><div class="children3">投资方式</div></li>
            </ul>
            <ul class="listData">
            </ul>
            <ul class="paging"></ul>
        </div>
        <div class="sub-a-box dangger" id="tips">
            <p class="icon icon-danger tips-title"><b>普金资本郑重提示：</b>用户应自行对交易风险进行全面了解、充分认识、谨慎决策，用户应对其决策承担全部责任并承担全部风险。如用户通过普金资本平
                台进行下一步操作，即表示已经认真阅读本提示书并完全了解与接受。</p>
            <div class="content">
                <p class="title">一、政策风险</p>
                <p>因国家宏观政策和相关法律法规发生变化，可能引起价格方面的异常波动，用户可能因此遭受损失。</p>
                <p class="title">二、信用风险</p>
                <p> 普金资本不对本金和收益提供任何保证或承诺。若平台项目发生逾期还款，由平台合作机构保理公司或担保公司在 30 个工作日内进行债权回购。合作机构在发生
                    最不利情况下（可能但并不一定发生），项目进入司法程序，可能不利于用户实现项目的预期收益甚至本金遭受损失。</p>
                <p class="title">三、信息传递风险</p>
                <p>普金资本将按协议约定进行信息披露，用户应充分关注并及时主动查询交易信息，如未及时查询，或由于通讯故障、系统故障以及其他不可抗力等因素的影响使得
                    无法及时了解交易信息，由此产生责任和风险应由用户承担。</p>
                <p class="title">四、不可抗力及意外事件风险</p>
                <p>包括但不限于自然灾害、金融市场危机、战争、黑客攻击、病毒感染等不能预见、不能避免、不能克服的不可抗力事件，对于由于不可抗力及意外事件风险导致的
                    任何损失，客户须自行承担。</p>
                <p class="title">五、流动性风险</p>
                <p>用户提以债权转让方式通过普金资本平台进行转让的，普金资本不对债权转让完成的时间以及债权转让能否全部成功实现做出任何承诺，债权未成功转让的，用户
                    面临资金不能变现、丧失其他投资机会的风险。</p>
                <p class="icon icon-danger"><span>特别提示：</span>本风险提示书不能穷尽全部风险及市场的全部情形。</p>
            </div>

        </div>
    </div>
    <div class="files-more">
        <p class="title">其他资料</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <ul class="files-more-list">

        </ul>
    </div>
    <div class="popup hasPWD">
        <p class="title left">输入投标密码</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div class="label cl">
                <label>投标密码</label><input type="password" id="password" maxlength="30" placeholder="请输入投标密码"/>
            </div>
            <button type="button" class="btn" id="haspwd-submit">立即投标</button>
        </div>
    </div>
    <div class="popup AgreeMent">
        <p class="title left">普金资本服务协议</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-area">

        </div>
    </div>
    </script>
</div>
</div>

<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/borrow/detail.js"></script>
<script>
    var minInvest = 100;// 最小投资金额

    layui.use(['element', 'laytpl'], function () {
        var $ = layui.$;
        var element = layui.element;
        var laytpl = layui.laytpl;

        var getTpl = borrowDetail.innerHTML
            , view = document.getElementById('borrowCont');
        $.post('<%=path %>/data/borrow/detail'
            ,{ baid:${requestScope.baid} }
            , function (data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
            },'json');

    });
    /**
     *  投资金额验证
     * @param money 输入框金额
     * @param ktmoney 可投金额
     * @param maxInvest 最大可投
     */
    function investCheck(money, ktmoney, maxInvest) {
        if(money === null || money.trim() === '') {
            return utils.alert('请输入投资金额');
        }
        if(money > ktmoney) {
            return utils.alert('余额不足！请充值');
        }
        if(money < minInvest) {
            return utils.alert('最少可投' + minInvest + '元');
        }
        if(money > maxInvest) {
            $('#tzmoney').val(maxInvest);
            return utils.alert('最多可投' + maxInvest + '元');
        }
        if((maxInvest - 100) < 100) {
            $('#tzmoney').val(maxInvest);
            return utils.alert('最少可投' + maxInvest + '元');
        }
    }

    function allInvest() {
        $('#tzmoney').val($('#kymoney').text());
    }

    function invest(ktmoney, maxInvest) {
        var tzmoney = $('#tzmoney').val();
        investCheck(tzmoney, ktmoney, parseFloat(maxInvest));
        $.post('<%=path %>/data/tz/invest'
            ,{ baid:${requestScope.baid}
                ,money: tzmoney
            ,resint1:$('#term').text()}
            , function (data) {

            },'json');
    }
</script>
</html>
