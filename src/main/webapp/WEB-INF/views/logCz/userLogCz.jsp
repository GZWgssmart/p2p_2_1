<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/28
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>前台用户中心模板</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>
    <%--信息披露里的左侧边栏--%>
    <%--<%@include file="../master/aboutLeft.jsp"%>--%>
    <div class="account-right">
        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="active show-ipay">充值</a>
                <a href="javascript:void(0);" class="show-ipay-list">充值记录</a>
            </div>
            <em class="em-line"></em>
        </div>
        <div class="account-content">
            <form id="addForm">
                <!-- 充值 -->
                <div class="ipay-pay">
                    <p class="tips-title"><b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费 普金资本禁止信用卡套现、虚假交易
                        等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
                    <div class="pay-from">
                        <div class="label cl">
                            <label>充值金额：</label>
                            <input type="text" id="money" name="money" maxlength="18" placeholder="请输入充值金额">
                            <input type="hidden" id="uid" name="uid">
                            <p class="roll">元</p>
                        </div>
                        <div class="label cl">
                            <label>卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
                            <select name="bankcard" id="bankcard" style="width: 298px;height: 38px;">
                                <script id="bankcardDemo" type="text/html">
                                    {{#  layui.each(d, function(index, bankcard){ }}
                                    <option value="{{ bankcard.cardno }}">{{ bankcard.cardno}}</option>
                                    {{#  }); }}
                                </script>
                            </select>
                        </div>
                        <div class="label cl">
                            <label>所属银行：</label>
                            <select name="banktype" id="banktype" style="width: 298px;height: 38px;">
                                <script id="banktypeDemo" type="text/html">
                                    {{#  layui.each(d, function(index, bankcard){ }}
                                    <option value="{{ bankcard.type }}">{{ bankcard.type}}</option>
                                    {{#  }); }}
                                </script>
                            </select>
                        </div>
                        <button type="button" class="btn" id="ipay-submit" onclick="saveLogCz();">立即充值</button>
                    </div>
                </div>
                <!-- 充值记录 -->
                <div class="ipay-list">
                    <div class="account-form cl">
                        <input type="text" class="date icon icon-date" id="startDate">
                        <p class="text">至</p>
                        <input type="text" class="date icon icon-date" id="endDate">
                        <button type="button" class="search" id="ipaySearch">搜索</button>
                    </div>
                    <div class="account-list">
                        <ul class="ipay-list-box list-box">
                            <li class="title">
                                <div class="children0">账户名</div>
                                <div class="children1">充值金额</div>
                                <div class="children2">充值类型</div>
                                <div class="children3">充值时间</div>
                                <div class="children4">充值状态</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script>
    $("#uid").val('${user.uid}');
    function saveLogCz() {
        $.post('<%=path%>/data/logCz/save',
            $('#addForm').serialize(),
            function (data) {
                if (data.code == 0) {
                    layer.alert('添加成功！', function () {
                        window.location.href = '<%=path %>/page/user/account';
                    });
                } else {
                    layer.alert(data.message);
                }
            }, 'json'
        )
    }
    layui.use(['form', 'laytpl'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var laytpl = layui.laytpl;

        var getTpl = bankcardDemo.innerHTML,
            view = document.getElementById('bankcard');
        var getTpl1 = banktypeDemo.innerText,
            view1 = document.getElementById('banktype');
        $.get('<%=path %>/data/bankCard/allCards?uid=' +${user.uid}, function (data) {
            laytpl(getTpl).render(data, function (html) {
                view.innerHTML = html;
            });
            laytpl(getTpl1).render(data, function (html) {
                view1.innerHTML = html;
            });
            form.render('select');
        })

    });


</script>
</html>