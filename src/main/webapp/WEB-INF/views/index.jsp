<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/22
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>普金资本</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/home/jquery.slider.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/index.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="master/top.jsp"%>
<%@include file="master/header.jsp"%>
    <div class="layui-row">
        <!-- banner -->
        <div class="banner" id="view">
                 <div class="slider">
                    <div><a href="" id="url1"><img src=""  id="pic1"alt="" style="width:100%;height:340px"></a></div>
                    <div><a href="" id="url2"><img src="" id="pic2" alt="" style="width:100%;height:340px"></a></div>
                    <div><a href="" id="url3"><img src="" id="pic3" alt="" style="width:100%;height:340px"></a></div>
                 </div>
        </div>
        <div class="news">
            <div class="wrap">
                <div class="news-list icon icon-news">
                    <ul id="news-list" style="height: 192px; top: -144px;">
                        <li>
                            <span>平台公告&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                            <a href="https://www.pujinziben.com/news.html?id=199&amp;flag=1" target="_blank">
                                关于新手标项目正常还款的公告
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="bang-list">
                    <a href="https://www.pujinziben.com/board.html" target="_blank" class="icon icon-bang">投资、推荐排行榜</a>
                </div>
            </div>
        </div>
        <!-- statis -->
        <div class="statis">
            <div class="wrap">
                <div class="statis-main">
                    <ul class="statis-top cl">
                        <li class="first">
                            <p>普金资本高收益网络借贷信息中介平台
                            </p>
                        </li>
                        <li class="center">
                            <p>
                                累计投资金额：
                                <span id="investAmount">33,888,145.00</span>
                                <span class="small">元</span>
                            </p>
                        </li>
                        <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                        <li class="last">
                            <p>
                                累计注册投资人：
                                <span id="userTotal">11,219</span>
                                <span class="small">人</span>
                            </p>
                        </li>
                    </ul>
                    <div class="explian cl">
                        <a href="<%=path %>/page/about/aboutwe" class="first">
                            <p class="icon icon-ex1"></p>
                            <div class="text">
                                <h3 style="color:black;">实力雄厚</h3>
                                <p>国资背景，抱柱之信</p>
                                <p>赣州城投旗下参股企业</p>
                            </div>
                        </a>
                        <a href="<%=path %>/statically/insurance" class="center">
                            <p class="icon icon-ex2"></p>
                            <div class="text">
                                <h3 style="color:black;">安全稳健</h3>
                                <p>专注城投供应链金融服务</p>
                                <p>银行级风控措施+大数据</p>
                            </div>
                        </a>
                        <!-- <a href="activity/activity_01.html" class="last" target="_blank"> -->
                        <a href="<%=path %>/" class="last">
                            <p class="icon icon-ex3"></p>
                            <div class="text">
                                <h3 style="color:black;">新手福利</h3>
                                <p>新用户投资即获红包</p>
                                <p>推荐用户投资得红包</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- product -->
        <div class="product wrap">
            <div class="product-n" id="newUser">
                <div class="product-new">
                    <div class="title cl"><img alt="" src="<%=path %>/static/images/index/product-new-icon2.png"></div>
                    <ul class="product-new-main cl">
                        <li class="rate cl">
                            <p><span id="ty-rate">12</span>%</p>
                            <span>预期年化收益率</span>
                        </li>
                        <li class="date">
                            <div class="date-item">
                                <div class="line icon icon-progress">
                                    <p>募集进度：</p>
                                    <p class="progress"><em style="width: 100%;"></em></p>
                                    <p class="progress-text"><span id="xs-schedules">100.00</span>%</p>
                                </div>
                                <p class="icon icon-doll">项目金额：<span id="xs-doll">10.00万元</span></p>
                                <p class="icon icon-time">投资期限：<span id="ty-date">1个月</span></p>
                            </div>
                        </li>
                        <li>
                            <div class="button">
                                <button type="button" id="ty-btn" disabled="disabled" style="background-color: rgb(176, 176, 176);">已还完</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 恒金保 -->
            <div class="product-h" id="pj_hengjin">
                <div class="product-h-l">
                    <img src="<%=path %>static/images/index/product_01.png" alt="恒金保">
                    <a href="https://www.pujinziben.com/product.html#hengjinb" class="top"></a>
                    <a href="https://www.pujinziben.com/investlist.html#006" class="bottom"></a>
                </div>
                <div class="product-h-m">
                    <ul class="product-list" id="product-h">
                        <li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=391">YC2017TD0009</a></p><p class="p-rate"><span>9+1</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：20.87万元</p><p class="icon icon-time">投资期限：6个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(391,4)">还款中</button></div></div></li><li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=386">YC2017TD0008</a></p><p class="p-rate"><span>9</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：27.40万元</p><p class="icon icon-time">投资期限：6个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(386,4)">还款中</button></div></div></li><li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=366">YC2017TD0007</a></p><p class="p-rate"><span>9</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：14.00万元</p><p class="icon icon-time">投资期限：6个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(366,4)">还款中</button></div></div></li></ul>
                </div>
            </div>
            <!-- 普金保 -->
            <div class="product-h" id="pj_pujin">
                <div class="product-h-l">
                    <img src="<%=path %>static/images/index/product_02.png" alt="多金保">
                    <a href="https://www.pujinziben.com/product.html#pujinb" class="top"></a>
                    <a href="https://www.pujinziben.com/investlist.html#004" class="bottom"></a>
                </div>
                <div class="product-h-m">
                    <ul class="product-list" id="product-p">
                        <li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=383">PJ2017BZ0030(2)</a></p><p class="p-rate"><span>10</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(383,4)">还款中</button></div></div></li><li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=382">PJ2017BZ0030(1)</a></p><p class="p-rate"><span>10</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(382,4)">还款中</button></div></div></li><li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=327">PJ2016BZ0006</a></p><p class="p-rate"><span>10</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：20.00万元</p><p class="icon icon-time">投资期限：3个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(327,5)">已还完</button></div></div></li></ul>
                </div>
            </div>
            <!-- 多金宝 -->
            <div class="product-h" id="pj_duojin">
                <div class="product-h-l">
                    <img src="<%=path %>static/images/index/product_03.png" alt="多金宝">
                    <a href="https://www.pujinziben.com/product.html#duojinb" class="top"></a>
                    <a href="https://www.pujinziben.com/investlist.html#003" class="bottom"></a>
                </div>
                <div class="product-h-m">
                    <ul class="product-list" id="product-d">

                        <li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=410">PJ2017BZ0051</a></p><p class="p-rate"><span>9+1</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:10.13%"></em></p><p class="progress-text">10.13%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div><div class="submit"><button type="button" class="submit" onclick="toInvest(410,2)">立即投标</button></div></div></li><li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=413">PJ2017BZ0047</a></p><p class="p-rate"><span>9+1</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：20.00万元</p><p class="icon icon-time">投资期限：3个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(413,4)">还款中</button></div></div></li><li><div class="product-content"><div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=411">PJ2017BZ0028</a></p><p class="p-rate"><span>9+1</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div><div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div><div class="submit"><button type="button" class="submit disabled" onclick="toInvest(411,4)">还款中</button></div></div></li></ul>
                </div>
            </div>
            <!--债权转让 -->

        </div>

        <!-- news -->
        <div class="layui-fluid" style="width: 89%;margin-top: 30px;">
            <div class="layui-col-sm8"  style="background-color: white;  width: auto; ">
                    <div class="grid-demo grid-demo-bg1">
                                <span style="font-size: 20px;">媒体报道</span>
                                <a href="https://www.pujinziben.com/about.html#gsdt?type=1" style="float: right">更多</a>
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top:20px;">
                        </fieldset>
                        <div class="news-main-content"  id="media">
                                <script type="text/html" id="mediaDemo">
                                    {{#layui.each(d, function(index, media){ }}
                                <div style="float: right; margin-right: 5px;margin-left: 5px">
                                    <h1>{{media.title}}</h1>
                                        <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}" target="_blank" class="news-main-content-left">
                                            <img src="<%=path %>/{{media.pic}}" alt="{{media.title}}" width="250" height="200">
                                        </a></br>
                                        <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}"  target="_blank" class="list-title">
                                            {{media.title}}
                                        </a></br>
                                        <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}" target="_blank" class="list-main">
                                            {{media.summary}}
                                        </a>
                                </div>
                                    {{#  }); }}
                                </script>
                            </div>
                        </div>
                </div>
                <div class="layui-col-sm4"  style="background-color: white;">
                    <div class="grid-demo" style="margin-left: 40px;">
                        <span style="font-size: 20px;">最新公告</span>
                        <a href="https://www.pujinziben.com/about.html#ptgg" style="float: right">更多</a>
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top:20px;">
                        </fieldset>
                        <div   id="notice">
                            <script type="text/html" id="noticeDemo">
                                {{#layui.each(d, function(index, notice){ }}
                            <div class="news-main-content">
                                <ul class="news-main-list" id="newsContent">
                                    <li>
                                        <a href="<%=path %>/page/message/noticeDetail?noticeId={{notice.nid}}" target="_blank">
                                        {{notice.title}}
                                    </a>
                                        <span style="float: right">{{ formatDate(notice.createdTime) }}</span>
                                    </li>
                                </ul>
                            </div>
                                {{#  }); }}
                            </script>
                        </div>
                        <div class="news-main-top ptop" style="margin-top: 20px">
                            <span style="font-size: 20px;">公司动态</span>
                            <p class="more icon icon-more"><a href="https://www.pujinziben.com/about.html#gsdt">更多</a></p>
                        </div>
                        <div class="news-main-content" id="dynamic">
                            <script type="text/html" id="dynamicDemo">
                                {{#layui.each(d, function(index, dynamic){ }}
                            <ul class="news-main-list" id="news-part">
                                <li>
                                    <a href="<%=path %>/page/dynamic/dynamicDetail?dynamicId={{dynamic.dyid}}"target="_blank">{{dynamic.title}}
                                    </a>
                                    <span>{{ formatDate(dynamic.createdTime) }}</span>
                                </li>
                            </ul>
                                {{#  }); }}
                            </script>
                        </div>
                    </div>
                </div>
    </div>

        </div>

        <div class="index-link">
            <div class="wrap">
                <div class="link-title">
                    合作伙伴
                </div>
                <div class="link-list">
                    <div class="link-list-box" style="width: 5840px;">
                        <ul class="cl" id="linkList" style="width: 2920px;">
                            <li><a target="view_frame" href="http://www.gzctgroup.cn/" title="赣州城投集团">
                                <img src="./普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台_files/201612290824108901.jpg" alt="赣州城投集团">
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
<%@include file="master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/jquery.slider.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/index.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/countUp.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".slider").slideshow({
            width: 1366,
            height: 340,
            transition: ['bar', 'Rain', 'square', 'squareRandom', 'explode']
        });
    });
    layui.use(['laytpl','element'], function () {
        var $ = layui.$;
        var laytpl = layui.laytpl;
        

        $.get("<%=path %>/data/home/indexMsg?page=1&limit=1",
            function (data) {
                    $('#url1').attr('src','/'+data.rows[0].url1);
                    $('#url2').attr('src','/'+data.rows[0].url2);
                    $('#url3').attr('src','/'+data.rows[0].url3);
                    $('#pic1').attr('src','/'+data.rows[0].pic1);
                    $('#pic2').attr('src','/'+data.rows[0].pic2);
                    $('#pic3').attr('src','/'+data.rows[0].pic3);
            });
        //渲染媒体报道
        var getTpl = $('#mediaDemo').html()
            , view = document.getElementById('media');
        $.post("<%=path %>/data/company/pagerCriteria",{
           page:1,
            limit:3
        }, function (data) {
            laytpl(getTpl).render(data.rows, function (html) {
                view.innerHTML = html;
            });
        })
        //渲染最新公告
        var noticegetTpl = $('#noticeDemo').html()
            , noticeview = document.getElementById('notice');
        $.post("<%=path %>/data/message/pagerNotice",{
            page:1,
            limit:4
        }, function (data) {
            laytpl(noticegetTpl).render(data.rows, function (html) {
                noticeview.innerHTML = html;
            });
        })
        //渲染公司动态
        var dynamicgetTpl = $('#dynamicDemo').html()
            , dynamicview = document.getElementById('dynamic');
        $.post("<%=path %>/data/dynamic/pagerCriteria",{
            page:1,
            limit:4
        }, function (data) {
            laytpl(dynamicgetTpl).render(data.rows, function (html) {
                dynamicview.innerHTML = html;
            });
        })

    })
</script>
</html>