<%--
  Created by IntelliJ IDEA.
  User: hewenyong
  Date: 2018/7/16
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户类型选择</title>
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

        .input-bt{ margin-top:32px; height:40px;}
        .input-bt
        {
            text-decoration:none;
            background:#2f435e;
            color:#f2f2f2;

            padding: 10px 30px 10px 30px;
            font-size:16px;
            font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
            font-weight:bold;
            border-radius:3px;

            -webkit-transition:all linear 0.30s;
            -moz-transition:all linear 0.30s;
            transition:all linear 0.30s;

        }
    </style>
</head>
<body>
<%--logo模块--%>
<div style="width: 100%;height: 12%;margin:0px;padding:0px;border:0px;background-color: #e8f9fb;">
    <a href="/user/admin.jsp">
        <div style="position: relative;float: left;width:278px ;top:10px;height: 67px;left: 20px;background-image: url('../images/nchuloga.png')"></div>
    </a>
</div>



<%--主界面--%>
<div style=";width:100%;height: 85%;border-bottom: 1px solid black ;">

    <%--左侧分块--%>
    <div style="width:16%;height: 100%;border-right: 1px solid black ;float:left ">
        <div style="height: 27%;text-align: center;background-color: #e8f9fb;">
            <div>
                <div style="background-color: #00b0b3;text-align: center;height:22px;text-align: center">当前日期</div><br>
                <div style="padding-top: 10px">
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
                    <br>
                    你好，${user.username}</div>
                <div><a href="/" style="text-decoration: none">注销登录</a></div>
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


        <div>
            <div style="background-color: #00b0b3;text-align: center;height:22px;text-align: center">用户管理</div>


            <div style="height: 8%;text-align: center;background-color: #e8f9fb;padding-top: 10px;border: 1px solid #000000;">
                <a href="typeselect.jsp" name="adduser" class="function" style="text-decoration: none;">增加用户</a>
            </div>

            <div style="height: 8%;text-align: center;background-color: #e8f9fb;padding-top: 10px;border: 1px solid #000000;">
                <a href="subuser.jsp" name="subuser" class="function" style="text-decoration: none;">删除用户</a>
            </div>
        </div>
        <div style="background-color: #00b0b3;text-align: center">找回密码</div>
        <div style="height: 12%;text-align: center;background-color: #e8f9fb;border: 1px solid #000000; padding-top: 15px; ">
            <a href="passwordreset.jsp" name="passwordresert" class="function" style="text-decoration: none;">密码重置</a><br>
            <span>温馨提示:该功能更帮助忘记密码的用户重置密码</span>

        </div>

        <div style="height: 15%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                用户查询
            </div>
            <br>
            <div>
                <a href="/teacher/search" style="text-decoration: none">
                    教师查询
                </a>
            </div>
            <br>
            <div>
                <a href="/student/search" style="text-decoration: none">
                    学生查询
                </a>
            </div>
        </div>

        <div style="height: 20%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                系统列表
            </div>
            <div style="line-height: 30px;text-align: center;background-color: #e8f9fb;">
                学期管理系统
            </div>
            <div style="line-height: 30px;text-align: center;background-color: #e8f9fb;">
                公共课选课系统
            </div>
            <div style="line-height: 30px;text-align: center;background-color: #e8f9fb;">
                上课名单管理系统(补退选)
            </div>
            <div style="line-height: 30px;text-align: center;background-color: #e8f9fb;">
                教材选订系统
            </div>
        </div>

    </div>
    <%--右侧显示与操作模块--%>
    <div style="width: 100%;height: 100%;border: 1px solid black ;text-align: center;background-color: #e8f9fb;">
        <div style="padding-top: 100px">
            <form method="post" action="/servlet/Bianbie ">
                <div>
                    <span style="padding-right: 30px;font-size: 23px;margin-bottom: 20px;">请选择用户身份</span>
                        <select name="identity"  style="height: 30px;width: 60px;">
                            <option  value="学生" >学生</option>
                            <option  value="教师" selected>教师</option>
                        </select>
                </div>
                <br>
                <div style="padding-top: 50px">
                    <span style="padding-right: 30px">
                        <input type="submit" class="input-bt" value="确定" style="">
                    </span>

                    <input type="button" class="input-bt" cname="back" onclick="javascript:history.back(-1);" value="返回上一页">
                </div>
            </form>
        </div>
        <div>选择学生类型，则将进入学生添加界面。选择教师类型，则将进入教师添加界面。</div>
    </div>
        <tr>
            <td colSpan=3 align=middle vAlign=top bgColor=#cfe3f3><table width="800" border="0" align="center" cellpadding="5" cellspacing="0">
                <tr>
                    <td align="center">版权所有&nbsp;&copy;<南昌航空大学162015班HHLW小组></南昌航空大学162015班HHLW小组></td>
                </tr>
                <tr>
                    <td align="center">地址:博学楼20栋 ,  联系电话：考试中心（3863711） 学籍科（3863717） 教务科（3863712） 教研科（3863639） 教材科（3863710）</td>
                </tr>
            </table></td>
        </tr>
</div>


</body>
</html>