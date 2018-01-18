<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <c:if test="${sessionScope.user != null}">
                    <li class="icon icon-acc">
                        <a href="javascript:void(0);" onclick="window.location.href='<%=path %>/page/user/account'">我的账户</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <li class="icon icon-acc">
                        <a href="javascript:void(0);" onclick="window.location.href='<%=path %>/page/login'">我的账户</a>
                    </li>
                </c:if>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="<%=path %>/page/about/aboutwe">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="<%=path%>/statically/insurance">安全保障</a></li>
                <li>
                    <a href="<%=path%>/page/borrowApply/investList">投资理财</a>
                </li>
                <li><a href="<%=path%>/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
