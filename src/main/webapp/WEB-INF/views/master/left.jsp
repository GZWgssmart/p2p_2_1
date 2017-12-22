<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="account-left">
    <div class="account-left-nav">
        <div class="navbar icon icon-account">我的账户</div>
        <ul class="sub-nav">
            <li class=""><a href="https://www.pujinziben.com/account.html#account">账户总览</a></li>
            <li class=""><a href="https://www.pujinziben.com/account.html#ipay">充值</a></li>
            <li class=""><a href="https://www.pujinziben.com/account.html#cash">提现</a></li>

            <li class=""><a id="myCoupon" href="https://www.pujinziben.com/account.html#taste">我的赠券<i id="couponCount"></i></a></li>

            <li class=""><a href="https://www.pujinziben.com/account.html#fund">资金记录</a></li>
        </ul>
        <div class="navbar icon icon-self">我的管理</div>
        <ul class="sub-nav">
            <li class=""><a href="https://www.pujinziben.com/account.html#invest">投资管理</a></li>
            <li class=""><a href="https://www.pujinziben.com/account.html#claimm">债权管理</a></li>
            <li class=""><a href="https://www.pujinziben.com/account.html#claimb">债权购买</a></li>
            <li class="active"><a href="https://www.pujinziben.com/account.html#loan">借款管理</a></li>
        </ul>
        <div class="navbar icon icon-settings">账户设置</div>
        <ul class="sub-nav">
            <li class=""><a href="https://www.pujinziben.com/account.html#bank">我的银行卡</a></li>
            <li class=""><a href="https://www.pujinziben.com/account.html#safe">安全设置</a></li>
            <li class=""><a href="https://www.pujinziben.com/account.html#msg">消息中心</a></li>
        </ul>
    </div>
    <a href="#" class="tuijian">
        <img src="<%=path%>/static/images/tuijian.png">
    </a>
</div>