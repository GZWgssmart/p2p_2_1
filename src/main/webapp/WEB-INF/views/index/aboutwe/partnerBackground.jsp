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
    <title>股东背景</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl">
    <%--<%@include file="../master/left.jsp" %>--%>
    <%--信息披露里的左侧边栏--%>
    <%@include file="../../master/aboutLeft.jsp" %>
    <div class="account-right">
        <div class="about-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="active">股东背景</a>
            </div>
            <em class="em-line"></em>
        </div>
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">城兴投资</li>
                <li>盛汇资产</li>
            </ul>
            <div class="layui-tab-content" style="width: 900px">
                <div class="layui-tab-item layui-show">
                    <div id="chengtou" class="content">
                        <p class="text">
                            赣州城兴投资管理有限公司隶属于赣州城市开发投资集团有限责任公司（简称“赣州城投集团”）旗下全资子公司。赣州城投集团成立于2004年3月，2009年9月股权改制为市政府直属、市国资委监管的国有独资企业，注册资本金10亿元。</p>
                        <p class="text">
                            2015年，集团主体信用级别达到AA+，成为江西省内非省会城市中首个主体信用等级达到AA+的城投类公司。成功发起设立300亿元赣南苏区振兴发展产业投资基金，这是国家级首支专项支持革命老区的大体量产业投资基金。集团综合实力在全国城投类企业中排名第43位，是我省唯一一家进入全国50强的城投公司。</p>
                        <p class="text">
                            截至2016年9月底，预计集团总资产680亿元，净资产420亿元，负债率38.23%；筹措资金108.25亿元，完成投资24.10亿元；实现营业收入9.13亿元，利润总额1.49亿元。累计实现融资550.58亿元，完成工程项目88个，项目投资500亿元。</p>
                        <p class="text">
                            赣州城投集团紧紧围绕赣南苏区振兴发展战略，立足做大做强做优，秉承“诚信为本、绩效为先、奉献为责、创新为魂”的企业精神，定位为“三大主体”（即城市建设融资主体、城市投资建设主体和城市国有资源运营主体），致力于打造集融资、投资、建设、运营、管理为一体的资产超千亿元的全国知名、省内一流的国有城市建设投资运营集团。</p>

                        <div class="layui-fluid">
                            <fieldset class="layui-elem-field layui-field-title">
                                <legend></legend>
                            </fieldset>
                            <div class="layui-row">
                                <div class="layui-col-sm4">
                                    <div class="grid-demo grid-demo-bg1">
                                        <img src="<%=path %>/static/images/about/chengtou01.png">
                                        <p>人民医院新院</p>
                                    </div>
                                </div>
                                <div class="layui-col-sm4">
                                    <div class="grid-demo">
                                        <img src="<%=path %>/static/images/about/chengtou02.png">
                                        <p>红旗大道东延返迁房</p>
                                    </div>
                                </div>
                                <div class="layui-col-sm4">
                                    <div class="grid-demo grid-demo-bg1">
                                        <img src="<%=path %>/static/images/about/chengtou03.png">
                                        <p>沙石大桥</p>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-col-sm4">
                                    <div class="grid-demo grid-demo-bg1">
                                        <img src="<%=path %>/static/images/about/chengtou04.png">
                                        <p>锦江山庄</p>
                                    </div>
                                </div>
                                <div class="layui-col-sm4">
                                    <div class="grid-demo">
                                        <img src="<%=path %>/static/images/about/chengtou05.png">
                                        <p>自然博物馆</p>
                                    </div>
                                </div>
                                <div class="layui-col-sm4">
                                    <div class="grid-demo grid-demo-bg1">
                                        <img src="<%=path %>/static/images/about/chengtou06.png">
                                        <p>赣州高等师范专科学校</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div id="shzc" class="content">
                        <p class="text">
                            盛汇资产管理有限公司（简称：赣州盛汇）是由江西盛汇资产管理有限公司和赣州盛汇高管共同持股于2015年5月18日正式成立，主要从事融资担保、产业投资、资产收购、股权管理等主要业务。赣州盛汇因改革而生、凭创新而兴，依托本土银行良好的资源合作关系，以投资成长期、成熟期项目开局，逐步在服务全市经济社会发展大局中形成了民营资本联合国营资本共同参与投资运营的经营架构。凭借稳健的投资理念与丰富的资产管理经验，公司积极开拓基础设施建设、房地产等领域业务，成为整合社会闲置资金与优质资产投资的桥梁。赣州盛汇正坚定不移走市场化转型发展之路，努力加快打造成为集金融综合服务、资产综合管理为一体，以金融控股为主要特征的资产运营公司。</p>
                        <ul class="img-list">
                            <div class="layui-fluid">
                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend></legend>
                                </fieldset>
                                <div class="layui-row">
                                    <div class="layui-col-sm4">
                                        <div class="grid-demo grid-demo-bg1">
                                            <img src="<%=path %>/static/images/about/shenghui01.jpg" width="285" height="200">
                                        </div>
                                    </div>
                                    <div class="layui-col-sm4">
                                        <div class="grid-demo">
                                            <img src="<%=path %>/static/images/about/shenghui02.jpg" width="285" height="200">
                                        </div>
                                    </div>
                                    <div class="layui-col-sm4">
                                        <div class="grid-demo grid-demo-bg1">
                                            <img src="<%=path %>/static/images/about/shenghui03.jpg" width="285" height="200">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row" style="padding-top: 5px;">
                                    <div class="layui-col-sm4">
                                        <div class="grid-demo grid-demo-bg1">
                                            <img src="<%=path %>/static/images/about/shenghui04.jpg" width="285" height="200">
                                        </div>
                                    </div>
                                    <div class="layui-col-sm4">
                                        <div class="grid-demo">
                                            <img src="<%=path %>/static/images/about/shenghui05.jpg" width="285" height="200">
                                        </div>
                                    </div>
                                    <div class="layui-col-sm4">
                                        <div class="grid-demo grid-demo-bg1">
                                            <img src="<%=path %>/static/images/about/shenghui06.jpg" width="285" height="200">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </div>
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
    layui.use(['element'], function () {
        var $ = layui.jquery
            , element = layui.element;
    });
</script>
</body>
</html>
