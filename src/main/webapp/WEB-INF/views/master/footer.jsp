<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="ajaxFooter">


    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="tencent://message/?uin=1531952273&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="<%=path %>/calc/calc" target="_blank" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="sidebar-top"></a></li>
        </ul>
    </div>
    <!-- concat -->
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">
                <img src="<%=path%>/static/images/index_erweima.png" alt="扫码关注普金资本">
            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_text">
                    <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
                    <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">
                                关注普金资本公众号
                                <img style="width: 110px;height: 105px;" src="<%=path%>/static/images/wechart.jpg">
                            </span>
							<span class="line_l_pic"></span>
						</span>
                    </a>
                    <a target="_blank" href="#" class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="#">网贷天眼</a>
                <a target="_blank" href="#">网贷天下</a>
                <a target="_blank" href="#">中国平安银行</a>
                <a target="_blank" href="#">中国建设银行</a>
                <a target="_blank" href="#">网贷东方</a>
                <a target="_blank" href="#">第一网贷</a>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="#"class="beian">赣ICP备16004010号</a>
                <a href="#">
                    <img src="<%=path%>/static/images/CNZZ.png" alt="">
                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian">
                    <img src="<%=path%>/static/images/beian.png" style="float:left;">赣公网安备 36070202000195号
                </a>

            </p>
            <div class="footer-list" style="width:650px;text-align:center">
                    <img src="<%=path%>/static/images/foot2.png" border="0">

                    <img src="<%=path%>/static/images/ft_link_02.png" alt="">

                    <img width="110px" height="40px" src="<%=path%>/static/images/p2p_bottom_large_img.jpg" alt="">

                    <img src="<%=path%>/static/images/ft_link_04.png" alt="">

                    <img width="112px" height="34px" src="<%=path%>/static/images/foot1.png">

            </div>
        </div>
    </div>
    <div class="popup wechart-box">
        <p class="title left">关注普金资本微信公众号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <img class="wechart" src="<%=path%>/static/images/wechart.jpg">
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script>
    $('.sidebar-top').click(function(){
        $('body').scrollTop(0);
    });
</script>