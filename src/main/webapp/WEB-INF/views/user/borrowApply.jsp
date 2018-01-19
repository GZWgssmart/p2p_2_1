<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/22
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>申请借款</title>
    <link rel="stylesheet" href="<%=path%>/static/css/front/public.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/static/css/front/account.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<%@include file="../master/top.jsp"%>
<%@include file="../master/header.jsp"%>
<div class="account cl">
    <%@include file="../master/left.jsp"%>
    <div class="account-right">
        <h1>申请借款</h1>
        <hr/>
        <form class="layui-form" id="borrowApplyDetail">
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="rname" lay-verify="required" autocomplete="off" placeholder="请输入真实姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">申请金额</label>
                <div class="layui-input-block">
                    <input type="text" name="money" lay-verify="required|number" autocomplete="off" placeholder="请输入申请金额" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">借款类型</label>
                <div class="layui-input-block">
                    <select name="type">
                        <option value="1">个人</option>
                        <option value="2">企业</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">标种</label>
                <div class="layui-input-block">
                    <select name="bzid">
                        <option value="2">普金宝</option>
                        <option value="1">恒金宝</option>
                        <option value="3">多金宝</option>
                        <option value="4">新手标</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">借款期限</label>
                <div class="layui-input-block">
                    <select name="term">
                        <option value="3">3个月</option>
                        <option value="6" selected="">6个月</option>
                        <option value="12">12个月</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">截止时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="deadline" class="layui-input" id="deadline" placeholder="yyyy-MM-dd">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年化收益(%)</label>
                <div class="layui-input-block">
                    <input type="text" name="nprofit" autocomplete="off" placeholder="请输入年化收益" class="layui-input" lay-verify="required|number">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收益方式</label>
                <div class="layui-input-block">
                    <select name="way">
                        <option value="1">等额本息</option>
                        <option value="2">等额本金</option>
                        <option value="3">先息后本</option>
                        <option value="4">一次还清</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">资金用途</label>
                <div class="layui-input-block">
                    <textarea name="mpurpose" placeholder="请输入资金用途" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">还款来源</label>
                <div class="layui-input-block">
                    <textarea name="hksource" placeholder="请输入还款来源" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">借款人介绍</label>
                <div class="layui-input-block">
                    <textarea name="suggest" placeholder="请输入借款人介绍" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">项目描述</label>
                <div class="layui-input-block">
                    <textarea name="xmdes" placeholder="请输入项目描述" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">保障措施</label>
                <div class="layui-input-block">
                    <textarea name="guarantee" placeholder="请输入保障措施" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <label class="layui-form-label">相关文件</label>
                    <div class="layui-col-md2">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="fpic">法人身份证</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="fpicDemo" style="width:120px;height:120px">
                                <p id="fpicText"></p>
                            </div>
                        </div>
                        <input type="hidden" name="fpic" id="fpicImg"/>
                    </div>
                    <div class="layui-col-md2">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="ypic">营业执照</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="ypicDemo" style="width:120px;height:120px">
                                <p id="ypicText"></p>
                            </div>
                        </div>
                        <input type="hidden" name="ypic" id="ypicImg"/>
                    </div>
                    <div class="layui-col-md2">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="qpic">银行卡</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="qpicDemo" style="width:120px;height:120px">
                                <p id="qpicText"></p>
                            </div>
                        </div>
                        <input type="hidden" name="qpic" id="qpicImg"/>
                    </div>
                    <div class="layui-col-md2">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="tpic">其他资料</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="tpicDemo" style="width:120px;height:120px">
                                <p id="tpicText"></p>
                            </div>
                        </div>
                        <input type="hidden" name="tpic" id="tpicImg"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="borrowApply">提交申请</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="../master/footer.jsp"%>
</body>
<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/current.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/front/wenxin.js"></script>
<script>
    var nowDate = new Date();
    layui.use(['form', 'laydate', 'upload'], function() {
        var laydate = layui.laydate;
        var form = layui.form;
        var upload = layui.upload;
        var $ = layui.jquery, layer = layui.layer;

        var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
        var ins22 = laydate.render({
            elem: '#deadline'
            ,value: dateStr
            , min: dateStr
            ,ready: function(){
                ins22.hint('日期可选值设定在 <br> '+ dateStr + '之后');
            }
        });

        uploadImg(upload, 'fpic', '<%=path %>/file/firist', 'fpicDemo', 'fpicImg', 'fpicText');
        uploadImg(upload, 'ypic', '<%=path %>/file/firist', 'ypicDemo', 'ypicImg', 'ypicText');
        uploadImg(upload, 'qpic', '<%=path %>/file/firist', 'qpicDemo', 'qpicImg', 'qpicText');
        uploadImg(upload, 'tpic', '<%=path %>/file/firist', 'tpicDemo', 'tpicImg', 'tpicText');

        form.on('submit(borrowApply)', function (data) {
            $.post('<%=path %>/data/borrow/save',
                $('#borrowApplyDetail').serialize(),
                function (res) {
                    if (res.code === 0) {
                        utils.alert('提交成功', function () {
                            location.reload(true);
                        });
                    } else {
                        utils.alert("提交失败！");
                    }
                }, 'json'
            );
            return false;
        });
    });
</script>
</html>
