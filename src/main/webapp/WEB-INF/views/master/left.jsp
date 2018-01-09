<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="account-left">
    <div class="account-left-nav">
        <div class="navbar icon icon-account">我的账户</div>
        <ul class="sub-nav">
            <li class=""><a href="<%=path %>/page/user/account">账户总览</a></li>
            <li class=""><a href="<%=path%>/page/user/userLogCz">充值</a></li>
            <li class=""><a href="<%=path%>/page/user/userLogTx">提现</a></li>

            <li class=""><a id="myCoupon" href="<%=path %>/page/user/taste">我的赠券<i id="couponCount"></i></a></li>

            <li class=""><a href="<%=path %>/page/user/fund">资金记录</a></li>
        </ul>
        <div class="navbar icon icon-self">我的管理</div>
        <ul class="sub-nav">
            <li class=""><a href="<%=path %>/page/user/invest/management">投资管理</a></li>
            <li class=""><a href="<%=path %>/page/user/borrow/addPage">申请借款</a></li>
            <li class=""><a href="<%=path %>/page/user/borrow/management">借款管理</a></li>
        </ul>
        <div class="navbar icon icon-settings">账户设置</div>
        <ul class="sub-nav">
            <li class=""><a href="<%=path%>/page/user/userBankCard" >我的银行卡</a></li>
            <li class=""><a href="<%=path %>/page/user/safe">安全设置</a></li>
            <li class=""><a href="<%=path %>/page/user/notice">消息中心</a></li>
        </ul>
    </div>
    <a href="<%=path %>/page/user/recommend" class="tuijian">
        <img src="<%=path%>/static/images/tuijian.png">
    </a>
</div>