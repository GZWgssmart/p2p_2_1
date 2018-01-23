<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
                    <img src="<%=path %>/static/images/face.jpg" class="layui-nav-img"> <sapn id="rname">${admin.rname }</sapn>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" id="info">基本资料</a></dd>
                    <dd><a href="javascript:;" id="out">注销</a></dd>
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
                <%--设置奖励和审核--%>
                <shiro:hasPermission name="manage">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><span>借款管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/jklx/jklxTypeList',icon:'&#xe658;',title:'借款类型',id:'10'}"><i class="layui-icon">&#xe658;</i><span>借款类型</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/borrowApply/adminBorrowList',icon:'&#xe658;',title:'借款管理',id:'11'}"><i
                                    class="layui-icon">&#xe658;</i><span>借款管理</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/borrowApply/investManage',icon:'&#xe658;',title:'投资管理',id:'14'}"><i
                                    class="layui-icon">&#xe658;</i><span>投资管理</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/rewardSet/rewardList',icon:'&#xe658;',title:'投资奖励管理',id:'64'}"><i
                                    class="layui-icon">&#xe658;</i><span>投资奖励管理</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/bz/bzList',icon:'&#xe658;',title:'标种',id:'12'}"><i class="layui-icon">&#xe658;</i><span>标种</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path%>/page/sway/swayList',icon:'&#xe658;',title:'还款方式',id:'13'}"><i class="layui-icon">&#xe658;</i><span>还款方式</span></a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><span>认证管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/vip/userVipPage',icon:'&#xe658;',title:'用户',id:'20'}"><i class="layui-icon">&#xe658;</i><span>用户</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/vip/vip',icon:'&#xe658;',title:'认证审核',id:'21'}"><i class="layui-icon">&#xe658;</i><span>认证审核</span></a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><span>奖励管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/rewardSet/rewardSet',icon:'&#xe658;',title:'投资奖励设置',id:'30'}"><i class="layui-icon">&#xe658;</i><span>投资奖励设置</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/vip/quan',icon:'&#xe658;',title:'优惠券',id:'31'}"><i class="layui-icon">&#xe658;</i><span>优惠券</span></a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
                <%--添加信息--%>
                <shiro:hasPermission name="message">
                    <li class="layui-nav-item">
                        <a class="" href="javascript:;"><span>公司动态</span></a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/company/mediaReport',icon:'&#xe62d;',title:'所有报道',id:'1'}">
                                    <i class="layui-icon">&#xe62d;</i><span>所有报道</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path %>/page/company/addMediaReportPage"
                                   data-icon="&#xe61f;" data-title="添加报道" kit-target data-id='2'>
                                    <i class="layui-icon">&#xe61f;</i><span>添加报道</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/dynamic/dynamicPage',icon:'&#xe658;',title:'所有动态',id:'3'}"><i
                                    class="layui-icon">&#xe658;</i><span>所有动态</span></a></dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/dynamic/addDynamicPage',icon:'&#xe61f;',title:'添加动态',id:'4'}"><i
                                    class="layui-icon">&#xe61f;</i><span>添加动态</span></a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><span>信息管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/message/allNotice',icon:'&#xe658;',title:'最新公告',id:'40'}">
                                <i class="layui-icon">&#xe658;</i><span>最新公告</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/message/addNotice',icon:'&#xe61f;',title:'添加公告',id:'44'}">
                                <i class="layui-icon">&#xe61f;</i><span>添加公告</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path%>/page/message/allLetter',icon:'&#xe658;',title:'站内信',id:'41'}">
                                <i class="layui-icon">&#xe658;</i><span>站内信</span></a>
                            </dd>
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/message/addLetter',icon:'&#xe658;',title:'添加站内信',id:'48'}">
                                <i class="layui-icon">&#xe658;</i><span>添加站内信</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/message/allFriend',icon:'&#xe62d;',title:'合作伙伴',id:'42'}">
                                    <i class="layui-icon">&#xe62d;</i><span>合作伙伴</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/message/addFriend',icon:'&#xe61f;',title:'添加合作伙伴',id:'43'}">
                                    <i class="layui-icon">&#xe61f;</i><span>添加合作伙伴</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/home/indexMsg',icon:'&#xe62d;',title:'首页信息',id:'45'}">
                                    <i class="layui-icon">&#xe62d;</i><span>首页信息</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/home/addIndexMsgPage',icon:'&#xe61f;',title:'添加首页信息',id:'46'}">
                                    <i class="layui-icon">&#xe61f;</i><span>添加首页信息</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:;" kit-target
                                   data-options="{url:'<%=path %>/page/message/Dxmodel',icon:'&#xe61f;',title:'短信模板管理',id:'61'}">
                                    <i class="layui-icon">&#xe61f;</i><span>短信模板管理</span></a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
                    <%--root用户可见--%>
                    <shiro:hasPermission name="root">
                        <li class="layui-nav-item">
                            <a href="javascript:;"><span>角色权限管理</span></a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" kit-target
                                       data-options="{url:'<%=path%>/page/Jur/List',icon:'&#xe658;',title:'权限管理',id:'47'}"><i class="layui-icon">&#xe658;</i><span>权限管理</span></a>
                                </dd>
                                <dd><a href="javascript:;" kit-target
                                       data-options="{url:'<%=path%>/page/Role/List',icon:'&#xe658;',title:'角色管理',id:'49'}"><i class="layui-icon">&#xe658;</i><span>角色管理</span></a>
                                </dd>
                            </dl>
                        </li>
                    </shiro:hasPermission>
                <%--root用户可见--%>
                <shiro:hasPermission name="root">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><span>用户管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target
                                   data-options="{url:'<%=path%>/page/admin/List',icon:'&#xe658;',title:'后台用户管理',id:'51'}"><i
                                    class="layui-icon">&#xe658;</i><span>后台用户管理</span></a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="container">、
        <!-- 内容主体区域 ,修改main路劲的话要去tab.js下改动，所以我们到时候规定好一个main页面-->
        <div style="padding: 15px;">主体内容加载中,请稍等...</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        2017 &copy;
        <a href="https://github.com/ZhengYouzhen">P2P</a>

    </div>
