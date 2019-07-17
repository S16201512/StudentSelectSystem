<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/12
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>欢迎使用选课系统</title>
</head>
<body>
<div style="width: 1024px; margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto;">
    <div style="width: 1024px">
        <div style="float: left; margin-top: 15px"><img src="../images/logo1.png"></div>
        <div style="float: right; margin-top: 15px;"><h1>南昌航空大学选课中心</h1></div>
    </div>

    <div style="width: 1024px">
        <div style="float: left">
            <img src="../images/picture1.jpg" width="820px" height="286px">
        </div>

        <div style="padding-top: 130px;padding-left: 850px">
            <form method="post" action="/user/login">
                <p style="color: #00adff">统一认证登录</p>
                <p>
                    <a style="float: left;font-size: 13px;line-height: 22.8px">工号：</a>
                    <input style="width: 130.8px" type="text" name="id">
                </p>
                <p>
                    <a style="float: left;font-size: 13px;line-height: 22.8px">密码：</a>
                    <input style="width: 130.8px" type="password" name="password">
                </p>
                <p>
                    <a style="float: left;font-size: 13px;line-height: 22.8px">类型：</a>
                    <select name="identity" style="width: 131px;height: 22px">
                        <option value="管理员">管理员</option>
                        <option value="教师">教师</option>
                        <option value="学生" >学生</option>
                    </select>
                </p>
                <c:if test="${ not empty msg }">
                    <div style="color:#ff0000"> ${msg}</div>
                </c:if>
                <p style="padding-left: 50px">
                    <input type="submit" value="登录">
                    <input type="reset">
                </p>
            </form>
        </div>
    </div>

    <div style="float: left;padding-top: 20px">
        <h3>选课须知：<br></h3>
        1. 选课前请务必仔细阅读选课规则和选课使用帮助。<br>
        2. 本选课系统使用统一身份认证的用户名和密码,如果忘记密码,请带学生证到D310重置密码<br>
        3. 选课结束后,请点击选课界面左上方的“注销登录”或者关闭所有浏览器窗口,以免后面的同学篡改您的选课结果。
    </div>
</div>

</body>
</html>
