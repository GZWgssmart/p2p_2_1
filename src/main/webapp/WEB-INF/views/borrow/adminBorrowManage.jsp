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
    <title>借款管理</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<body>
<div class="account cl">
    <div class="account-right">
        <h1>借款管理</h1>
        <hr/>
        <div class="layui-row">
            <form id="borrowQuery" class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <input type="text" id="cpname" name="cpname" placeholder="请输入产品名称" class="layui-input layui">
                    </div>
                    <div class="layui-inline">
                        <input type="text" id="nprofitMin" name="nprofitMin" placeholder="请输入最小利率" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <input type="text" id="nprofitMax" name="nprofitMax" placeholder="请输入最大利率" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <select name="bzid" id="bzid" lay-filter="aihao">
                            <option value="">请选择标种</option>
                            <option value="1">恒金宝</option>
                            <option value="2">普金宝</option>
                            <option value="3">多金宝</option>
                            <option value="4">新手标</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="term" id="term" lay-filter="aihao">
                            <option value="">请选择借款期限</option>
                            <option value="3">3个月</option>
                            <option value="6">6个月</option>
                            <option value="12">12个月</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="ckstatus" id="ckstatus" lay-filter="aihao">
                            <option value="">请选择借款状态</option>
                            <option value="0">审核中</option>
                            <option value="1">审核失败</option>
                            <option value="2">投标中</option>
                            <option value="3">已流标</option>
                            <option value="4">还款中</option>
                            <option value="5">已完成</option>
                        </select>
                    </div>
                    <a href="javascript:void(0);" class="layui-btn" id="searchBtn" data-type="reload">搜索</a>
                </div>
            </form>
        </div>
        <div id="manageBtn" class="layui-row">
            <a href="javascript:void(0);" class="layui-btn" id="checkBorrow" data-type="edit">审核</a>
            <a href="javascript:void(0);" class="layui-btn" id="planShow" data-type="edit">查看还款计划</a>
            <a href="javascript:void(0);" class="layui-btn" id="investShow" data-type="edit">查看投资列表</a>
        </div>

        <table id="borrowList"></table>

        <%--还款计划弹窗--%>
        <div style="display: none;" id="planListShow">
            <table id="planList"></table>
        </div>

        <%--投资列表弹窗--%>
        <div style="display: none;" id="investListShow">
            <table id="investList"></table>
        </div>

        <%--审核弹框--%>
        <div style="display: none;" id="checkFrame">
            <form id="ckForm" name="shborrow" class="layui-form">
                <input type="hidden" id="baid" name="baid">
                <div class="layui-form-item layui-col-md11">
                    <label class="layui-form-label">审核状态</label>
                    <div class="layui-input-block ">
                        <select name="isok">
                            <option value="7">通过</option>
                            <option value="1">驳回</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text layui-col-md11">
                    <label class="layui-form-label">审核理由</label>
                    <div class="layui-input-block">
                        <textarea name="excuse" placeholder="请输入审核理由" class="layui-textarea" id="checkMsg"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <a href="javascript:void(0);" class="layui-btn" id="ckBorrow">提交审核</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table','form', 'layer'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;

        table.render({
            elem: '#borrowList'
            ,url: '<%=path %>/data/borrow/adminList'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'money', title:'申请金额', width:90}
                ,{field:'bzname', title:'标种', width:80}
                ,{field:'type', title:'借款类别', width:90, templet:'<div>{{ formatType(d.type)}}</div>'}
                ,{field:'term', title:'还款期限', width:90, templet:'<div>{{d.term}}个月</div>'}
                ,{field:'cpname', title:'产品名称', width:150}
                ,{field:'way', title:'收益方式', width:90, templet:'<div>{{ formatWay(d.way)}}</div>'}
                ,{field:'nprofit', title:'年化利率', width:90, templet:'<div>{{d.nprofit}}%</div>'}
                ,{field:'ckstatus', title:'状态', width:90, templet:'<div>{{formatStatus(d.ckstatus)}}</div>'}
                ,{field:'deadline', title:'截止时间', width:180, sort: true, templet:'<div>{{ formatDate(d.deadline)}}</div>'}
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

        var $ = layui.$, active = {
            reload: function(){
                table.reload('checkId', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        cpname : $('#cpname').val()
                        ,bzid : $('#bzid').val()
                        ,term : $('#term').val()
                        ,ckstatus : $('#ckstatus').val()
                        ,nprofitMin : $('#nprofitMin').val()
                        ,nprofitMax : $('#nprofitMax').val()
                    }
                });
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type].call(this);
        });

        // 审核
        $('#checkBorrow').on('click', function(){
            var checkStatus = table.checkStatus('checkId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                var ckstatus = data[0].ckstatus;
                if(ckstatus === 0) {
                    layer.open({
                        type: 1,                //弹窗类型
                        title: '审核借款',     //显示标题
                        closeBtn: 1,         //是否显示关闭按钮
                        shadeClose: true, //显示模态窗口
                        fixed:false,    //层是否固定在可视区域
                        move: true,//禁止拖拽
                        area: ['400px', '270px'], //宽高
                        content: $("#checkFrame")  //弹窗内容
                    });
                    $('#baid').val(data[0].baid);
                } else {
                    layer.msg("审核完成，无需重复审核");
                }
            } else {
                layer.msg('请选中一行！', {time:1500});
            }
        });

        // 提交审核
        $('#ckBorrow').on('click', function(){
            $.post('<%=path %>/data/shBorrow/check'
                ,$('#ckForm').serialize()
                , function (data) {
                    layer.msg(data.message);
                    $('#searchBtn').trigger('click');
                },'json');
            layer.closeAll();
            $('#checkMsg').val('');
        });

        // 查看投资列表按钮
        $('#investShow').on('click', function () {
            var checkStatus = table.checkStatus('checkId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                var ckstatus = data[0].ckstatus;
                if(ckstatus === 2 || ckstatus === 4 || ckstatus === 5 || ckstatus === 3) {
                    layer.open({
                        type: 1,                //弹窗类型
                        title: '投资列表',     //显示标题
                        closeBtn: 1,         //是否显示关闭按钮
                        shadeClose: true, //显示模态窗口
                        fixed:false,    //层是否固定在可视区域
                        move: true,//禁止拖拽
                        area: ['600px', '400px'], //宽高
                        content: $("#investListShow")  //弹窗内容
                    });
                    table.render({
                        elem: '#investList'
                        ,url: '<%=path %>/data/tz/investUsers'
                        ,where:{
                            baid:data[0].baid
                        }
                        ,cols: [[
                            {field:'rname', title:'投资人', width:90}
                            ,{field:'money', title:'投资金额', width:120}
                            ,{field:'tztime', title:'投资时间', width:200, templet:'<div>{{ formatDate(d.tztime)}}</div>'}
                        ]]
                        ,id: 'investId'
                        ,page: true
                        ,height: 360
                        ,response: {
                            statusName: 'status'
                            ,statusCode: 0
                            ,msgName: 'message'
                            ,countName: 'total'
                            ,dataName: 'rows'
                        }
                    });
                } else {
                    layer.msg('该借款状态下无投资记录！', {time:1500});
                }
            } else {
                layer.msg('请选中一行！', {time:1500});
            }
        });

         // 查看还款计划按钮
        $('#planShow').on('click', function () {
            var checkStatus = table.checkStatus('checkId')
                ,data = checkStatus.data;
            if(data.length === 1) {
                var ckstatus = data[0].ckstatus;
                if(ckstatus === 5 || ckstatus === 4) {
                    layer.open({
                        type: 1,                //弹窗类型
                        title: '还款计划',     //显示标题
                        closeBtn: 1,         //是否显示关闭按钮
                        shadeClose: true, //显示模态窗口
                        fixed:false,    //层是否固定在可视区域
                        offset: 't',//快捷设置顶部坐标
                        move: true,//禁止拖拽
                        area: ['890px', '560px'], //宽高
                        content: $("#planListShow")  //弹窗内容
                    });
                    table.render({
                        elem: '#planList'
                        ,url: '<%=path %>/data/hkb/planList'
                        ,where:{
                            baid:data[0].baid
                        }
                        ,cols: [[
                            {checkbox: true, fixed: true}
                            ,{field:'rname', title:'真实姓名', width:90}
                            ,{field:'cpname', title:'产品名称', width:80}
                            ,{field:'bzname', title:'标种', width:80}
                            ,{field:'rnum', title:'已还期数', width:90}
                            ,{field:'tnum', title:'总期数', width:90}
                            ,{field:'ytime', title:'应还时间', width:120, templet:'<div>{{ formatDate(d.ytime)}}</div>'}
                            ,{field:'rtime', title:'实还时间', width:90, templet:'<div>{{ formatDate(d.rtime)}}</div>'}
                            ,{field:'ybx', title:'应还本息', width:90}
                            ,{field:'rbx', title:'已还本息', width:60}
                            ,{field:'ybj', title:'应还本金', width:60}
                            ,{field:'rbj', title:'已还本金', width:60}
                            ,{field:'ylx', title:'应还利息', width:60}
                            ,{field:'rlx', title:'已还利息', width:60}
                            ,{field:'yfc', title:'应还罚息', width:60}
                            ,{field:'rfc', title:'已还罚息', width:60}
                            ,{field:'yucount', title:'逾期次数', width:60}
                            ,{field:'status', title:'还款状态', width:180, sort: true, templet:'<div>{{formatHkStatus(d.status)}}</div>'}
                            ,{field:'huname', title:'负责人', width:180, sort: true}
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
                } else {
                    layer.msg('该借款状态下无还款计划！', {time:1500});
                }
            } else {
                layer.msg('请选中一行！', {time:1500});
            }
        });
    });
</script>
</html>
