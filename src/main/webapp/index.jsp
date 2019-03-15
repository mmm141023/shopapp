<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>淘宝首页</title>
    <link href="${pageContext.request.contextPath}/static/images/favicon.ico" rel="shortcut Icon" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/static/jquery/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/indexcss.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<body class="layui-layout-body">




<%--新增用户背景变暗的两个div--%>
<div id="light" class="white_content">
    <div style="width: 50px;height: 50px;display: inline-block;text-align: center;line-height: 50px ;color:darkgrey;float: right;margin-right: 5px" >
        <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">关闭</a>
    </div>
    <form class="layui-form" action="${pageContext.request.contextPath}/administrator/addAdmin" method="post">
        <div class="layui-form-item" style="margin: 50px; margin-top: 100px">
            <label class="layui-form-label" >用户名：</label>
            <div class="layui-input-block">
                <input type="text" name="aname" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" style="width: 260px">
            </div>
        </div>
        <div class="layui-form-item"  style="margin: 50px;margin-bottom: 20px">
            <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
            <div class="layui-input-inline">
                <input type="password" name="apwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 260px">
            </div>
        </div>
        <div style="margin-left: 150px">&nbsp;&nbsp;<span style="color: red;display: inline-block;">${error}</span></div>
        <div class="layui-form-item" style="margin-top: 50px">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
                <button type="reset" class="layui-btn layui-btn-primary" style="float: right;margin-right: 100px">重置</button>
            </div>
        </div>
    </form>
</div>

<%--背景遮罩--%>
<div id="fade" class="black_overlay"></div>

<%--编辑修改时的div界面--%>

<div id="lightUpdate" class="white_content">
    <div style="width: 50px;height: 50px;display: inline-block;text-align: center;line-height: 50px ;color:darkgrey;float: right;margin-right: 5px" >
        <a href="javascript:void(0)" onclick="document.getElementById('lightUpdate').style.display='none';document.getElementById('fade').style.display='none'">关闭</a>
    </div>

    <form class="layui-form" action="${pageContext.request.contextPath}/administrator/updateAdmin" method="post">
        <input type="hidden" id="idValue" name="id">
        <div class="layui-form-item" style="margin: 50px; margin-top: 100px">
            <label class="layui-form-label" >用户名：</label>
            <div class="layui-input-block">
                <input type="text" name="aname" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" style="width: 260px" value="${admin.aname}">
            </div>
        </div>
        <div class="layui-form-item"  style="margin: 50px;margin-bottom: 20px">
            <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
            <div class="layui-input-inline">
                <input type="password" name="apwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 260px" value="${admin.apwd}">
            </div>
        </div>
        <div style="margin-left: 150px">&nbsp;&nbsp;<span style="color: red;display: inline-block;">${error}</span></div>
        <div class="layui-form-item" style="margin-top: 50px">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
                <button type="reset" class="layui-btn layui-btn-primary" style="float: right;margin-right: 100px">重置</button>
            </div>
        </div>
    </form>
</div>




