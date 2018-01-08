<%--
  Created by IntelliJ IDEA.
  User: yao
  Date: 2018/1/8
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String path = request.getContextPath();
%>
<body>
<style type="text/css">
    <!--
    #demo {overflow:hidden;width:740px; }
    #indemo { float: left; width: 800%;}
    #demo1 { float: left; }
    #demo2 { float: left;margin-left:7px;}
    -->
</style>
<div id="demo">
    <div id="indemo">
        <div id="demo1">
            <a href="#"><img src="<%=path %>/static/images/friend/201612290824515414.jpg" alt="#" /></a>
            <a href="#"><img src="<%=path %>/static/images/friend/201612290824515414.jpg" alt="#" /></a>
            <a href="#"><img src="<%=path %>/static/images/friend/201612290824515414.jpg" alt="#" /></a>
            <a href="#"><img src="<%=path %>/static/images/friend/201612290824515414.jpg" alt="#" /></a>
            <a href="#"><img src="<%=path %>/static/images/friend/201612290824515414.jpg" alt="#" /></a>
            <a href="#"><img src="<%=path %>/static/images/friend/201612290824515414.jpg" alt="#" /></a>
        </div>
        <div id="demo2"></div>
    </div>
</div>
<script>
    <!--
    var speed=30; //数字越大速度越慢
    var tab=document.getElementById("demo");
    var tab1=document.getElementById("demo1");
    var tab2=document.getElementById("demo2");
    tab2.innerHTML=tab1.innerHTML;
    function Marquee(){
        if(tab2.offsetWidth-tab.scrollLeft<=0)
            tab.scrollLeft-=tab1.offsetWidth
        else{
            tab.scrollLeft++;
        }
    }
    var MyMar=setInterval(Marquee,speed);
    tab.onmouseover=function() {clearInterval(MyMar)};
    tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
    -->
</script>
</body>
</html>
