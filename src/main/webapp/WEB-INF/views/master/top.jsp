<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top" id="top">
    <div class="wrap">
        <div class="top-left icon icon-phone">
            <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
        </div>
        <div class="top-right cl">
            <ul class="top-list">
                <li class="first"><a href="javascript:;" class="">退出</a></li>
                <li><a href="https://www.pujinziben.com/account.html#tuijian" class="icon icon-inv">邀请有礼</a></li>
                <li><a href="https://www.pujinziben.com/about.html#gdbj">关于我们</a></li>
                <li><a href="https://www.pujinziben.com/help.html">帮助中心</a></li>
                <li><a href="https://www.pujinziben.com/account.html#ipay" class="pay">充值</a></li>
                <li id="userName"><a href="https://www.pujinziben.com/account.html" class="user">17607974221</a></li>
                <li class="no"><a href="javascript:;" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
            <div id="qrCodeDiv" style="display: none;">
                <div class="CodeDiv">
                    <img src="<%=path%>/static/images/qrCode_ios.png">
                    <p>IOS下载</p>
                </div>
                <div class="CodeDiv">
                    <img src="<%=path%>/static/images/qrCode_android.png">
                    <p>Android下载</p>
                </div>
            </div>
        </div>
    </div>
</div>
