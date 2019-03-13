<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/11
  Time: 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登录</title>
    <link href="${pageContext.request.contextPath}/static/images/favicon.ico" rel="shortcut Icon" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/static/jquery/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/logincss.css">
</head>
<body>
<%--背景--%>
<div class="mask_bg"></div>
<%--背景遮罩--%>
<div class="mask"></div>

<div class="title">
    <div class="returnIndex">
        <a href="#">关于我们</a>
        <a href="${pageContext.request.contextPath}/login/returnToIndex">返回首页</a>
    </div>
</div>
<%--三个笑脸图标--%>
<div class="icon_main">
    <i class="layui-icon layui-icon-face-surprised layui-icon-face-surprised1"></i>
    <i class="layui-icon layui-icon-face-surprised layui-icon-face-surprised2"></i>
    <i class="layui-icon layui-icon-face-surprised layui-icon-face-surprised3"></i>
</div>

<%--登录窗口--%>
<div class="login">
    <ul class="layui-nav" lay-filter="">
        <li class="layui-nav-item " style="width: 200px; text-align: center"><a href="">QQ登录</a></li>
        <li class="layui-nav-item " style="width: 200px; text-align: center"><a href="" >微信登录</a></li>
    </ul>
    <div class="form_login">
        <form class="layui-form" action="${pageContext.request.contextPath}/login/checkAdmin" method="post">
            <div class="layui-form-item" style="margin: 50px; margin-top: 100px">
                <label class="layui-form-label" >用户名：</label>
                <div class="layui-input-block">
                    <input type="text" name="aname" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" style="width: 200px">
                </div>
            </div>
            <div class="layui-form-item"  style="margin: 50px;margin-bottom: 20px">
                <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="apwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 200px">
                </div>
            </div>
            <div style="margin-left: 150px">&nbsp;&nbsp;<span style="color: red;display: inline-block;">${error}</span></div>
            <div class="layui-form-item" style="margin-top: 50px">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary" style="float: right;margin-right: 100px">重置</button>
                </div>
            </div>
        </form>
    </div>

</div>
</body>

<script>
    layui.use(['element','form','layer'], function(){
        var element = layui.element;
        var form = layui.form;
        var layer = layui.layer;


    });
</script>
</html>
