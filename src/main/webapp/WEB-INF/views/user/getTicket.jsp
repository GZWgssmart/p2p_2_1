<%--
  Created by IntelliJ IDEA.
  User: 娃娃鱼
  Date: 2018/1/4
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>领券</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/header.jsp" %>

<div class="account cl">
    <div class="layui-container" style="background-color: #ffffff;padding-top: 50px;">
        <div class="layui-row">
            <div class="layui-col-md4 layui-col-md-offset4">
                <div id="view" style="text-align:center">
                    <script id="demo" type="text/html">
                        <h1>{{ d.name }}</h1>
                        <p>
                            {{# if(d.type == 0) { }}
                            <span>现金券</span>
                            {{# } else if(d.type == 1) { }}
                            <span>代金券</span>
                            {{# } else if(d.type == 2) { }}
                            <span>加息券</span>
                            {{# } }}
                        </p>
                        <p><span style="size: 18px;color: red;">{{ d.tkmoney }}元</span></p>
                        {{#  if(d.status == 0){ }}
                        <span>火热发放中......</span>
                        {{#  } else { }}
                        <span>已结束</span>
                        {{#  } }}
                        <p>
                        <div>{{ formatDate(d.tktime)}}</div></p>
                    </script>
                </div>
                <form class="layui-form">
                    <div class="layui-form-item" style="margin-top: 20px;">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="lingqu">立即领取</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../master/footer.jsp" %>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/home/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    <%--获取url ？后面的值--%>
    var url = window.location.search;
    if (url != null || url != '') {
        url = url.replace("?", "");
    }
    layui.use(['form', 'laytpl'], function () {
        var $ = layui.jquery;
        var form = layui.form;
        var laytpl = layui.laytpl;

        var getTpl = demo.innerHTML
            , view = document.getElementById('view');
        $.post('<%=path %>/data/ticket/getById',
            {kid: url},
            function (data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
                $.post('<%=path %>/data/userticket/get',{ uid:${user.uid},kid:url },
                    function (data) {
                        if(data.code == 0) {
                            layer.msg('对不起，您已领过！',{icon: 5},
                                function () {
                                    window.location = '/page/user/account'
                                }
                            );
                        }
                    }
                );
            }
        );

        //添加券
        form.on('submit(lingqu)', function (data) {
            $.post('<%=path %>/data/userticket/save',
                { uid:${user.uid},kid:url },
                function (res) {
                    if (res.code === 0) {
                        layer.msg('领取成功！',  {time:2000},function () {
                            window.location = '/page/user/account'
                        });
                    } else {
                        layer.msg('对不起，领取失败！');
                    }
                }, 'json'
            );
            return false;
        });

    });
</script>
</body>
</html>
