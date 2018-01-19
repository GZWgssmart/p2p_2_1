<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/4
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户提现</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
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
        <%-- 在此处写用户后台模块代码--%>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">提现</li>
                <li>提现记录</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <!-- 用户总览-->
                <div class="layui-tab-item layui-show layui-row">
                    <div class="layui-col-md12" style="padding-top: 50px;">
                        <div class="account-content">
                            <form  id="addForm">
                                <!-- 充值 -->
                                <div class="ipay-pay">
                                    <p class="tips-title"><b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费
                                        普金资本禁止信用卡套现、虚假交易
                                        等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
                                    <div class="pay-from">
                                        <div class="label cl">
                                            <label>提现金额：</label>
                                            <input type="text" id="money" name="money" maxlength="18"
                                                   lay-verify="required|number" placeholder="请输入提现金额">
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
                                        <div class="label cl">
                                            <label>交易密码：</label>
                                            <input type="password" id="pwd" name="pwd" lay-verify="required|pass"
                                                   maxlength="6"
                                                   placeholder="请输入交易密码">
                                        </div>
                                        <button type="button" class="btn" lay-submit lay-filter="add"  onclick="confirmCard();" id="ipay-submit">
                                            立即提现
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- 提现记录-->
                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <table id="allArticle_table" lay-filter="demo"></table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    $(function () {
        var user = "${user}";
        if (user === null || user === '') {
            utils.alert("您未登录，请登录！",function () {
                window.location = '/page/login';
            })
        }
        layui.use(['element', 'form', 'laytpl'], function () {
            var form = layui.form;
            var $ = layui.$;
            var element = layui.element;
            var laytpl = layui.laytpl;

            var getTpl = bankcardDemo.innerHTML,
                view = document.getElementById('bankcard');
            var getTpl1 = banktypeDemo.innerText,
                view1 = document.getElementById('banktype');
            $.get('<%=path %>/data/bankCard/allCards?uid=' +${user.uid}, function (data) {
                if(data.length !==0){
                    laytpl(getTpl).render(data, function (html) {
                        view.innerHTML = html;
                    });
                    laytpl(getTpl1).render(data, function (html) {
                        view1.innerHTML = html;
                    });
                    form.render('select');
                }else{
                    utils.alert('请绑定银行卡！', function () {
                        window.location.href = '<%=path %>/page/bankCard/userAddCard';
                    });
                }
            }
        );
        layui.use(['element', 'laytpl', 'table'], function () {
            var table = layui.table;
            var $ = layui.$;
            table.render({
                elem: '#allArticle_table'
                , url: '<%=path %>/data/logTx/listPagerCriteria'
                , cols: [[
                    {field: 'bankcard', title: '银行卡号', width: 180, fixed: 'left'}
                    , {field: 'banktype', title: '所属银行', width: 180}
                    , {field: 'money', title: '提现金额', width: 180}
                    , {
                        field: 'created_time',
                        title: '提现时间',
                        width: 180,
                        sort: true,
                        templet: '<div>{{ formatDate(d.createdTime)}}</div>'
                    }
                    , {
                        field: 'status',
                        title: '提现状态',
                        width: 180,
                        templet: '<div>{{ formatState(d.status)}}</div>'
                    }
                ]]
                , id: 'idTest'
                , page: true
                , response: {
                    statusName: 'status'
                    , statusCode: 0
                    , msgName: 'message'
                    , countName: 'total'
                    , dataName: 'rows'
                }
            });
        });
    })
    })
</script>

<script>
    $("#uid").val('${user.uid}');
    layui.use(['element', 'form', 'laytpl'], function () {
        var form = layui.form;
        var $ = layui.$;
        var data = layui.data;
        form.on('submit(add)', function (data) {
                $.post('<%=path%>/data/logTx/save',
                    $('#addForm').serialize(),
                    function (res) {
                        if (res.code == 0) {
                            utils.alert('提现成功！', function () {
                                window.location.href = '<%=path %>/page/user/account';
                            });
                        } else {
                            utils.alert(res.message);
                        }
                    }, 'json'
                )
            }
        )
    });
    function formatState(status) {
        if (status === 0) {
            return "提现失败";
        } else {
            return "提现成功";
        }
    }

</script>
</body>
</html>



