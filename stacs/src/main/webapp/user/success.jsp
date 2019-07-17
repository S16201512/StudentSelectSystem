<%--
  Created by IntelliJ IDEA.
  User: 12901
  Date: 2018/7/15
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成功</title>
    <style>
        @import "/styles/com.nchu.styles.css";

        div{
            font-size: 15px;
            margin:0px;
            padding:0px;
        }

        h1{
            font-size: 25px;
        }
    </style>
</head>
<body>
<div style="width: 100%;border: 1px solid black ;background-image: url('/images/top2.jpg') ;background-repeat: no-repeat;background-size: cover;
            width: 100%;height: 15%;">
    <div style="position: relative;left: 36px">

        <div style="font-family: 楷体;">
            <c:if test="${not empty user}">
                <div style="font-family: 楷体;font-style: italic;font-size: 180%;color: #030303;padding-top: 10px">
                    <b>
                        <a style="text-decoration:none;" href="/user/admin.jsp" >欢迎进入风神选课系统</a>
                    </b>你好，${user.username}
                </div>

            </c:if>
        </div>
    </div>
    <div style="position: absolute;left: 45px;top:35px;">
        <h1 style="font-family: 楷体;color: #000000;">Feng &nbsp;&nbsp;
            Shen &nbsp;&nbsp;Xuan&nbsp;&nbsp;ke&nbsp;&nbsp;Xi
            &nbsp;&nbsp;Tong
        </h1>
    </div>
</div>

<%--功能跳转栏--%>
<div style="width: 100%;height: 3%;border: 1px solid black ;background-color: #e1dcdc;">
    <div  style="width:12.5%;float: left;text-align:center;">
        <a style="text-decoration:none;" href="/user/teacher.jsp" >主页 </a>
    </div>
    <div  style="width:12.5%; float: left;text-align:center;">
        <a style="text-decoration:none;" href="" >最新通知 </a>
    </div>
    <div  style=" width:12.5%;float: left;text-align:center;">
        <a style="text-decoration:none;"href="" >使用说明</a>
    </div>
    <div  style="width:12.5%; float: left;text-align:center;">
        <a style="text-decoration:none;"href="" >选课原则 </a>
    </div>
    <div  style="width:12.5%; float: left;text-align:center;">
        <a style="text-decoration:none;"href="/course/table?Tno=${user.id}" >课表查询 </a></div>
    <div  style="width:12.5%; float: left;text-align:center;">
        <a style="text-decoration:none;"href="" >教学计划查询</a></div>
    <div style="width:12.5%; float: left;text-align:center;">
        <a style="text-decoration:none;"href="" >个人资料</a>
    </div>
</div>
<%--主界面--%>
<div style=";width:100%;height: 85%;border: 2px solid black  ">

    <%--左侧分块--%>
    <div style="width:16%;height: 100%;border: 1px solid black ;float:left ">
        <div style="height: 27%;text-align: center;background-color: #e8f9fb;">
            当前日期<br>
            <div style="padding-top: 30px">
                    <span id="timestr">
                        <script>
                            <!--获取当前系统时间-->
                            var myDate = new Date();
                            var timestr = myDate.getFullYear()+'年'+(myDate.getMonth()+1)+'月'+myDate.getDate()+'日';
                            document.write(timestr);
                        </script>
                    </span>
            </div>
            <div>
                <span id="timeShow"></span>
                <script language="javascript">
                    var t = null;
                    t = setTimeout(time,1000);//开始执行
                    function time()
                    {
                        clearTimeout(t);//清除定时器
                        dt = new Date();
                        var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
                        var day=dt.getDay();
                        var h=dt.getHours();
                        var m=dt.getMinutes();
                        var s=dt.getSeconds();
                        if(h<10){h="0"+h;}
                        if(m<10){m="0"+m;}
                        if(s<10){s="0"+s;}
                        document.getElementById("timeShow").innerHTML =weekday[day]+""+h+":"+m+":"+s+"";
                        t = setTimeout(time,1000); //设定定时器，循环执行
                    }
                </script>
            </div>

        </div>


        <div style="background-color: #00b0b3;text-align: center">用户管理</div>


        <div style="height: 11%;text-align: center;background-color: #e8f9fb;padding-top: 30px;border: 1px solid #000000;">
            <a href="typeselect.jsp" name="adduser" class="function">增加用户</a>
        </div>
        <div style="height: 11%;text-align: center;background-color: #e8f9fb;padding-top: 30px;border: 1px solid #000000;">
            <a href="uploading.jsp" class="function">批量添加</a>
        </div>
        <div style="height: 11%;text-align: center;background-color: #e8f9fb;padding-top: 30px;border: 1px solid #000000;">
            <a href="subuser.jsp" name="subuser" class="function">删除用户</a>
        </div>
        <div style="background-color: #00b0b3;text-align: center">找回密码</div>
        <div style="height: 16.5%;text-align: center;background-color: #e8f9fb;border: 1px solid #000000;  ">
            <a href="passwordreset.jsp" name="passwordresert" class="function">密码重置</a><br>
            <span>温馨提示:该功能更帮助忘记密码的用户重置密码</span>

        </div>

    </div>
    <%--右侧显示与操作模块--%>
    <div style="width: 83.7%;height: 100%;border: 1px solid black ;float:left ">
        <h1>插入成功</h1>
        <a href="javascript:history.back(-1)">返回上一页</a>
    </div>
</div>


</body>
</html>
