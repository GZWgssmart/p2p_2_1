<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2017/12/12
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>后台</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="<%=path %>/static/css/home/app.css" media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">P2P_2_1</div>
        <ul class="layui-nav layui-layout-left kit-nav">
            <li class="layui-nav-item">
                <!-- 天气信息-->
                <div class="weather" pc>
                    <div id="tp-weather-widget"></div>
                    <script>(function (T, h, i, n, k, P, a, g, e) {
                        g = function () {
                            P = h.createElement(i);
                            a = h.getElementsByTagName(i)[0];
                            P.src = k;
                            P.charset = "utf-8";
                            P.async = 1;
                            a.parentNode.insertBefore(P, a)
                        };
                        T["ThinkPageWeatherWidgetObject"] = n;
                        T[n] || (T[n] = function () {
                            (T[n].q = T[n].q || []).push(arguments)
                        });
                        T[n].l = +new Date();
                        if (T.attachEvent) {
                            T.attachEvent("onload", g)
                        } else {
                            T.addEventListener("load", g, false)
                        }
                    }(window, document, "script", "tpwidget", "//widget.seniverse.com/widget/chameleon.js"))</script>
                    <script>tpwidget("init", {
                        "flavor": "slim",
                        "location": "WX4FBXXFKE4F",
                        "geolocation": "enabled",
                        "language": "zh-chs",
                        "unit": "c",
                        "theme": "chameleon",
                        "container": "tp-weather-widget",
                        "bubble": "disabled",
                        "alarmType": "badge",
                        "color": "#FFFFFF",
                        "uid": "U9EC08A15F",
                        "hash": "039da28f5581f4bcb5c799fb4cdfb673"
                    });
                    tpwidget("show");</script>
                </div>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right kit-nav">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="<%=path %>/static/images/face.jpg" class="layui-nav-img"> ${user.name }
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" id="info">基本资料</a></dd>
                    <dd><a href="<%=path %>/user/outTest">注销</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="<%=path %>/"><i class="fa fa-sign-out" aria-hidden="true"></i> 首页</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black kit-side">
        <div class="layui-side-scroll">
            <div class="kit-side-fold"><i class="layui-icon" aria-hidden="true">&#xe603;</i></div>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><span>公司动态</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" kit-target data-options="{url:'<%=path %>/page/company/mediaReport',icon:'&#xe62d;',title:'所有报道',id:'1'}">
                                <i class="layui-icon">&#xe62d;</i><span>所有报道</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path %>/page/company/addMediaReportPage" data-icon="&#xe61f;" data-title="添加报道" kit-target data-id='2'>
                                <i class="layui-icon">&#xe61f;</i><span>添加报道</span></a>
                        </dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'所有动态',id:'3'}"><i class="layui-icon">&#xe658;</i><span>所有动态</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe61f;',title:'添加动态',id:'4'}"><i class="layui-icon">&#xe61f;</i><span>添加动态</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>借款管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'借款类型',id:'10'}"><i class="layui-icon">&#xe658;</i><span>借款类型</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'借款审核',id:'11'}"><i class="layui-icon">&#xe658;</i><span>借款审核</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'标种',id:'12'}"><i class="layui-icon">&#xe658;</i><span>标种</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'还款方式',id:'13'}"><i class="layui-icon">&#xe658;</i><span>还款方式</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>认证管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'vip用户',id:'20'}"><i class="layui-icon">&#xe658;</i><span>vip用户</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'认证审核',id:'21'}"><i class="layui-icon">&#xe658;</i><span>认证审核</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>奖励管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'vip用户',id:'30'}"><i class="layui-icon">&#xe658;</i><span>投资奖励</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'认证审核',id:'31'}"><i class="layui-icon">&#xe658;</i><span>优惠券</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>信息管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'最新公告',id:'40'}"><i class="layui-icon">&#xe658;</i><span>最新公告</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'站内信',id:'41'}"><i class="layui-icon">&#xe658;</i><span>站内信</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'合作伙伴',id:'42'}"><i class="layui-icon">&#xe658;</i><span>合作伙伴</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>角色权限</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'后台用户管理',id:'50'}"><i class="layui-icon">&#xe658;</i><span>后台用户管理</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'权限管理',id:'51'}"><i class="layui-icon">&#xe658;</i><span>权限管理</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'添加后台用户',id:'52'}"><i class="layui-icon">&#xe658;</i><span>添加后台用户</span></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="container">
        <!-- 内容主体区域 ,修改main路劲的话要去tab.js下改动，所以我们到时候规定好一个main页面-->
        <div style="padding: 15px;">主体内容加载中,请稍等...</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        2017 &copy;
        <a href="https://github.com/ZhengYouzhen">P2P</a>

    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    var message;
    layui.config({
        base: '<%=path %>/static/js/home/'
    }).use(['app', 'message'], function() {
        var app = layui.app,
            $ = layui.jquery,
            layer = layui.layer
        //将message设置为全局以便子页面调用
        message = layui.message;
        //主入口
        app.set({
            type: 'iframe'
        }).init();
        //信息
        $('#info').on('click', function() {
            layer.prompt(function(val, index){
                layer.msg('得到了'+val);
                layer.close(index);
            });
        });

    });

</script>
</body>
</html>
