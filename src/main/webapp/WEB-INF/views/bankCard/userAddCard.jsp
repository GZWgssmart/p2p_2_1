<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style media="screen"></style>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>添加银行卡</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/bankCard/style.css">
    <link rel="shortcut icon" href="https://lab.chinapnr.com/muser/favicon.ico">
</head>
<body class="w960">
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="wrapper">
    <div class="min-width-out">
        <div class="min-width-in">
            <div class="min-width">
                <div class="header">
                    <div class="content">
                        <a href="" target="_blank" class="logo-new" title="汇付天下"></a>
                        <div id="logo-extra"><img id="logo-extra-img"></div>
                    </div>
                </div>
                <div class="main">
                    <div class="content">
                        <h1 class="page-title">绑定取现银行卡<span> 该银行卡将作为利息发放及本金发放的银行卡</span></h1>
                        <div class="form form-border mb30">
                            <!--平台名称-->
                            <div class="form-title form-title-big">
                                <p class="info mb15"><span>平台名称: 普金资本</span>
                                    <span>公司名称: 普金资本运营(赣州)有限公司</span></p>
                            </div>
                            <form id="addForm">
                                <div class="form-content">
                                    <!--账户余额开始-->
                                    <dl class="form-list form-list-no-icon">
                                        <dd>
                                            <div class="form-group">
                                                <label id="userName" class="label">真实姓名:</label>
                                                <span class="form-text" id="rname"></span>
                                                <input type="hidden" name="rname" id="name"/>
                                                <input type="hidden" id="uid" name="uid">
                                            </div>
                                            <div class="form-group">
                                                <label id="userNo" class="label">证件号码:</label>
                                                <span class="form-text" id="idno"></span>
                                                <input type="hidden" name="idno" id="no"/>
                                            </div>
                                        </dd>
                                        <dd>
                                            <div class="form-group form-group-card">
                                                <label class="label">所属银行:</label>
                                                <input placeholder="请输入所属银行" class="form-unit" id="type" name="type"
                                                       required=""/>
                                                <label class="form-tips error required">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>所属银行不能为空</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips okay">&nbsp;</label>
                                            </div>
                                            <div class="form-group">
                                                <label class="label">银行卡号:</label>
                                                <input type="text" placeholder="请输入银行卡号" id="cardno" name="cardno"
                                                       class="form-unit" required="" maxlength="32" value=""
                                                       autocomplete="off">
                                                <label class="form-tips tip tip-card-id">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <div class="tips-content-long">
                                                            <p>请输入您的银行<b>储蓄卡</b>号，并确保此卡用以上身份证开户。</p>
                                                        </div>
                                                        <div class="tips-card-zoom" style="display:none;"></div>
                                                    </div>
                                                </label>
                                                <label class="form-tips error required">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>银行卡号不能为空</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips error match">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>银行卡号长度为10-32位数字</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips error errorInfo">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>银行卡号长度为10-32位数字</p>
                                                    </div>
                                                </label>
                                            </div>
                                        </dd>
                                    </dl>
                                    <div class="form-group form-btns">
                                        <a href="javascript:void(0)" class="btn btn-primary" style="width: 100px;" onclick="addCard();">确定</a>
                                        <input type="submit" class="btn-submit">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="secure-tips">
                    <h2>汇付天下，全面保障您的资金安全<i></i></h2>
                    <div class="content">
                        <p>
                            汇付天下P2P账户系统托管，是汇付天下为P2P行业量身定制的账户系统与支付服务系统。一方面，为P2P平台开发定制账户系统，提供系统外包运营服务；另一方面，为P2P平台提供支付和结算服务，帮助平台和用户实现充值、取现、资金划拨等服务；投资人资金划入虚拟账户后，平台无法触碰资金，避免了资金池模式。但是，我们对投资风险（包括但不限于平台或其他借款人违约）不承担任何责任，投资需谨慎。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="push"></div>
</div>
<div class="min-width-out">
    <div class="min-width-in">
        <div class="footer min-width">
            <div class="content">
                汇付天下有限公司版权所有 Copyright © 2016 ChinaPnR All Right Reserved &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010402000137">
                    <img src="<%=path%>/static/bankCard/babhtb.png" style="absolute:middle;"> 沪公网安备 31010402000137号</a>
                <br>
                <a href="http://www.chinapnr.com/" target="_blank">关于汇付天下</a>
                <a href="http://www.chinapnr.com/security_01.html" target="_blank">安全保障</a>
                <a href="http://www.chinapnr.com/helpcenter.html" target="_blank">帮助中心</a>
                <a href="http://www.chinapnr.com/contactus.html" target="_blank">联系我们</a>
                <span style="position: absolute;left: 522px;">沪ICP备17052888号-2</span>
                <span class="phone">客服电话: <i>400 820 2819</i></span>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.all.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/bankCard/plugins.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/bankCard/main.js"></script>
<script type="text/javascript" src="<%=path%>/static/bankCard/jsencrypt.js"></script>
<script type="text/javascript" src="<%=path%>/static/bankCard/useragents.js"></script>
<script type="text/javascript" src="<%=path%>/static/bankCard/jQuery.md5.js"></script>
<script type="text/javascript" src="<%=path%>/static/bankCard/postbe.js"></script>
<script>
    $("#uid").val('${user.uid}');
    $("#idno").html('${user.idno}');
    $("#rname").html('${user.rname}');
    $("#no").val('${user.idno}');
    $("#name").val("${user.rname}");

    $(function () {
        var rname = '${user.rname}';
        var idno = '${user.idno}';
        if(rname.length===0 || idno.length===0){
            utils.alert('请先进行身份认证！', function () {
                window.location.href = '<%=path %>/page/user/safe';
            });
        }
    });
    function addCard() {
        var cardtype = $('#type').val();
        var cardno = $('#cardno').val();
        if(cardtype.length===0||cardno.length===0){
            utils.alert("银行卡类型或银行号不为空!")
        }else{
            $.post('<%=path%>/data/bankCard/save',
                $('#addForm').serialize(),
                function (data) {
                    if (data.code === 0) {
                        utils.alert('添加成功！', function () {
                            window.location.href = '<%=path %>/page/user/account';
                        })
                    } else {
                        utils.alert(data.message);
                    }
                }, 'json'
            )
        }
    }
</script>
</body>
</html>