</div>

<div style="display: none;" id="editIndexMsg">
    <form class="layui-form" id="huserForm">
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input type="text" name="rname" autocomplete="off" placeholder="请输入昵称" class="layui-input"
                       value="${admin.rname}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="hidden" name="sex" value=0 checked/>
                <input type="radio" name="sex" value=1 title="男"/>
                <input type="radio" name="sex" value=2 title="女"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="text" name="phone" autocomplete="off" placeholder="请输入手机号" class="layui-input"
                       value="${admin.phone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input type="text" name="huname" autocomplete="off" placeholder="请输入真实姓名" class="layui-input"
                       value="${admin.huname}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" autocomplete="off" placeholder="请输入邮箱" class="layui-input"
                       value="${admin.email}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">组织</label>
            <div class="layui-input-block">
                <input type="text" name="oname" class="layui-input" value="${admin.oname}" disabled>
            </div>
        </div>
        <input type="hidden" name="huid" value="${admin.huid}"/>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit">修改信息</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    $("input[name='sex'][value=${admin.sex}]").attr("checked",true);
    var message;
    layui.config({
        base: '<%=path %>/static/js/home/'
    }).use(['app', 'message', 'form'], function () {
        var app = layui.app,
            $ = layui.jquery,
            layer = layui.layer
        //将message设置为全局以便子页面调用
        message = layui.message;
        var form = layui.form;
        //主入口
        app.set({
            type: 'iframe'
        }).init();


        //信息
        $('#info').on('click', function () {
            layer.open({
                type: 1,                //弹窗类型
                title: '编辑个人信息',     //显示标题
                closeBtn: 1,         //是否显示关闭按钮
                shadeClose: true, //显示模态窗口
                fixed: false,    //层是否固定在可视区域
                move: false,//禁止拖拽
                area: ['890px', '560px'], //宽高
                content: $("#editIndexMsg")  //弹窗内容
            });
        });

        $('#out').on('click', function () {
            $.get('<%=path %>/data/admin/out',
              function (data) {
                  if(data.code == 0) {
                      window.location = '/page/admin/login'
                  } else {
                      layer.msg('注销失败！');
                  }
              }
            );
        });

        //修改信息
        form.on('submit(edit)', function (data) {
            $.post('<%=path %>/data/admin/edit',
                $('#huserForm').serialize(),
                function (res) {
                    if (res.code === 0) {
                        layer.closeAll();
                        layer.msg('修改成功！');
                        $('#rname').empty();
                        $('#rname').text(res.data.rname);
                    } else {
                        layer.msg("修改失败，请重新再试")
                    }
                }, 'json'
            );
            return false;
        });

    });

</script>
</body>
</html>
