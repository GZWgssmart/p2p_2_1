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
                            <%--// TODO 标种从数据库循环--%>
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

        <table id="borrowList"></table>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#borrowList'
            ,url: '<%=path %>/data/borrow/adminList'
            ,cols: [[
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
    });
</script>
</html>
