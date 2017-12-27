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
        <h1>借款管理</h1>
        <hr/>
        <div class="layui-row">
            <form id="borrowQuery">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" id="cpname" name="cpname" placeholder="请输入产品名称" class="layui-input layui">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <input type="text" id="nprofit" name="nprofit" placeholder="请输入利率" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <select name="bzid" id="bzid">
                            <%--// TODO 标种从数据库循环--%>
                            <option value="">请选择标种</option>
                            <option value="1">恒金宝</option>
                            <option value="2">普金宝</option>
                            <option value="3">多金宝</option>
                            <option value="4">新手标</option>
                        </select>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <select name="term" id="term">
                                <option value="">请选择借款期限</option>
                                <option value="3">3个月</option>
                                <option value="6">6个月</option>
                                <option value="12">12个月</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <select name="ckstatus" id="ckstatus">
                                <option value="">请选择借款状态</option>
                                <option value="0">审核中</option>
                                <option value="1">审核失败</option>
                                <option value="2">投标中</option>
                                <option value="3">已流标</option>
                                <option value="4">还款中</option>
                                <option value="5">已完成</option>
                            </select>
                        </div>
                    </div>
                </div>
                <a href="javascript:void(0);" class="layui-btn" id="searchBtn" data-type="reload">搜索</a>
            </form>
        </div>

        <table id="borrowList"></table>
    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    function formatType(type) {
        return type === 1 ? "个人" : "企业";
    }

    function formatWay(way) {
        if(way === '1') {
            return "等额本息";
        } else if(way === '2') {
            return "等额本金";
        } else if(way === '3') {
            return "先息后本";
        } else if(way === '4') {
            return "一次还清";
        }
    }

    function formatStatus(status) {
        if(status === 0) {
            return "审核中";
        } else if(status === 1) {
            return "审核失败";
        } else if(status === 2) {
            return "借款中";
        } else if(status === 3) {
            return "已流标";
        } else if(status === 4) {
            return "还款中";
        } else if(status === 5) {
            return "已完成";
        }
    }

    var head = [[
        {checkbox: true, fixed: true}
        ,{field:'baid', title:'ID', width:50, fixed: 'left'}
        ,{field:'money', title:'申请金额', width:90}
        ,{field:'bzname', title:'标种', width:80}
        ,{field:'type', title:'借款类别', width:90, templet:'<div>{{ formatType(d.type)}}</div>'}
        ,{field:'term', title:'还款期限', width:90, templet:'<div>{{d.term}}个月</div>'}
        ,{field:'cpname', title:'产品名称', width:120}
        ,{field:'way', title:'收益方式', width:90, templet:'<div>{{ formatWay(d.way)}}</div>'}
        ,{field:'nprofit', title:'年化利率', width:90, templet:'<div>{{d.nprofit}}%</div>'}
        ,{field:'ckstatus', title:'状态', width:60, templet:'<div>{{formatStatus(d.ckstatus)}}</div>'}
        ,{field:'deadline', title:'截止时间', width:180, sort: true, templet:'<div>{{ formatDate(d.deadline)}}</div>'}
    ]];

    <%--function searchBorrow() {--%>
        <%--layui.use(['table'], function() {--%>
            <%--var table = layui.table;--%>
            <%--table.render({--%>
                <%--elem: '#borrowList'--%>
                <%--, clos: head--%>
                <%--, url: '<%=path %>/data/borrow/list'--%>
                <%--, id: 'checkId'--%>
                <%--, where: {--%>
                    <%--borrowQuery: $('#borrowQuery').serialize()--%>
                <%--}--%>
                <%--, page: {--%>
                    <%--curr: 1--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--}--%>



    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#borrowList'
            ,url: '<%=path %>/data/borrow/list'
            ,cols: head
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
                        ,nprofit : $('#nprofit').val()
                    }
                });
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type].call(this);
        });
    });
            <%--$.post('<%=path %>/data/borrow/list',--%>
                <%--$('#borrowQuery').serialize(),--%>
                <%--function (res) {--%>
                    <%--if (res.code === 0) {--%>
                        <%--var search = {--%>
                            <%--reload: function(){--%>
                                <%--table.reload('checkId', {--%>
                                    <%--page: {--%>
                                        <%--curr: 1 //重新从第 1 页开始--%>
                                    <%--},where: {--%>

                                    <%--}--%>
                                <%--});--%>
                            <%--}--%>
                        <%--}--%>
                    <%--} else {--%>
                        <%--layer.msg(res.message);--%>
                    <%--}--%>
                <%--}, 'json');--%>
        <%--}--%>

