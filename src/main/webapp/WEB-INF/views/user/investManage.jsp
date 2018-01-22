<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/26
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>投资管理</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <div class="account-right">
        <h1>投资管理</h1>
        <hr/>
        <div id="manageBtn" class="layui-row">
            <a href="javascript:void(0);" class="layui-btn" id="borrowShow" data-type="edit">查看投标详情</a>
            <a href="javascript:void(0);" class="layui-btn" id="planShow" data-type="edit">查看收款计划</a>
        </div>

        <table id="borrowList"></table>

        <div style="display: none;" id="planListShow">
            <a href="javascript:void(0);" class="layui-btn" id="confirmSK" data-type="edit">确认收款</a>
            <table id="planList"></table>
        </div>

    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    layui.use(['table','form', 'layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;

        table.render({
            elem: '#borrowList'
            ,url: '<%=path %>/data/tz/userInvest'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'money', title:'投资金额', width:90}
                ,{field:'term', title:'还款期限', width:90, templet:'<div>{{d.term}}个月</div>'}
                ,{field:'cpname', title:'产品名称', width:120}
                ,{field:'nprofit', title:'年化利率', width:90, templet:'<div>{{d.nprofit}}%</div>'}
                ,{field:'ckstatus', title:'状态', width:90, templet:'<div>{{formatStatus(d.ckstatus)}}</div>'}
                ,{field:'tztime', title:'投资时间', width:180, sort: true, templet:'<div>{{ formatDate(d.tztime)}}</div>'}
            ]]
            ,id: 'checkId'
            ,page: true
            ,height: 500
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
        });

        $('#planShow').on('click', function () {
            var checkStatus = table.checkStatus('checkId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                if(data[0].ckstatus === 3) {
                    utils.alert('该投资已流标');
                } else {
                    layer.open({
                        type: 1,                //弹窗类型
                        title: '收款计划',     //显示标题
                        closeBtn: 1,         //是否显示关闭按钮
                        shadeClose: true, //显示模态窗口
                        fixed:false,    //层是否固定在可视区域
                        offset: 't',//快捷设置顶部坐标
                        move: false,//禁止拖拽
                        area: ['890px', '560px'], //宽高
                        content: $("#planListShow")  //弹窗内容
                    });
                    table.render({
                        elem: '#planList'
                        ,url: '<%=path %>/data/skb/list'
                        ,where:{
                            baid:data[0].baid
                            ,uid:${sessionScope.user.uid}
                        }
                        , cols: [[
                            {checkbox: true, fixed: true}
                            ,{field: 'ylx', title: '应收利息', width: 80}
                            , {field: 'rlx', title: '已收利息', width: 80}
                            , {field: 'ybj', title: '应收本金', width: 150}
                            , {field: 'rbj', title: '已收本金', width: 120}
                            ,{field: 'ybx', title: '应收本息', width: 100}
                            , {field: 'rbx', title: '已收本息', width: 110}
                            ,{field:'rnum', title:'已还期数', width:90}
                            ,{field:'tnum', title:'总期数', width:90}
                            , {field: 'sktime', title: '应收时间', width: 180, sort: true, templet:'<div>{{ formatDate(d.sktime)}}</div>'}
                        ]]
                        ,id: 'planId'
                        ,page: true
                        ,height: 500
                        ,response: {
                            statusName: 'status'
                            ,statusCode: 0
                            ,msgName: 'message'
                            ,countName: 'total'
                            ,dataName: 'rows'
                        }
                    });
                }
            } else {
                utils.alert('请选中一行！');
            }
        });

        $('#confirmSK').on('click', function(){
            var checkStatus = table.checkStatus('planId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                if(data[0].rbx !== data[0].ybx) {
                    $.post('<%=path %>/data/skb/confirm'
                        ,{
                            skid : data[0].skid
                        }
                        , function (data) {
                            utils.alert(data.message);
                            layer.closeAll();
                        },'json');
                } else {
                    layer.closeAll();
                    utils.alert('已收款');
                }
            } else {
                utils.alert('请选中一行！');
            }
        });

        $('#borrowShow').on('click', function () {
            var checkStatus = table.checkStatus('checkId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                if(data[0].ckstatus === 3) {
                    utils.alert('该投资已流标');
                } else {
                    window.location.href = '<%=path %>/page/borrowApply/detail/' + data[0].baid;
                }
            } else {
                utils.alert('请选中一行！');
            }
        });
    });
</script>
</html>
