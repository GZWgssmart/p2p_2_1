<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2017/12/26
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
    <head>
        <title>前台用户中心</title>
        <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/datepicker.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/login.css">
        <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
        <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
    </head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>
    <%--信息披露里的左侧边栏--%>
    <%--<%@include file="../master/aboutLeft.jsp"%>--%>
    <div class="account-right">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">推荐好友</li>
                <li>推荐列表</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;" style="float: left;">
                <div class="layui-tab-item layui-show">
                    <div class="tuiJianShow">
                        <img src="<%=path %>/static/images/banner_t.png" width="896" height="260">
                        <p class="tj-tips">尊敬的用户,您的推荐号为：<span class="uid"></span></p>
                        <p class="tj-text">活动时间：<span>2017年12月15日—2018年1月15日；</span></p>
                        <p class="tj-text">活动对象：活动期间新注册用户的推荐人；</p>
                        <p class="tj-text">活动说明：1. 活动期间邀请好友注册并累计投资满10000元，得50元现金券奖励；</p>
                        <p class="tj-text" style="padding-left: 70px;">2.
                            活动期间内成功邀请50位以上好友注册投资成功合计满100000，可额外获得500元现金券奖励，可在<span>【我的账户-我的赠券】</span>中查看。</p>
                        <p class="tj-text" style="padding-left: 70px;">(满足活动条件的用户在活动结束后3个工作日内奖励将以现金券的形式发放至用户账户)</p>
                        <p class="tj-text"><span>注：</span>需将自己的推荐号发给您的好友，这样您才能成为他的邀请者。</p>
                        <input class="tj-clip"/>
                        <input class="tj-clip-text" id="userCode"/>
                    </div>
                    <div class="tj-icon">
                        <ul>
                            <li>
                                <a target="_blank"
                                   href="http://connect.qq.com/widget/shareqq/index.html?url=http://www.pujinziben.com&amp;desc=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;title=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;pics=http://www.pujinziben.com/resources/front/v01/src/images/logo.png&amp;summary=%E8%BF%98%E4%B8%8D%E9%94%99%E5%93%A6&amp;site=QQ%E5%88%86%E4%BA%AB&amp;style=201&amp;width=32&amp;height=32"
                                   class="about_qq">
                                    <p class="icon icon-QQ"></p>
                                </a>
                                <p>分享到QQ</p>
                            </li>
                            <li>
                                <a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http://www.pujinziben.com/&amp;title=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8">
                                    <p class="icon icon-qzone"></p>
                                </a>
                                <p>分享到QQ空间</p>
                            </li>
                            <li>
                                <a target="_blank"
                                   href="http://service.weibo.com/share/share.php?url=http://www.pujinziben.com&amp;title=%E6%99%AE%E9%87%91%E8%B5%84%E6%9C%AC%E8%BF%90%E8%90%A5(%E8%B5%A3%E5%B7%9E)%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;appkey=1343713053&amp;searchPic=true"
                                   class="about_sina">
                                    <p class="icon icon-Sina"></p>
                                </a>
                                <p>分享到新浪微博</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="layui-form">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" class="layui-input" name="first" id="first" placeholder="开始时间">
                                </div>
                            </div>
                            <span>至</span>&nbsp;&nbsp;&nbsp;
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" class="layui-input" name="end" id="end" placeholder="结束时间">
                                </div>
                            </div>
                            <div class="searchType layui-inline">
                                <button class="layui-btn layui-btn-primary" data-type="reload">搜索</button>
                            </div>
                        </div>
                    </div>
                    <table id="allRecommend_table" lay-filter="demo"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    $(function () {
        $(".uid").text(100000 +${user.uid});
        $('#userCode').val('http://localhost:8080/page/reg?' + (100000 +${user.uid}));
    });
    layui.use(['element', 'table', 'laydate'], function () {
        var $ = layui.jquery
            , element = layui.element
            , table = layui.table;
        var laydate = layui.laydate;

        table.render({
            elem: '#allRecommend_table'
            , url: '<%=path %>/data/recommend/pagerCriteria?tid=' +${user.uid}
            , cols: [[
                 {field: 'rname', title: '被推荐人', width: 340}
                , {
                    field: 'createdTime',
                    title: '注册时间',
                    width: 340,
                    sort: true,
                    templet: '<div>{{ formatDate(d.createdTime) }}</div>'
                }
            ]]
            , id: 'idTest'
            , page: true
            , width: 800
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
        });
        laydate.render({
            elem: '#first',
            type: 'datetime',
            done:function (value) {
                laydate.render({
                    elem: '#end'
                    ,type:'datetime'
                    ,min:value
                    });
                }
        });

        $('.searchType .layui-btn').on('click', function () {
            var type = $(this).data('type');
            search[type] ? search[type].call(this) : '';
        });

        var search = {
            reload: function () {
                var first = $('#first').val();
                var end = $('#end').val();

                //执行重载
                table.reload('idTest', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        first: first,
                        end: end
                    }
                });
            }
        };
    });
</script>
</html>
