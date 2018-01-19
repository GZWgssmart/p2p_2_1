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
<style type="text/css">
    #demo {overflow:hidden;width:1180px; }
    #demos { float: left; width: 800%;}
    #demo1 { float: left; }
    #demo2 { float: left;margin-left:7px;}
    .lione {
        height: 16px;
        padding-left: 15px;
        margin-bottom: 15px;
    }
    .newsA {
        width: 220px;
        line-height: 16px;
        float: left;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .newsS {
        width: 80px;
        height: 16px;
        line-height: 16px;
        text-align: right;
        float: right;
        color: #999999;
    }
</style>
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
                                <span id="investAmount"></span>
                                <span class="small">元</span>
                            </p>
                        </li>
                        <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                        <li class="last">
                            <p>
                                累计注册投资人：
                                <span id="userTotal"></span>
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
        <!-- 新手标 -->
        <div class="product wrap">
            <div class="product-n" id="newUser">
                <div class="product-new">
                    <div class="title cl"><a href="<%=path%>/page/borrowApply/investList"><img alt="" src="<%=path %>/static/images/index/product-new-icon2.png"></a></div>
                    <ul class="product-new-main cl" id="xsbCont">
                        <script type="text/html" id="xsbList">
                            {{# layui.each(d, function(index, xsb){ }}
                                <li class="rate cl">
                                    <a href="javascript:void(0);" onclick="borrowDetail('{{xsb.baid}}');">
                                        <p><span id="ty-rate">{{xsb.nprofit}}</span>%</p>
                                        <span>预期年化收益率</span>
                                    </a>
                                </li>
                                <li class="date">
                                    <div class="date-item">
                                        <div class="line icon icon-progress">
                                            <p>募集进度：</p>
                                            <p class="progress"><em class="xsbjindu"></em></p>
                                            <p class="progress-text"><span id="xs-schedules" class="xsbjd"></span></p>
                                        </div>
                                        <p class="icon icon-doll">项目金额：<span id="xs-doll">{{xsb.money}}元</span></p>
                                        <p class="icon icon-time">投资期限：<span id="ty-date">{{xsb.term}}个月</span></p>
                                    </div>
                                </li>
                                <li>
                                    <div class="button">
                                        {{# if((xsb.money-xsb.moneyCount)>0){ }}
                                        <button type="button" class="btn" onclick="borrowDetail('{{xsb.baid}}');">立即投标</button>
                                        {{# } else if(xsb.ckstatus === 5) { }}
                                        <button type="button" class="btn disabled" onclick="">已完成</button>
                                        {{# } else { }}
                                        <button type="button" class="btn disabled" onclick="">还款中</button>
                                        {{# } }}
                                    </div>
                                </li>
                            {{# }); }}
                        </script>
                    </ul>
                </div>
            </div>
            <!-- 恒金保 -->
            <div class="product-h" id="pj_hengjin" style="width: 100%;height: 400px;margin-top: 30px;background-color: #fff;overflow: hidden;">
                <div class="product-h-l">
                    <img src="<%=path %>static/images/index/product_01.png" alt="恒金保">
                    <a href="<%=path%>/page/borrowApply/investList" class="top"></a>
                    <a href="<%=path%>/page/borrowApply/investList" class="bottom"></a>
                </div>
                <div class="product-h-m" id="hjbCont" style="width: 980px;height: 400px;float: left;">

                        <script type="text/html" id="hjbList">
                            {{# layui.each(d, function(index, hjb){ }}
                            <ul class="product-list" id="product-h">
                            <li>
                                <div class="product-content">
                                    <div class="top">
                                        <p class="product-title">
                                            <a href="javascript:void(0);" onclick="borrowDetail('{{hjb.baid}}');">{{hjb.cpname}}</a>
                                        </p>
                                        <p class="p-rate">
                                            <span>{{hjb.nprofit}}</span><span class="small">%</span>
                                        </p>
                                        <span class="p-rate-text">预期年化收益率</span>
                                    </div>
                                    <div class="bottom">
                                        <div class="line icon icon-progress">
                                            <p>募集进度：</p>
                                            <p class="progress"><em class="hjbjindu"></em></p>
                                            <p class="progress-text hjbjd"></p>
                                        </div>
                                        <p class="icon icon-doll">项目金额：{{hjb.money}}元</p>
                                        <p class="icon icon-time">投资期限：{{hjb.term}}个月</p>
                                    </div>
                                    <div class="submit">
                                        {{# if((hjb.money-hjb.moneyCount)>0){ }}
                                        <button type="button" class="btn" onclick="borrowDetail('{{hjb.baid}}');">立即投标</button>
                                        {{# } else if(hjb.ckstatus === 5) { }}
                                        <button type="button" class="btn disabled" onclick="">已完成</button>
                                        {{# } else { }}
                                        <button type="button" class="btn disabled" onclick="">还款中</button>
                                        {{# } }}
                                    </div>
                                </div>
                            </li>
                            </ul>
                            {{# }); }}
                        </script>

                </div>
            </div>
            <!-- 普金保 -->
            <div class="product-h" id="pj_pujin">
                <div class="product-h-l">
                    <img src="<%=path %>static/images/index/product_02.png" alt="多金保">
                    <a href="<%=path%>/page/borrowApply/investList" class="top"></a>
                    <a href="<%=path%>/page/borrowApply/investList" class="bottom"></a>
                </div>
                <div class="product-h-m" id="pjbCont">

                        <script type="text/html" id="pjbList">
                            {{# layui.each(d, function(index, pjb){ }}
                            <ul class="product-list" id="product-p">
                                <li>
                                    <div class="product-content">
                                        <div class="top">
                                            <p class="product-title">
                                                <a href="javascript:void(0);" onclick="borrowDetail('{{pjb.baid}}');">{{pjb.cpname}}</a>
                                            </p>
                                            <p class="p-rate">
                                                <span>{{pjb.nprofit}}</span><span class="small">%</span>
                                            </p>
                                            <span class="p-rate-text">预期年化收益率</span>
                                        </div>
                                        <div class="bottom">
                                            <div class="line icon icon-progress">
                                                <p>募集进度：</p>
                                                <p class="progress"><em class="pjbjindu"></em></p>
                                                <p class="progress-text pjbjd"></p>
                                            </div>
                                            <p class="icon icon-doll">项目金额：{{pjb.money}}元</p>
                                            <p class="icon icon-time">投资期限：{{pjb.term}}个月</p>
                                        </div>
                                        <div class="submit">
                                            {{# if((pjb.money-pjb.moneyCount)>0){ }}
                                            <button type="button" class="btn" onclick="borrowDetail('{{pjb.baid}}');">立即投标</button>
                                            {{# } else if(pjb.ckstatus === 5) { }}
                                            <button type="button" class="btn disabled" onclick="">已完成</button>
                                            {{# } else { }}
                                            <button type="button" class="btn disabled" onclick="">还款中</button>
                                            {{# } }}
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            {{# }); }}
                        </script>

                </div>
            </div>
            <!-- 多金宝 -->
            <div class="product-h" id="pj_duojin">
                <div class="product-h-l">
                    <img src="<%=path %>static/images/index/product_03.png" alt="多金宝">
                    <a href="<%=path%>/page/borrowApply/investList" class="top"></a>
                    <a href="<%=path%>/page/borrowApply/investList" class="bottom"></a>
                </div>
                <div class="product-h-m" id="djbCont">
                        <script type="text/html" id="djbList">
                        {{# layui.each(d, function(index, djb){ }}
                        <ul class="product-list" id="product-d">
                            <li>
                                <div class="product-content">
                                    <div class="top">
                                        <p class="product-title">
                                            <a href="javascript:void(0);" onclick="borrowDetail('{{djb.baid}}');">{{djb.cpname}}</a>
                                        </p>
                                        <p class="p-rate">
                                            <span>{{djb.nprofit}}</span><span class="small">%</span>
                                        </p>
                                        <span class="p-rate-text">预期年化收益率</span>
                                    </div>
                                    <div class="bottom">
                                        <div class="line icon icon-progress">
                                            <p>募集进度：</p>
                                            <p class="progress"><em class="djbjindu"></em></p>
                                            <p class="progress-text djbjd"></p>
                                        </div>
                                        <p class="icon icon-doll">项目金额：{{djb.money}}元</p>
                                        <p class="icon icon-time">投资期限：{{djb.term}}个月</p>
                                    </div>
                                    <div class="submit">
                                        {{# if((djb.money-djb.moneyCount)>0){ }}
                                        <button type="button" class="btn" onclick="borrowDetail('{{djb.baid}}');">立即投标</button>
                                        {{# } else if(djb.ckstatus === 5) { }}
                                        <button type="button" class="btn disabled" onclick="">已完成</button>
                                        {{# } else { }}
                                        <button type="button" class="btn disabled" onclick="">还款中</button>
                                        {{# } }}
                                    </div>
                                </div>
                            </li>
                        </ul>
                        {{# }); }}
                        </script>

                </div>
            </div>
        </div>

        <!-- news -->
        <div class="layui-fluid" style="width: 89%;margin-top: 30px;">
            <div class="layui-col-sm8"  style="background-color: white;  width: auto;height: 400px">
                <div class="grid-demo grid-demo-bg1"style="margin-top: 20px;margin-left: 5px">
                    <span style="font-size: 20px;">媒体报道</span>
                    <a href="<%=path %>/page/dynamic/indexDynamic#test1=1" style="float: right">更多</a>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top:20px;"></fieldset>
                    <div class="news-main-content"  id="media">
                        <script type="text/html" id="mediaDemo">
                            {{#layui.each(d, function(index, media){ }}
                                <div style="float: right; margin-right: 5px;margin-left: 5px">
                                    <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}" target="_blank" class="news-main-content-left">
                                        <img src="<%=path %>/{{media.pic}}" alt="{{media.title}}" width="250" height="200">
                                    </a></br>
                                    <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}"  target="_blank" class="list-title">
                                        <div style="width:250px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"> {{media.title}}</div>
                                    </a></br>
                                    <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}" target="_blank" class="list-main">
                                       <div style="width:250px;"> {{media.summary}}</div>
                                    </a>
                                </div>
                            {{#  }); }}
                        </script>
                    </div>
                </div>
            </div>

                <div class="layui-col-sm4"  style="background-color: white;height: 400px">
                    <div class="grid-demo" style="margin-right: 20px; margin-top: 20px;">
                        <div style="margin-right: 20px; margin-top: 20px;">
                            <span style="font-size: 20px; margin-left: 15px">最新公告</span>
                            <a href="<%=path %>/page/about/indexNotice" style="float: right">更多</a>
                            <fieldset class="layui-elem-field layui-field-title" style="margin-top:20px;">
                            </fieldset>
                        </div>
                        <div class="news-main-content" id="notice">
                            <script type="text/html" id="noticeDemo">
                                <div class="news-main-content"  style="margin-top: 10px">
                                    <ul class="news-main-list" id="newsContent">
                                        {{#layui.each(d, function(index, notice){ }}
                                        <li class="lione">
                                            <a href="<%=path %>/page/about/noticeDetail?noticeId={{notice.nid}}" target="_blank" class="newsA">
                                                {{notice.title}}
                                            </a>
                                            <span class="newsS">{{ formatDateTime(notice.createdTime) }}</span>
                                        </li>
                                        {{#  }); }}
                                    </ul>
                                </div>
                        </script>
                    </div>
                    <div class="news-main-top ptop" style="margin-top: 20px;margin-right: 20px;">
                        <span style="font-size: 20px; margin-left: 15px">公司动态</span>
                        <a href="<%=path %>/page/dynamic/indexDynamic" style="float: right">更多</a>
                        </fieldset>
                    </div>
                    <div class="news-main-content" id="dynamic">
                        <script type="text/html" id="dynamicDemo">
                            <ul class="news-main-list" id="news-part" style="margin-top: 8px;">
                                {{# layui.each(d, function(index, dynamic){ }}
                                    <li class="lione">
                                        <a href="<%=path %>/page/dynamic/dynamicDetail?dynamicId={{dynamic.dyid}}"target="_blank" class="newsA">
                                            {{dynamic.title}}
                                        </a>
                                        <span class="newsS">{{ formatDateTime(dynamic.createdTime) }}</span>
                                    </li>
                                {{#  }); }}
                            </ul>
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
            <div id="demo">
                <div id="demos">
                    <div id="demo1"></div>
                    <div id="demo2"></div>
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
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".slider").slideshow({
            width: 1366,
            height: 340,
            transition: ['bar', 'Rain', 'square', 'squareRandom', 'explode']
        });
    });

    function borrowDetail(baid) {
        window.location.href='<%=path %>/page/borrowApply/detail/'+ baid;
    }

    layui.use(['laytpl','element', 'laypage'], function () {
        var $ = layui.$;
        var laytpl = layui.laytpl;
        var element = layui.element;
        var laypage = layui.laypage;

        // 恒金宝渲染
        var getXsbTpl = $('#xsbList').html()
            , xsbView = document.getElementById('xsbCont');
        $.get('<%=path %>/data/borrow/indexList'
            ,{
                page:1
                , limit:1
                , bzid:4
            }, function (data) {
                laytpl(getXsbTpl).render(data.rows, function (html) {
                    xsbView.innerHTML = html;
                });
                for(var i = 0; i < data.rows.length; i++) {
                    var val = (data.rows[i].moneyCount / data.rows[i].money * 100).toFixed(2);
                    $('.xsbjindu')[i].id = "xsbjindu" + i;
                    $('#xsbjindu' + [i]).css({ "width": val + "%"});
                    $('.xsbjd')[i].id = "xsbjd" + i;
                    $('#xsbjd' + [i]).text(val + '%');
                }
            });
        // 恒金宝渲染
        var getHjbTpl = $('#hjbList').html()
            , hjbView = document.getElementById('hjbCont');
        $.get('<%=path %>/data/borrow/indexList'
            ,{
                page:1
                , limit:3
                , bzid:1
            }, function (data) {
                laytpl(getHjbTpl).render(data.rows, function (html) {
                    hjbView.innerHTML = html;
                });
                for(var i = 0; i < data.rows.length; i++) {
                    var val = (data.rows[i].moneyCount / data.rows[i].money * 100).toFixed(2);
                    $('.hjbjindu')[i].id = "hjbjindu" + i;
                    $('#hjbjindu' + [i]).css({ "width": val + "%"});
                    $('.hjbjd')[i].id = "hjbjd" + i;
                    $('#hjbjd' + [i]).text(val + '%');
                }
            });
        // 普金宝渲染
        var getPjbTpl = $('#pjbList').html()
            , pjbView = document.getElementById('pjbCont');
        $.get('<%=path %>/data/borrow/indexList'
            ,{
                page:1
                , limit:3
                , bzid:2
            }, function (data) {
                laytpl(getPjbTpl).render(data.rows, function (html) {
                    pjbView.innerHTML = html;
                });
                for(var i = 0; i < data.rows.length; i++) {
                    var val = (data.rows[i].moneyCount / data.rows[i].money * 100).toFixed(2);
                    $('.pjbjindu')[i].id = "pjbjindu" + i;
                    $('#pjbjindu' + [i]).css({ "width": val + "%"});
                    $('.pjbjd')[i].id = "pjbjd" + i;
                    $('#pjbjd' + [i]).text(val + '%');
                }
            });
        // 多金宝渲染
        var getDjbTpl = $('#djbList').html()
            , djbView = document.getElementById('djbCont');
        $.get('<%=path %>/data/borrow/indexList'
            ,{
                page:1
                , limit:3
                , bzid:3
            }, function (data) {
                laytpl(getDjbTpl).render(data.rows, function (html) {
                    djbView.innerHTML = html;
                });
                for(var i = 0; i < data.rows.length; i++) {
                    var val = (data.rows[i].moneyCount / data.rows[i].money * 100).toFixed(2);
                    $('.djbjindu')[i].id = "djbjindu" + i;
                    $('#djbjindu' + [i]).css({ "width": (data.rows[i].moneyCount / data.rows[i].money * 100) + "%"});
                    $('.djbjd')[i].id = "djbjd" + i;
                    $('#djbjd' + [i]).text(val + '%');
                }
        });

        $.get("<%=path %>/data/home/indexMsg?page=1&limit=1",
            function (data) {
                    $('#url1').attr('href',data.rows[0].url1);
                    $('#url2').attr('href','/'+data.rows[0].url2);
                    $('#url3').attr('href','/'+data.rows[0].url3);
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
        });
        //渲染最新公告
        var noticegetTpl = $('#noticeDemo').html()
        noticeview = document.getElementById('notice');
        $.post("<%=path %>/data/message/pagerNotice",{
            page:1,
            limit:4
        }, function (data) {
            laytpl(noticegetTpl).render(data.rows, function (html) {
                noticeview.innerHTML = html;
            });
        });
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
        });
        //渲染合作伙伴
        var friendgetTpl = $('#friendDemo').html()
            , friendview = document.getElementById('friend');
        $.post("<%=path %>/data/message/allIndexfriend",
            function (data) {
                var html = "";
                for(var i = 0; i<data.length; i++) {
                   html +="<a href='" +data[i].furl+ "'><img style='border: 1px solid #f0e8df;margin-left: 20px;' src='" + data[i].fpic + "' /></a>";
                }
                document.getElementById("demo1").innerHTML = html;
                document.getElementById("demo2").innerHTML = html;
        });

        $.get('/data/ydata/new',
            function (data) {
                $('#investAmount').text(data.tmoney);
                $('#userTotal').text(data.tuser);
            }
        );

    });
</script>
<script>
    var speed=50; //数字越大速度越慢
    var tab=document.getElementById("demo");
    var tab1=document.getElementById("demo1");
    var tab2=document.getElementById("demo2");
    tab2.innerHTML=tab1.innerHTML;
    function Marquee(){
        if(tab2.offsetWidth-tab.scrollLeft<=0) {
            tab.scrollLeft-=tab1.offsetWidth;
        } else{
            tab.scrollLeft++;
        }
    }
    var MyMar=setInterval(Marquee,speed);
    tab.onmouseover=function() {clearInterval(MyMar)};
    tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
</script>
</html>