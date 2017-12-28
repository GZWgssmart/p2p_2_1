<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href="<%=path%>/"><img src="<%=path%>/static/images/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="javascript:void(0);">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="https://www.pujinziben.com/about.html">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="<%=path%>/statically/insurance">安全保障</a></li>
                <li>
                    <a href="<%=path%>/page/borrowApply/investList">投资理财</a>
                    <div class="sub-nav">
                        <a href="https://www.pujinziben.com/investlist.html#006">恒金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#004">普金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#003">多金宝</a>
                        <a href="https://www.pujinziben.com/investlist.html#005">新手标</a>
                        <a href="https://www.pujinziben.com/creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="<%=path%>/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
