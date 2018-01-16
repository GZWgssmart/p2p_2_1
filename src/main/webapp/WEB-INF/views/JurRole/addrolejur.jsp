<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?bf515042093c3de99a0ba28c661b07b4";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/js/rolejur/jquery.json-viewer.css"/>
</head>
<body class="childrenBody">
<form class="layui-form layui-row">
    <div class="layui-form-item">
        <label class="layui-form-label">动态赋值</label>
        <div class="layui-input-block">
            <select lay-filter="aaa" multiple name="aaa" lay-verify="required">
                <option value="">请选择您的兴趣爱好</option>
                <option value="1" disabled>旅游</option>
                <option value="2">唱歌</option>
                <option value="3">爬山</option>
                <option value="4">游戏</option>
                <option value="5">台球</option>
                <option value="6">阅读</option>
                <option value="7">看电影</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择提交</label>
        <div class="layui-input-block">
            <select lay-filter="bbb" multiple name="bbb" lay-verify="required">
                <option value="">请选择您的兴趣爱好</option>
                <option value="1" disabled>旅游</option>
                <option value="2">唱歌</option>
                <option value="3" selected=''>爬山</option>
                <option value="4">游戏</option>
                <option value="5">台球</option>
                <option value="6">阅读</option>
                <option value="7">看电影</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="selectMultiple.js"></script>
</body>
</html>