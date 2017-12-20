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
    <link rel="stylesheet" href="<%=path %>/static/css/app.css" media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">P2P_2_1</div>
        <ul class="layui-nav layui-layout-left kit-nav">
            <li class="layui-nav-item"><a href="javascript:;" id="control">按钮1</a></li>
            <li class="layui-nav-item"><a href="javascript:;" id="manger">按钮2</a></li>
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
                    <a class="" href="javascript:;"><span>文章</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" kit-target data-options="{url:'<%=path %>/article/allArticle',icon:'&#xe62d;',title:'我的文章',id:'1'}">
                                <i class="layui-icon">&#xe62d;</i><span>我的文章</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path %>/article/addArticle" data-icon="&#xe612;" data-title="发表文章" kit-target data-id='2'><i class="layui-icon">&#xe612;</i><span>发表文章</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="#" data-icon="&#xe628;" data-title="未通过文章" kit-target data-id='3'><i class="layui-icon">&#xe628;</i><span>未通过文章</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>评论</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'评论记录',id:'4'}"><i class="layui-icon">&#xe658;</i><span>评论记录</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'收到评论',id:'5'}"><i class="layui-icon">&#xe658;</i><span>收到评论</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><span>浏览记录</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'#',icon:'&#xe658;',title:'浏览记录',id:'6'}"><i class="layui-icon">&#xe658;</i><span>浏览记录</span></a></dd>
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
        base: '<%=path %>/static/js/'
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
        //弹出层
        $('#control').on('click', function() {
            layer.open({
                title: '控制台',
                maxmin: true,
                type: 1,
                content: '各种东西，详情请见：http://layer.layui.com/',
                area: ['800px', '500px'],
            });
        });

        $('#manger').on('click', function() {
            layer.msg('提示层，可以代替alert');
        });

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
