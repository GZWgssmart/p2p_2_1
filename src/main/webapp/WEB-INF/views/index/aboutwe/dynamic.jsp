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
    <head>
        <title>公司动态</title>
        <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
        <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
        <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
    </head>
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl">
    <%--<%@include file="../master/left.jsp" %>--%>
    <%--信息披露里的左侧边栏--%>
    <%@include file="../../master/aboutLeft.jsp" %>
    <div class="account-right">
        <div class="layui-tab layui-tab-brief" lay-filter="test1" style="float: left;">
            <ul class="layui-tab-title">
                <li class="layui-this">公司动态</li>
                <li lay-id="1">媒体报道</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <%--渲染数据的div--%>
                    <div id="allDynamic">
                        <script type="text/html" id="demoDynamic">
                            {{#  layui.each(d, function(index, dynamic){ }}
                            <div class="layui-row" style="margin-top: 30px;width:890px;">
                                <div class="layui-col-md3">
                                    {{# if(dynamic.pic !== null){ }}
                                    <img src="<%=path %>/{{ dynamic.pic }}" alt="dynamic.pic"
                                         style="width: 200px;height: 120px;"/>
                                    {{# } else { }}
                                    <span></span>
                                    {{# } }}
                                </div>
                                <div class="layui-col-md8 layui-col-md-offset1">
                                    <div>
                                        <h2>
                                            <a href="<%=path %>/page/dynamic/dynamicDetail?dynamicId={{dynamic.dyid}}">
                                                {{dynamic.title}}
                                            </a><br/><br/>
                                        </h2>
                                        <p>{{ dynamic.summary }}</p><br/>
                                        <p>
                                        <div>{{ formatDate(dynamic.createdTime)}}</div><br>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top:25px;border:1px #ebebeb dotted;"></div>
                            {{#  }); }}
                        </script>
                    </div>
                    <div id="alldynamic"></div>
                </div>
                <div class="layui-tab-item">
                    <div id="allMediaReport">
                        <script type="text/html" id="mediaDemo">
                            {{#  layui.each(d, function(index, media){ }}
                            <div class="layui-row" style="margin-top: 30px;width:890px">
                                <div class="layui-col-md3">
                                    {{# if(media.pic !== null){ }}
                                    <img src="<%=path %>/{{ media.pic }}" alt="media.pic"
                                         style="width: 200px;height: 120px;"/>
                                    {{# } else { }}
                                    <span>-----------------</span>
                                    {{# } }}
                                </div>
                                <div class="layui-col-md8 layui-col-md-offset1">
                                    <div>
                                        <h2>
                                            <a href="<%=path %>/page/company/mediaDetailPage?mediaId={{media.mid}}">
                                                {{media.title}}
                                            </a><br/><br/>
                                        </h2>
                                        <p>{{ media.summary }}</p><br/>
                                        <p>
                                        <div>{{ formatDate(media.createdTime)}}</div>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top:25px;border:1px #ebebeb dotted;"></div>
                            {{#  }); }}
                        </script>
                    </div>
                    <div id="allmedia"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'laypage', 'laytpl'], function () {
        var $ = layui.$;
        var laypage = layui.laypage;
        var laytpl = layui.laytpl;
        var element = layui.element;

        var layid = location.hash.replace(/^#test1=/, '');
        element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

        //监听Tab切换，以改变地址hash值
        element.on('tab(test1)', function(){
            location.hash = 'test1='+ this.getAttribute('lay-id');
        });

        var page = 1; // 第一页开始
        var limit = 10; // 每页十个数据，laypage默认也是十个

        var getTpl0 = $('#demoDynamic').html()
            , view0 = document.getElementById('allDynamic');
        // 获取公司动态数据
        $.get('<%=path %>/data/dynamic/pagerCriteria', {
            page: page,
            limit: limit
        }, function (data) {
            //数据返回成功后，data.rows一页的数据，data.total统计的总数据量   fenye() 渲染数据，pageTotal()分页组件
            fenyeDynamic(data.rows);
            pageTotalDynamic(data.total)
        });

        // 渲染数据
        function fenyeDynamic(data) {
            laytpl(getTpl0).render(data, function (html) {
                view0.innerHTML = html;
            });
        }

        // 分页组件
        function pageTotalDynamic(total) {
            laypage.render({
                elem: 'alldynamic'
                , count: total
                , jump: function (obj, first) {//obj包含了当前分页的所有参数
                    //在点击页号和上下页的时候重新加载数据
                    if (!first) {
                        $.get('<%=path %>/data/dynamic/pagerCriteria', {
                            page: obj.curr,//得到当前页，以便向服务端请求对应页的数据。
                            limit: obj.limit//得到每页显示的条数
                        }, function (data) {
                            fenye(data.rows);
                        });
                    }
                }
            });
        }

        var getTpl = $('#mediaDemo').html()
            , view = document.getElementById('allMediaReport');
        // 获取媒体报道数据
        $.get('<%=path %>/data/company/pagerCriteria', {
            page: page,
            limit: limit
        }, function (data) {
            //数据返回成功后，data.rows一页的数据，data.total统计的总数据量   fenye() 渲染数据，pageTotal()分页组件
            fenye(data.rows);
            pageTotal(data.total)
        });

        // 渲染数据
        function fenye(data) {
            laytpl(getTpl).render(data, function (html) {
                view.innerHTML = html;
            });
        }

        // 分页组件
        function pageTotal(total) {
            laypage.render({
                elem: 'allmedia'
                , count: total
                , jump: function (obj, first) {//obj包含了当前分页的所有参数
                    //在点击页号和上下页的时候重新加载数据
                    if (!first) {
                        $.get('<%=path %>/data/company/pagerCriteria', {
                            page: obj.curr,//得到当前页，以便向服务端请求对应页的数据。
                            limit: obj.limit//得到每页显示的条数
                        }, function (data) {
                            fenye(data.rows);
                        });
                    }
                }
            });
        }
    });
</script>
</body>
</html>
