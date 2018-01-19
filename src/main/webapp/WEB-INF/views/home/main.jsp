<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>平台一览</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
    
    <style>
        .main {
            margin-top: 25px;
        }
        
        .main .layui-row {
            margin: 10px 0;
        }
    </style>
</head>

<body>
<div style="text-align: center;width: 100%; margin-top: 10px">
    <h2>平台数据每天凌晨2：00更新，每月数据每月第一天初始化。</h2>
</div>
    <div class="layui-fluid main">
        <div class="layui-row layui-col-space15">
            <div class="about-content" id="sssjDiv" style="display: block;">
                <script id="demo" type="text/html">
                    <div class="btnDiv">
                        撮合交易总额（元）
                    </div>
                    <div class="moneyDiv" style="text-align:center;">
                        <div class="item_Div" style="padding-top: 20px">{{ d.tmoney }}.00</div>
                    </div>
                    <div class="btnDiv">平台数据总览</div>
                    <div class="sjList sjList-2">
                        <div class="item-yh" style="display: inline-block;">
                            <i class="icon-userTotal"></i>
                            <div class="itemText">总注册用户数（人）</div>
                            <div class="itemSJ color-b" id="userTotal">{{ d.tuser }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-investorCount"></i>
                            <div class="itemText">月注册人数（人）</div>
                            <div class="itemSJ color-g" id="investorCount">{{ d.muser }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-borrowerCount"></i>
                            <div class="itemText">总投资人数（人）</div>
                            <div class="itemSJ color-y" id="borrowerCount">{{ d.ttzno }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-avgUserInvest"></i>
                            <div class="itemText">月投资人数（人）</div>
                            <div class="itemSJ color-b" id="avgUserInvest">{{ d.mtzno }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-avgInvest"></i>
                            <div class="itemText">总贷款人数（人）</div>
                            <div class="itemSJ color-g" id="avgInvest">{{ d.tdkno }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-investorNew"></i>
                            <div class="itemText">月贷款人数（人）</div>
                            <div class="itemSJ color-y" id="investorNew">{{ d.mdkno }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-borrowerNew"></i>
                            <div class="itemText">总贷款笔数（笔）</div>
                            <div class="itemSJ color-b" id="borrowerNew">{{ d.tdkbno }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-AssociationNumber"></i>
                            <div class="itemText">月贷款笔数（笔）</div>
                            <div class="itemSJ color-g" id="AssociationNumber">{{ d.mdkbno }}</div>
                        </div>
                        <div class="item-yh">
                            <i class="icon-AssociationSum"></i>
                            <div class="itemText">月交易总额（元）</div>
                            <div class="itemSJ color-y" id="AssociationSum">{{ d.mmoney }}</div>
                        </div>
                    </div>
                </script>
            </div>
        </div>
        
    </div>
    <script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
    <script>
        layui.use(['element','laytpl'], function () {
            var $ = layui.jquery
            var element = layui.element;
            var laytpl = layui.laytpl;

            var getTpl = demo.innerHTML
                , view = document.getElementById('sssjDiv');
            $.get('/data/ydata/new',
                function (data) {
                    laytpl(getTpl).render(data, function (html) {
                        view.innerHTML = html;
                    });
                }
            );

        });
    </script>
</body>
</html>