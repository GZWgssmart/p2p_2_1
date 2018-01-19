<%--
  Created by IntelliJ IDEA.
  User: ccf
  Date: 2018/1/9
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
    <title>平台公告</title>
    <link rel="stylesheet" href="<%=path%>/static/css/ccf_css/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/ccf_css/about.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">

    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>

<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="about cl">
<%@include file="../../master/aboutLeft.jsp" %>
<!-- begin -->
    <div class="about-right">
        <div class="layui-tab layui-tab-brief" lay-filter="test1" style="float: left;">
            <ul class="layui-tab-title">
                <li class="layui-this">平台公告</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <%--渲染数据的div--%>
                    <div id="allNotice">
                        <script type="text/html" id="demoNotice">
                            {{#  layui.each(d, function(index, notice){ }}
                            <div class="layui-row" style="margin-top: 5px;width:890px">
                                <div>
                                    <h2>
                                        <a href="<%=path %>/page/about/noticeDetail?noticeId={{notice.nid}}">
                                            {{notice.title}}
                                        </a>
                                    </h2>
                                    <div style="float:right; color:#c1c1c1" >{{formatDateTime(notice.createdTime)}}</div>
                                </div>
                            </div>
                            <div style="margin-top:25px;border:1px #ebebeb dotted;"></div>
                            {{#  }); }}
                        </script>
                    </div>
                    <div id="allnotice"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../../master/footer.jsp" %>
<!--[if lt IE 9]>
<script src="js/json2.js"></script>
<![endif]-->
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>

<script>
    layui.use(['element', 'laypage', 'laytpl'], function () {
        var $ = layui.$;
        var laypage = layui.laypage;
        var laytpl = layui.laytpl;
        var element = layui.element;

        var layid = location.hash.replace(/^#test1=/, '');
        element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

        //监听Tab切换，以改变地址hash值
        element.on('tab(test1)', function () {
            location.hash = 'test1=' + this.getAttribute('lay-id');
        });

        var page = 1; // 第一页开始
        var limit = 10; // 每页十个数据，laypage默认也是十个

        var getTpl0 = $('#demoNotice').html()
            , view0 = document.getElementById('allNotice');
        // 获取公司动态数据
        $.get('<%=path %>/data/message/pagerNotice', {
            page: page,
            limit: limit
        }, function (data) {
            //数据返回成功后，data.rows一页的数据，data.total统计的总数据量   fenye() 渲染数据，pageTotal()分页组件
            fenyeNotice(data.rows);
            pageTotalNotice(data.total)
        });

        // 渲染数据
        function fenyeNotice(data) {
            laytpl(getTpl0).render(data, function (html) {
                view0.innerHTML = html;
            });
        }

        // 分页组件
        function pageTotalNotice(total) {
            laypage.render({
                elem: 'allnotice'
                , count: total
                , jump: function (obj, first) {//obj包含了当前分页的所有参数
                    //在点击页号和上下页的时候重新加载数据
                    if (!first) {
                        $.get('<%=path %>/data/message/pagerNotice', {
                            page: obj.curr,//得到当前页，以便向服务端请求对应页的数据。
                            limit: obj.limit//得到每页显示的条数
                        }, function (data) {
                            fenyeNotice(data.rows);
                        });
                    }
                }
            });
        }
    });

</script>

</body>
</html>