<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户银行卡</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>
    <div class="account-right">
        <%-- 在此处写用户后台模块代码--%>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">添加银行</li>
                <li>管理银行卡</li>
            </ul>
            <div class="layui-tab-content">
                <!-- 用户总览-->
                <div class="layui-tab-item layui-show layui-row">
                    <div class="layui-col-md12" style="padding-top: 0px;height: auto;">
                        <div class="account-content" style="padding-top: 0;">
                            <form class="layui-form" id="addForm">
                                <div class="layui-tab-item layui-show layui-row">
                                    <div class="layui-col-md12" style="padding-top: 0;height: auto;">
                                        <div id="myDebitCard" class="account-content">
                                            <div id="card3" class="bank-card_3" onclick="addBankCard();"
                                                 style="cursor:pointer;">
                                                <div class="bank-addCard"><a href="javascript:;">添加银行卡</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="layui-tab-item">
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <a href="javascript:void(0);" class="layui-btn" id="del" data-type="edit">解绑银行卡</a>
                            <table id="allArticle_table" lay-filter="demo"></table>
                            <input type="hidden" id="uid" name="uid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<!-- 客服QQ -->
<script type="text/javascript" src="<%=path %>/static/js/front/account.js"></script>
<script>
    <%-- 跳转到银行卡的添加页面 uid传递过去 --%>
    function addBankCard() {
        window.location.href = "<%=path%>/page/user/userAddCard"
    }
    $("#uid").val('${user.uid}');
    layui.use(['element', 'laytpl', 'table'], function () {
        var $ = layui.$;
        var element = layui.element;
        var laytpl = layui.laytpl;
        var table = layui.table;
        table.render({
            elem: '#allArticle_table'
            , url: '<%=path %>/data/bankCard/listPagerCriteria'
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'cardno', title: '银行卡号', width: 180, fixed: 'left'}
                , {field: 'type', title: '所属银行', width: 180}
                , {
                    field: 'bktime',
                    title: '创建时间',
                    width: 180,
                    sort: true,
                    templet: '<div>{{ formatDate(d.bktime)}}</div>'
                }
                , {field: 'status', title: '使用状态', width: 180, templet: '<div>{{ formatState(d.status)}}</div>'}
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

        $('#del').on('click', function () {
            var checkStatus = table.checkStatus('idTest')
                , data = checkStatus.data;
            if (data.length === 1) {
                if (data[0].bcid !== null) {
                    $.post('<%=path %>/data/bankCard/remove?bcid=' + data[0].bcid
                        , function (res) {
                            if (res.code == 0) {
                                utils.alert('操作成功！', function () {
                                    table.reload('idTest', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                });
                            } else {
                                utils.alert('操作失败');
                            }
                        });
                }
            } else {
                utils.alert('请选中一行！');
            }
        });
    });
    function formatState(status) {
        if (status === 0) {
            return "可用";
        } else {
            return "冻结";
        }
    }

</script>

</html>
