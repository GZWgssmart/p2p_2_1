<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/2
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户认证审核</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
</head>
<body>

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="getCheckData">审核</button>
</div>

<table id="allRvip" lay-filter="demo"></table>

<%--审核弹框--%>
<div style="display: none;" id="checkFrame">
    <form id="ckForm" name="shborrow" class="layui-form">
        <input type="hidden" id="baid" name="uid">
        <input type="hidden" name="huid" value="${admin.huid}">
        <div class="layui-form-item layui-col-md11">
            <label class="layui-form-label">审核状态</label>
            <div class="layui-input-block ">
                <select name="isok">
                    <option value="1">通过</option>
                    <option value="3">驳回</option>
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

<script type="text/html" id="isvip">
    {{#  if(d.isvip == 2){ }}
    <span>未审核</span>
    {{#  } else if(d.isvip == 3) { }}
    <span style="color:red;">未通过</span>
    {{#  } }}
</script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script>
    layui.use(['table', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;
        var laytpl = layui.laytpl;

        table.render({
            elem: '#allRvip'
            , url: '<%=path %>/data/vip/novip'
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'rname', title: '用户姓名', width: 170}
                , {field: 'idtype', title: '证件', width: 150}
                , {field: 'idno', title: '证件号', width: 190}
                , {field: 'work', title: '工作', width: 170}
                , {field: 'age', title: '年龄', width: 150}
                , {field: 'addr', title: '地址', width: 170}
                , {field: 'isvip', title: '是否vip', width: 90,templet:'#isvip'}
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

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        var active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                if(data.length === 1) {
                        layer.open({
                            type: 1,                //弹窗类型
                            title: 'vip审核',     //显示标题
                            closeBtn: 1,         //是否显示关闭按钮
                            shadeClose: true, //显示模态窗口
                            fixed:false,    //层是否固定在可视区域
                            move: true,//禁止拖拽
                            area: ['400px', '270px'], //宽高
                            content: $("#checkFrame")  //弹窗内容
                        });
                        $('#baid').val(data[0].uid);
                } else {
                    layer.msg('请选中一行！', {time:1500});
                }
            }
        };

        // 提交审核
        $('#ckBorrow').on('click', function(){
            $.post('<%=path %>/data/vip/checkVip',
                $('#ckForm').serialize(),
                function (res) {
                    if(res.code == 0) {
                        layer.msg('操作成功！',{time:1500},function () {
                            layer.closeAll();
                            $('#checkMsg').val('');
                        });
                    } else {
                        layer.msg('操作失败！',{time:1500},function () {
                            layer.closeAll();
                            $('#checkMsg').val('');
                        });
                    }
                    table.reload('idTest', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
            );

        });

    });
</script>
</body>
</html>
