<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>投资列表</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/index.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>
<div class="invest-list">
    <div class="wrap">
        <div class="invest-top">
            <div class="invest-top-left">
                <div class="invest-top-list">
                    <p>项目期限：</p>
                    <ul id="term">
                        <li class="active"><a href="javascript:void(0);" id="searchTerm">全部</a></li>
                        <li><a href="javascript:void(0);" id="searchTerm1">3个月</a></li>
                        <li><a href="javascript:void(0);" id="searchTerm2">6个月</a></li>
                        <li><a href="javascript:void(0);" id="searchTerm3">12个月</a></li>
                        <input type="hidden" id="termCount">
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>年化收益：</p>
                    <ul id="nprofit">
                        <li class="active"><a href="javascript:void(0);" id="searchNpro">全部</a></li>
                        <li><a href="javascript:void(0);" id="searchNpro1"><=10%</a></li>
                        <li><a href="javascript:void(0);" id="searchNpro2">10%-15%</a></li>
                        <li><a href="javascript:void(0);" id="searchNpro3">15%-25%</a></li>
                        <input type="hidden" id="minNpro">
                        <input type="hidden" id="MaxNpro">
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>项目类型：</p>
                    <ul id="bz">
                        <li class="active"><a href="javascript:void(0);" id="searchBz">全部</a></li>
                        <li><a href="javascript:void(0);" id="searchBz3">多金宝</a></li>
                        <li><a href="javascript:void(0);" id="searchBz2">普金保</a></li>
                        <li><a href="javascript:void(0);" id="searchBz1">恒金保</a></li>
                        <li><a href="javascript:void(0);" id="searchBz4">新手标</a></li>
                        <input type="hidden" id="bzid">
                    </ul>
                </div>
            </div>
            <div class="invest-top-right">
                <div class="invest-top-list">
                    <div class="textmiddle">借款标题</div>
                    <input type="text" name="cpname" class="text" id="cpname"/>
                    <a href="javascript:void(0);" class="layui-btn layui-btn-primary" id="searchCpname">搜索</a>
                </div>
            </div>
        </div>
        <div class="invest-list-bottom">
            <ul class="invest-row listData creditor-row" id="content">
                <script type="text/html" id="borrowList">
                    {{#  layui.each(d, function(index, borrow){ }}
                    <li>
                        <div class="invest-title cl"><p>{{ borrow.bzname }}</p>
                            <h3><a href="javascript:void(0);" onclick="borrowDetail('{{borrow.baid}}');">{{borrow.cpname}}</a></h3>
                        </div>
                        <div class="invest-content cl">
                            <ul>
                                <li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">{{borrow.nprofit}}<span>%</span></p></li>
                                <li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">{{borrow.term}}个月</p></li>
                                <li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">{{formatWay(borrow.way)}}</p></li>
                                <li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">{{borrow.money-borrow.moneyCount}}元 / {{borrow.money}}元</p></li>
                                <li class="row5">
                                    <div class="line">
                                        <p class="progress"><em class="jindu"></em></p><p class="progress-text jdVal"></p>
                                    </div>
                                    <p class="row-top">募集进度</p></li>
                                <li class="row6">
                                    {{# if((borrow.money-borrow.moneyCount)>0){ }}
                                    <button type="button" class="btn" onclick="borrowDetail('{{borrow.baid}}');">立即投标</button>
                                    {{# } else if(borrow.ckstatus === 5) { }}
                                    <button type="button" class="btn disabled" onclick="">已完成</button>
                                    {{# } else { }}
                                    <button type="button" class="btn disabled" onclick="">还款中</button>
                                    {{# } }}
                                </li>
                            </ul>
                        </div>
                    </li>
                    {{#  }); }}
                </script>
            </ul>
            <div id="borrowDemo"></div>
        </div>
    </div>
</div>
<%@include file="../master/footer.jsp" %>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    function borrowDetail(baid) {
        window.location.href='<%=path %>/page/borrowApply/detail/'+ baid;
    }

    function searchBorrow(demoId) {
        if(demoId !== '') {
            $('#'+ demoId +' li').removeClass('active');
            $('a').click(
                function(){
                    $(this).parent().attr('class','active');
                });
        }
    }

    layui.use(['element', 'laypage', 'laytpl'], function () {
        var $ = layui.$;
        var element = layui.element;
        var laypage = layui.laypage;
        var laytpl = layui.laytpl;

        var page = 1; // 第一页开始
        var limit = 10; // 每页十个数据，laypage默认也是十个
        var getTpl = $('#borrowList').html()
            , view = document.getElementById('content');
        $(function () {
            doSearch();
        });

        function doSearch() {
            // 获取数据
            $.get('<%=path %>/data/borrow/frontList', {
                page: page
                , limit: limit
                , term : $('#termCount').val()
                , nprofitMax:$('#maxNpro').val()
                ,nprofitMin:$('#minNpro').val()
                ,cpname: $('#cpname').val()
                ,bzid: $('#bzid').val()
            }, function (data) {
                fenye(data.rows);
                pageTotal(data.total);
                for(var i = 0; i < data.rows.length; i++) {
                    var val = (data.rows[i].moneyCount / data.rows[i].money * 100).toFixed(2);
                    $('.jindu')[i].id = "jindu" + i;
                    $('#jindu' + [i]).css({ "width": val + "%"});
                    $('.jdVal')[i].id = "jdVal" + i;
                    $('#jdVal' + [i]).text(val + '%');
                }
            });
        }


        // 渲染数据
        function fenye(data) {
            laytpl(getTpl).render(data, function (html) {
                view.innerHTML = html;
            });

        }

        $('#searchCpname').on('click', function(){
            var cpname = $('#cpname').val();
            if(cpname === null || cpname.trim() === '') {
                return;
            }
            doSearch();
        });

        $('#searchBz1').on('click', function(){
            searchBorrow('bz');
            $('#bzid').val(1);
            doSearch();
        });
        $('#searchBz2').on('click', function(){
            searchBorrow('bz');
            $('#bzid').val(2);
            doSearch();
        });
        $('#searchBz3').on('click', function(){
            searchBorrow('bz');
            $('#bzid').val(3);
            doSearch();
        });
        $('#searchBz4').on('click', function(){
            searchBorrow('bz');
            $('#bzid').val(4);
            doSearch();
        });
        $('#searchBz').on('click', function(){
            searchBorrow('bz');
            $('#bzid').val(null);
            doSearch();
        });

        $('#searchNpro').on('click', function(){
            searchBorrow('nprofit');
            $('#maxNpro').val(null);
            $('#minNpro').val(null);
            doSearch();
        });
        $('#searchNpro1').on('click', function(){
            searchBorrow('nprofit');
            $('#maxNpro').val(10);
            $('#minNpro').val(0);
            doSearch();
        });
        $('#searchNpro2').on('click', function(){
            searchBorrow('nprofit');
            $('#maxNpro').val(15);
            $('#minNpro').val(10);
            doSearch();
        });
        $('#searchNpro3').on('click', function(){
            searchBorrow('nprofit');
            $('#maxNpro').val(25);
            $('#minNpro').val(15);
            doSearch();
        });

        $('#searchTerm').on('click', function(){
            searchBorrow('term');
            $('#termCount').val(null);
            doSearch();
        });
        $('#searchTerm1').on('click', function(){
            searchBorrow('term');
            $('#termCount').val(3);
            doSearch();
        });
        $('#searchTerm2').on('click', function(){
            searchBorrow('term');
            $('#termCount').val(6);
            doSearch();
        });
        $('#searchTerm3').on('click', function(){
            searchBorrow('term');
            $('#termCount').val(12);
            doSearch();
        });

        // 分页组件
        function pageTotal(total) {
            laypage.render({
                elem: 'borrowDemo'
                , count: total
                , curr: location.hash.replace('#!page=', '') //获取起始页
                , hash: 'page' //自定义hash值
                , jump: function (obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数

                    //在点击页号和上下页的时候重新加载数据
                    if (!first) {
                        $.get('<%=path %>/data/borrow/frontList', {
                            page: obj.curr,
                            limit: obj.limit
                        }, function (data) {
                            fenye(data.rows);
                        });
                    }
                }
            });
        }
    });
</script>
</html>