<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 30px">爱&nbsp;&nbsp;&nbsp;&nbsp;淘</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/addUserTo?category=user">新增用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">邮件管理</a></dd>
                    <dd><a href="javascript:;">消息管理</a></dd>
                    <dd><a href="javascript:;">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <c:choose>
                    <c:when test="${sessionScope.admin==null }">
                        <a href="${pageContext.request.contextPath}/jumpto/loginPage">
                                <%--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                            登录
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:;">
                            <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                            欢迎您：<i class="layui-icon layui-icon-friends"></i>  ${sessionScope.admin.aname}

                        </a>
                    </c:otherwise>
                </c:choose>
            <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="">基本资料</a></dd>--%>
                    <%--<dd><a href="">安全设置</a></dd>--%>
                <%--</dl>--%>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/login/logout">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">后台管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/administrator/selectAll?category=administrator">管理员管理</a></dd>
                        <dd><a href="javascript:;">用户管理</a></dd>
                        <dd><a href="javascript:;">商品管理</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">商品信息</a></dd>
                        <dd><a href="javascript:;">订单信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->


        <%--首页--%>
        <c:if test="${category == null}">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div class="layui-bg-red"></div>
                    <div class="layui-bg-orange"></div>
                    <div class="layui-bg-green"></div>
                    <div class="layui-bg-blue"></div>
                    <div class="layui-bg-cyan"></div>
                </div>
            </div>
        </c:if>

        <%--管理员管理界面--%>
        <c:if test="${category=='administrator'}" >
            <div style="padding: 15px; background: #dddddd;width: 100%;height: auto;">
                <div class="layui-card" style="width: 70%; margin: 100px auto;">
                    <div class="layui-card-header" style="font-size: 30px;text-align: center">管理员列表
                        <div style="float:right; margin-top: 7px;margin-right: 10px"> <a href="javascript:;" class="layui-btn layui-btn-normal" onclick="document.getElementById('light').style.display='block'; document.getElementById('fade').style.display='block'">新增用户</a>
                            <a href="${pageContext.request.contextPath}/administrator/reToMain" class="layui-btn layui-btn-normal">返回首页</a></div></div>
                    <div class="layui-card-body">
                        <table class="layui-table">
                            <colgroup>
                                <col width="150">
                                <col width="200">
                                <col>
                            </colgroup>
                            <thead>
                            <tr >
                                <th style="text-align: center;">编号</th>
                                <th style="text-align: center;">用户名</th>
                                <th style="text-align: center;">密码</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${admins}" var="obj">
                                <tr>
                                    <td>${obj.id}</td>
                                    <td>${obj.aname}</td>
                                    <td>${obj.apwd}</td>
                                    <td align="center">
                                            <div class="layui-btn-group" >
                                                <a href="javascript:;" class="layui-btn" onclick="document.getElementById('lightUpdate').style.display='block';
                                                var idValue = ${obj.id};
                                                document.getElementById('fade').style.display='block';document.getElementById('idValue').value = idValue">编辑</a>

                                                <a href="${pageContext.request.contextPath}/administrator/deleteById/${obj.id}" class="layui-btn">删除</a>
                                            </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div style="margin:0 auto; width: 700px;height: 40px;">
                                <%--前台分页--%>
                            <div id="pageContain"></div>
                        </div>

                    </div>
                </div>
            </div>
        </c:if>

        <%--新增用户界面--%>
        <c:if test="${category=='user'}">
            <div style="padding: 15px; background: #dddddd;width: 100%;height:auto;">
                <div style="width: 38%;margin: 110px auto; background-color: pink;padding-top: 50px">
                    <form class="layui-form" action="${pageContext.request.contextPath}/user/addUser" method="post">

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名：</label>
                            <div class="layui-input-block" style="width: 400px">
                                <input type="text" name="username" required  lay-verify="required|username" placeholder="请输入用户名" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                            <div class="layui-input-inline" style="width: 400px">
                                <input type="password" name="password" required lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux"></div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">请确认：</label>
                            <div class="layui-input-inline" style="width: 400px">
                                <input type="password" name="password2" required lay-verify="required|password" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux" id="warnWord"></div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">电&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
                            <div class="layui-input-block" style="width: 400px">
                                <input type="text" name="phone" required  lay-verify="required|phone" placeholder="请填写您的电话号码（11位）" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
                            <div class="layui-input-block" style="width: 400px">
                                <input type="text" name="addr" required  lay-verify="required" placeholder="请填写您的详细地址" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
                            <div class="layui-input-block" style="width: 400px">
                                <input type="text" name="email" lay-verify="required|email" id="emailId" required   placeholder="请输入您的邮箱地址" autocomplete="off" class="layui-input" >
                                    <%--发送验证码的button--%>
                                <input type="button" class="layui-btn layui-btn-warm" id="codeBtn" value="发送验证码"></input>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">验证码：</label>
                            <div class="layui-input-block" style="width: 400px ">
                                <input type="text" id="codeValue" name="code" required  lay-verify="required" placeholder="请填写验证码" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">创建日期：</label>
                            <div class="layui-inline" style="width: 400px"> <!-- 注意：这一层元素并不是必须的 -->
                                <input type="text" name="rdate"  id="test11" class="layui-input" lay-verify="required" placeholder="yyyy-MM-dd">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo" id="subBtn">立即提交</button>
                                <div style="width: 70px;height: 50px;float: left"></div>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
    </div>

    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        © chaoyingTB.com - 版权所有 侵权必究
    </div>
</div>


<script>
    //JavaScript代码区域
    layui.use(['jquery','element','carousel','laydate','laypage','form','layer'], function(){
        var element = layui.element;
        var carousel = layui.carousel;
        var laydate = layui.laydate;
        var form = layui.form;
        var laypage = layui.laypage;
        var layer = layui.layer;
        var $ = layui.$;
        var jquery = layui.jquery;


        // 建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height:'100%'
            ,arrow: 'always' //始终显示箭头
            // ,anim: 'fade' //切换动画方式
            ,'interval':2000
        });

        //日期选择
        laydate.render({
            elem: '#test11' //指定元素
        });

        form.verify({
            username: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
            }

            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,password: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });
    });
    var codes = null;
    //点击发送验证码
    $("#codeBtn").click(function () {
        var email = $("#emailId").val();
        if(email == null||email == ''){
            layer.msg("请输入邮箱账号");
            return false;
        }
        $.post(
            "/email/getCode",
            {"email":email},
            function (data) {
                codes = data.codevalue;
                layer.msg(data.flag);
            }
        );
    });

    $("#codeValue").blur(function () {
        var codevalue = $("#codeValue").val();
        if(codevalue == codes){
            layer.msg("验证码正确！");
            $("#subBtn").attr("disabled",false);
        }else{
            layer.msg("验证码输入有误！");
            $("#subBtn").attr("disabled",true);
        }
    });




    $("input[name='password2']").blur(function () {
        var password = $("input[name='password']").val();
        var password2= $("input[name='password2']").val();
        if(password!=null&&password!=''&&password2!=null&&password2!=''){
            if(password2!=password){
                // $("#warnWord").html("两次输入密码不一致！");
                layer.msg("两次输入密码不一致！");
                $("#subBtn").attr("disabled",true);
            }else{
                // $("#warnWord").html("");
                $("#subBtn").attr("disabled",false);
            }
        }
    });


        <%--laypage.render({--%>
        <%--elem: 'pageContain' //注意，这里的 test1 是 ID，不用加 # 号--%>
        <%--,count: ${count} //数据总数，从服务端得到--%>
        <%--,group:4--%>
        <%--,layout:['count','prev', 'page', 'next','skip']--%>
        <%--});--%>
</script>




</body>
</html>