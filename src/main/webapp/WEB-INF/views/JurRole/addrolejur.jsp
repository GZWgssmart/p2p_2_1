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

        .div-btns {
            margin: 20px 0;
        }

        .layui-form-label {
            width: 60px !important;
        }
    </style>
</head>
<body>
<!--别忘记form 以及form的class-->
<form class="layui-form">
    <h2>分配权限</h2>

    <h3>选择权限</h3>
    <div id="xtree2" style="height:280px;overflow:auto;" class="xtree_contianer"></div> <%-- //加载数据div --%>

    <div class="layui-btn-group demoTable">
        <button class="layui-btn" data-type="add">添加</button>
    </div>
</form>
</body>
</html>
<!--先引用layui的js-->
<script src="<%=path %>/static/layui/layui.js"></script>
<!--引用xtree-->
<script src="<%=path %>/static/js/layui-xtree.js"></script>
<script type="text/javascript">
    //一套json数据下面会使用，同时供你参考
    var json = [
        {
            title: "节点1", value: "jd1", data: [
            { title: "节点1.1", checked: true, disabled: true, value: "jd1.1", data: [] }
            , { title: "节点1.2", value: "jd1.2", checked: true, data: [] }
            , { title: "节点1.3", value: "jd1.3", disabled: true, data: [] }
            , { title: "节点1.4", value: "jd1.4", data: [] }
        ]
        }
        , {
            title: "节点2", value: "jd2", data: [
                { title: "节点2.1", value: "jd2.1", data: [] }
                , { title: "节点2.2", value: "jd2.2", data: [] }
                , { title: "节点2.3", value: "jd2.3", data: [] }
                , { title: "节点2.4", value: "jd2.4", data: [] }
            ]
        }
        , { title: "节点3", value: "jd3", data: [] }
        , { title: "节点4", value: "jd4", data: [] }
    ];

    var json2 = [
        {
            title: "权限",
            value: "2",
            checked: false,
            disabled: false,
            data: [
                {title: "管理信息的权限", value: "1", checked: false, disabled: false, data: []},
                {title: "审核和设置奖励的权限", value: "2", checked: true, disabled: false, data: []},
                {title: "root的权限", value: "3", checked: false, disabled: false, data: []},
                {title: "拥有信息和审核设置权限", value: "4", checked: false, disabled: false, data: []}
                ]
        }
    ];

    //********************
    //      正式开始
    //********************

    //layui 的 form 模块是必须的
    layui.use(['form'], function () {
        var form = layui.form;

        //1、最基础的用法 - 直接绑定json
        var xtree1 = new layuiXtree({
            elem: 'xtree1'   //(必填) 放置xtree的容器，样式参照 .xtree_contianer
            , form: form     //(必填) layui 的 from
            , data: json2     //(必填) json数据
        });

        //2、最基础的用法 - 异步加载
        var xtree2 = new layuiXtree({
            elem: 'xtree2'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
            , form: form                    //(必填) layui 的 from
            , data: json2 //(必填) 数据接口，需要返回以上结构的json字符串
            , click: function (data) {  //节点选中状态改变事件监听，全选框有自己的监听事件
                console.log(data.elem); //得到checkbox原始DOM对象
                console.log(data.elem.checked); //开关是否开启，true或者false
                console.log(data.value); //开关value值，也可以通过data.elem.value得到
                console.log(data.othis); //得到美化后的DOM对象
            }
        });

        //提供的方法们

        //获取全部[选中的][末级节点]原checkbox DOM对象，返回Array
        document.getElementById('btn1').onclick = function () {

            var oCks = xtree2.GetChecked(); //这是方法

            for (var i = 0; i < oCks.length; i++) {
                console.log(oCks[i].value);
            }
        }

        //获取全部原checkbox DOM对象，返回Array
        document.getElementById('btn2').onclick = function () {

            var oCks = xtree2.GetAllCheckBox(); //这是方法

            for (var i = 0; i < oCks.length; i++) {
                console.log(oCks[i].value);
            }
        }

        //更新数据，重新渲染
        document.getElementById('btn3').onclick = function () {
            xtree2.render();
        }

        //通过value值找父级DOM对象，顶级节点与错误值均返回null
        document.getElementById('btn4').onclick = function () {

            var oCks = xtree2.GetParent(document.getElementById('txt1').value);  //这是方法

            if (oCks != null) { //如果返回的对象不为null，则获取到父节点了，如果为null，说明这个值对应的节点是一级节点或是值错误
                console.log(oCks.value);
            }
            else {
                console.log('无父级节点或value值错误');
            }

        }


    });




</script>