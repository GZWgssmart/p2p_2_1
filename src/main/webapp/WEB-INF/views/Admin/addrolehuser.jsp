<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width =device-width, initial-scale=1, maximum-scale=1" />
    <title></title>
    <meta charset="utf-8" />
    <!--layui的css-->
    <link href="<%=path %>/static/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        form {
            width: 500px;
            margin: 10px auto;
        }

        h1, h2, h3 {
            padding: 10px 0;
        }

        a {
            text-align: right;
            font-size: 18px;
            color: #1C86EE;
        }

        .xtree_contianer {
            width: 500px;
            border: 1px solid #9C9C9C;
            overflow: auto;
            margin-bottom: 30px;
            background-color: #fff;
            padding: 10px 0 25px 5px;
        }
    </style>
</head>
<body>
<!--别忘记form 以及form的class-->
<form class="layui-form">
    <h2>分配角色</h2>
<%--角色只能有一个--%>
    名称：<h3 id="huname"></h3>
    姓名：<span id="rname"></span>
    <h3>选择角色</h3>
    <div id="xtree2" style="width:300px;overflow:auto;" class="xtree_contianer"></div> <%-- //加载数据div --%>

    <div class="layui-btn-group demoTable">
        <button class="layui-btn" data-type="add" id="queding">确定</button>
    </div>
</form>
</body>
</html>
<!--先引用layui的js-->
<script src="<%=path %>/static/layui/layui.js"></script>
<!--引用xtree-->
<script src="<%=path %>/static/js/layui-xtree.js"></script>
<script type="text/javascript">
    <%--获取url ？后面的值--%>
    var url = window.location.search;
    if (url != null || url != '') {
        url = url.replace("?", "");
    }
    //layui 的 form 模块是必须的
    layui.use(['form'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引

        $.get('<%=path %>/data/admin/HuserDetail',{huid:url},function (data) {
            $('#huname').text(data.huname);
            $('#rname').text(data.rname);
        });

        //2、最基础的用法 - 异步加载
        var xtree2 = new layuiXtree({
            elem: 'xtree2'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
            , form: form                    //(必填) layui 的 from
            , data: '<%=path %>/rolehuser/all?huid='+url //(必填) 数据接口，需要返回以上结构的json字符串
            , click: function (data) {  //节点选中状态改变事件监听，全选框有自己的监听事件
                if(data.elem.checked){
                    $.post('<%=path %>/rolehuser/addRoleUser',
                        {huid:url,rid:data.value},
                        function (res) {}
                    );
                } else {
                    $.post('<%=path %>/rolehuser/remove',
                        {huid:url,rid:data.value},
                        function (res) {}
                    );
                }
            }
        });

        $('#queding').on('click', function () {
            parent.layer.close(index); //再执行关闭
        });

    });

</script>