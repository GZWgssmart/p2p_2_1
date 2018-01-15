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
    <style type="text/css">
        body{padding: 20px;}
        .layui-form-item{margin-bottom: 0;}
        .layui-field-box{padding: 20px;}
        select:focus + .layui-form-selected dl{display: block;}
    </style>
</head>
<body>
<fieldset class="layui-elem-field" style="height: 350px;">
    <legend>Layui Select多选</legend>
    <div class="layui-field-box">
        <div class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">选择框</label>
                <div class="layui-input-block">
                    <select name="city" lay-filter="city">
                        <option value=""></option>
                        <option value="0">北京</option>
                        <option value="1">上海</option>
                        <option value="2">广州</option>
                        <option value="3">深圳</option>
                        <option value="4">杭州</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>result</legend>
    <div class="layui-field-box">
        <span id="json-view"></span>
    </div>
</fieldset>

<script src="<%=path %>/static/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path %>/static/js/rolejur/jquery.json-viewer.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path %>/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path %>/static/js/rolejur/formSelects.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    formSelects.on({
        layFilter: 'city',	//绑定select lay-filter
        left: '【',			//显示的符号left
        right: '】',			//显示的符号right
        separator: '',		//多选分隔符
    });
    //formSelects.arr 可以获取到已经选择的数据
    function formatJson(arr){
        try{
            $('#json-view').jsonViewer(eval('('+JSON.stringify(arr)+')'), {
                collapsed: false,
                withQuotes: true
            });
        }catch(error){}
    }
</script>
</body>
</html>