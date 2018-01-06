<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
    <head>
        <title>招贤纳士</title>
        <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/about.css">
        <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
        <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
        <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
    </head>
</head>
<style>
    .text,p{
     color: black;
    }
</style>
<body>
<%@include file="../../master/top.jsp" %>
<%@include file="../../master/header.jsp" %>
<div class="account cl">
    <%--<%@include file="../master/left.jsp" %>--%>
    <%--信息披露里的左侧边栏--%>
    <%@include file="../../master/aboutLeft.jsp" %>
    <div class="account-right">
        <div class="about-right">
            <div class="about-right-nav" style="width: 760px;">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="active">招贤纳士</a>
                </div>
                <em class="em-line"></em>
            </div>
            <div class="about-content" style="width: 760px;">
                <div id="zxns" class="content">
                    <p class="text">如果你希望加入最火热的行业--p2p金融……</p>
                    <p class="text">如果你希望与年轻人为伍，渴望求得一份激发你热情的职业……</p>
                    <p class="text">如果你希望成为高手、或者自认为是才高八斗……</p>
                    <p class="text">如果你希望和技术高手为伍，切磋技艺，讨论最前沿的技术、产品……</p>
                    <p class="text">如果你希望挥洒自己的创意，创造出最酷的产品，获得亿万网友好评……</p>
                    <p class="text">如果你希望努力就能获得回报、学习就能不断成长、有成绩就会有机会……</p>
                    <p class="text">如果你希望与公司共同成长，共同收获……</p>
                    <p class="text">我们为你提供广阔的职业发展平台，在这里你能够充分感受p2p金融的魅力、实现自己、成就事业的梦想！</p>
                    <p class="text">我们为你提供富有竞争力的薪酬待遇、轻松惬意的工作氛围、充满活力的团队文化、完善的培训体系和更多的晋升机会。</p>
                    <p class="text">简历发送至<a href="https://www.pujinziben.com/xinyan.feng@pujinziben.com">xinyan.feng@pujinziben.com</a>，请在邮件标题中注明职位。
                    </p>
                    <div class="zx-title" style="margin-top:20px;background-color: white">
                        <div class="children1">职位名称</div>
                        <div class="children2">发布时间</div>
                    </div>

                    <div class="layui-collapse">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">
                                <div>
                                    行政前台
                                    <div style="float: right;margin-right: 20px;">2017-12-23</div>
                                </div>
                            </h2>
                            <div class="layui-colla-content">
                                <p class="tips">岗位职责：</p>
                                <p>
                                    1、协助总裁处理各类信件，起草信函、演讲稿、报告、文件等各类综合性文件；<br>
                                    2、做好各部门及各领导上报行文的保存、管理、督办的工作；<br>
                                    3、合理安排、提醒总裁的日常工作时间和程序；<br>
                                    4、整理公司重要会议记录及会议纪要；<br>
                                    5、关注公司内各部门信息沟通情况，及时传达上级的各项指令；<br>
                                    6、接待访问总裁的重要来宾；<br>
                                    7、完成总裁交办的其他工作的督办、协调及落实任务。
                                </p>
                                <p class="tips">岗位要求：</p>
                                <p>
                                    形象好，气质佳，会应酬，口才好，成熟稳重，有亲和力，诚实守信，沟通能力，性格开朗，品行端正，声音甜美，长相端正，工作负责<br>
                                    1、文秘、行政管理等相关专业大专以上学历；<br>
                                    2、2年以上文秘工作，对于会议管理、记录等具有丰富的经验；<br>
                                    3、工作认真细致，有条理性、逻辑性，良好的职业素养和职业操守，具有良好书面写作及表达能力；<br>
                                    4、熟练使用Word、Excel等文字处理软件，较好英文听、说能力；<br>
                                    5、身高163以上，形象气质好，年龄30岁以下，董事长助理。<br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-collapse">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">
                                <div>文案策划
                                    <div style="float: right;margin-right: 21px;">2017-12-23</div>
                                </div>
                            </h2>
                            <div class="layui-colla-content">
                                <p class="tips">岗位职责：</p>
                                <p>
                                    1、公司文字编辑工作；<br>
                                    2、以效果为导向甄选相应内容进行微信粉丝获取；<br>
                                    3、通过微信公众号和微博扩大品牌影响力；<br>
                                    4、策划和执行适合理财的线上宣传内容，保证粉丝的活跃度和粘性。<br>
                                </p>
                                <p class="tips">文案任职资格：</p>
                                <p>
                                    1、大专以上学历、1-2年以上编辑经验，中文专业优先考虑；<br>
                                    2、熟悉微信软件、较好的文案功底、新闻敏感度高；<br>
                                    3、懂摄影、会修图、审美观较好。<br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-collapse">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">
                                <div class="children1">
                                    人力资源主管
                                    <div style="float: right;margin-right: 22px;">2017-12-23</div>
                                </div>
                            </h2>
                            <div class="layui-colla-content">
                                <p class="tips">岗位职责：</p>
                                <p>
                                    1.负责公司人事制度建立及实施；<br>
                                    2.负责公司人力岗位的编制及招聘、培训、考核工作；<br>
                                    3.负责公司企业文化的建立及持续的改善；<br>
                                    4.负责公司薪资制度的建立及完善；<br>
                                    5.制定公司规章制度，制定员工奖励、激励、惩罚措施，并监督实施；<br>
                                    6.组织协调好公司活动、会议及户外推广活动；<br>
                                    7.负责行全体员工的日常管理工作；确保公司安全稳定正常运作；<br>
                                    8.建立和完善后勤管理各项规章制度；并负责监督、执行与追踪。
                                </p>

                                <p class="tips">任职要求：</p>
                                <p>
                                    1.在大型企业有过人力资源部主管工作经验，至少2年以上；<br>
                                    2.具有较好的沟通协调能力，组织管理能力，较强的执行力，形象气质佳；<br>
                                    3.在互联网金融领域担任过人事行政主管者且有这一领域丰富的人脉资源者。<br>
                                </p>
                            </div>
                        </div>
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