//        //监听表格复选框选择
//        table.on('checkbox(borrowList)', function(obj){
//            console.log(obj)
//        });
//        //监听工具条
//        table.on('tool(borrowList)', function(obj){
//            var data = obj.data;
//            if(obj.event === 'detail'){
//                layer.msg('ID：'+ data.id + ' 的查看操作');
//            } else if(obj.event === 'del'){
//                layer.confirm('真的删除行么', function(index){
//                    obj.del();
//                    layer.close(index);
//                });
//            } else if(obj.event === 'edit'){
//                layer.alert('编辑行：<br>'+ JSON.stringify(data))
//            }
//        });
//
//        $('.demoTable .layui-btn').on('click', function(){
//            var type = $(this).data('type');
//            active[type] ? active[type].call(this) : '';
//        });

        <%--var active = {--%>
            <%--getCheckData: function(){ //获取选中数据--%>
                <%--var checkStatus = table.checkStatus('checkId')--%>
                    <%--,data = checkStatus.data;--%>
                <%--layer.alert(JSON.stringify(data));--%>
            <%--}--%>
            <%--,getCheckLength: function(){ //获取选中数目--%>
                <%--var checkStatus = table.checkStatus('checkId')--%>
                    <%--,data = checkStatus.data;--%>
                <%--layer.msg('选中了：'+ data.length + ' 个');--%>
            <%--}--%>
            <%--,isAll: function(){ //验证是否全选--%>
                <%--var checkStatus = table.checkStatus('checkId');--%>
                <%--layer.msg(checkStatus.isAll ? '全选': '未全选')--%>
            <%--}--%>
            <%--,detail: function(){ //文章详情--%>
                <%--var checkStatus = table.checkStatus('checkId')--%>
                    <%--,data = checkStatus.data;--%>
                <%--if(data.length == 1) {--%>
                    <%--layer.open({--%>
                        <%--type: 2,--%>
                        <%--title: '文章的详情',--%>
                        <%--shadeClose: true,--%>
                        <%--shade: false,--%>
                        <%--maxmin: true, //开启最大化最小化按钮--%>
                        <%--area: ['893px', '600px'],--%>
                        <%--content: '<%=path %>/article/detailsPage?articleId=' + data[0].id--%>
                    <%--});--%>
                <%--} else {--%>
                    <%--layer.msg('请选中一行！', {time:1500});--%>
                <%--}--%>
            <%--}--%>
            <%--,delete: function(){ //验证是否全选--%>
                <%--var checkStatus = table.checkStatus('checkId')--%>
                    <%--,data = checkStatus.data;--%>
                <%--if(data.length == 1) {--%>
                    <%--layer.confirm('真的删除行么', function(index){--%>
                        <%--layer.msg('假装删除了');--%>
                        <%--layer.close(index);--%>
                    <%--});--%>
                <%--} else {--%>
                    <%--layer.msg('请选中一行！', {time:1500});--%>
                <%--}--%>
            <%--}--%>
        <%--};--%>



        <%--$('.searchType .layui-btn').on('click', function(){--%>
            <%--var type = $(this).data('type');--%>
            <%--search[type] ? search[type].call(this) : '';--%>
        <%--});--%>

//        var search = {
//            reload: function(){
//                var typeName = $('#typeName');
//                var title = $('#title');
//                //执行重载
//                table.reload('checkId', {
//                    page: {
//                        curr: 1 //重新从第 1 页开始
//                    }
//                    ,where: {
//                        typeName: typeName.val()
//                        ,title: title.val()
//                    }
//                });
//            }

</script>
</html>
