<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/15
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课表查询</title>
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

        th{
            font-size: 15px;
            height:  120px;
            text-align:center;
        }
        td{
            font-size: 15px;
            text-align: center;
            height:  120px;
        }
        
    </style>
</head>
<body>

<%--logo模块--%>
<div style="width: 100%;height: 10%;border: 0px solid black ;background-color: rgba(218,255,253,0.81)">
    <div style="position: relative;float: left;width:278px ;top:10px;height: 67px;left: 20px;background-image: url('../images/nchuloga.png')">

    </div>
</div>

    <%--功能跳转栏--%>
    <div style="width: 100%;height: 3%;border-bottom: 1px solid black;background-color: #1babb3; ">
        <div  style="width:12.5%;float: left;text-align:center;">
            <a style="text-decoration:none;" href="/user/teacher.jsp" >主页 </a>
        </div>
        <div  style="width:12.5%; float: left;text-align:center;">
            <a style="text-decoration:none;" href="/Teacher/newestNotice.jsp" >最新通知 </a>
        </div>
        <div  style=" width:12.5%;float: left;text-align:center;">
            <a style="text-decoration:none;"href="/Teacher/instrustion.jsp" >使用说明</a>
        </div>
        <div  style="width:12.5%; float: left;text-align:center;">
            <a style="text-decoration:none;"href="/Course/Courseselectionprinciple.jsp" >选课原则 </a>
        </div>
        <div  style="width:12.5%; float: left;text-align:center;">
            <a style="text-decoration:none;"href="/course/table" >课表查询 </a></div>
        <div  style="width:12.5%; float: left;text-align:center;">
            <a style="text-decoration:none;"href="/Course/CoursePlanSerach.jsp" >教学计划查询</a></div>
        <div style="width:12.5%; float: left;text-align:center;">
            <a style="text-decoration:none;"href="/teacher/personnalInfo" >个人资料</a>
        </div>
    </div>
<%--主界面--%>
<div style=";width:100%;height: 89%;border-bottom: 1px solid black ;background-color: rgba(218,255,253,0.81) ">
    <%--左侧分块--%>
    <div style="width:16%;height: 100%;left: 0px;border-right: 1px solid black ;float:left ">
        <div style="height: 23%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                当前日期
            </div>
            <br>
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
        <div style="height: 20%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                系统列表
            </div>
            <div style="line-height: 30px;text-align: center;background-color: rgba(218,255,253,0.81)">
                学期管理系统
            </div>
            <div style="line-height: 30px;text-align: center;background-color: rgba(218,255,253,0.81)">
                公共课选课系统
            </div>
            <div style="line-height: 30px;text-align: center;background-color: rgba(218,255,253,0.81)">
                上课名单管理系统(补退选)
            </div>
            <div style="line-height: 30px;text-align: center;background-color: rgba(218,255,253,0.81)">
                教材选订系统
            </div>
        </div>
        <div style="height: 28%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                课程表示例
            </div>
            <table border="1" style="top:10px;position:relative">
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;">周一</th>
                    <th style="width: 12.5%;height: 16px ;">周二</th>
                    <th style="width: 12.5%;height: 16px ;">周三</th>
                    <th style="width: 12.5%;height: 16px ;">周四</th>
                    <th style="width: 12.5%;height: 16px ;">周五</th>
                    <th style="width: 12.5%;height: 16px ;">周六</th>
                    <th style="width: 12.5%;height: 16px ;">周日</th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;height: 16px ;">1.2</th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;height: 16px ;">3.4</th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;height: 16px ;">5.6</th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;height: 16px ;">7.8</th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;height: 16px ;">9.10</th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                    <th style="width: 12.5%;height: 16px ;"></th>
                </tr>

            </table>

        </div>
        <div style="height: 20%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                学校新闻
            </div>
            <!--公告1-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    全省师德建设长效机制贯彻落实情况学校及.
                </div>
            </div>

            <!--公告2-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    校领导看望慰问留校学生和宿管人员.
                </div>
            </div>

            <!--公告3-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    南昌航空大学新增工程学学科进入ESI全球排
                </div>
            </div>

            <!--公告4-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    学校按照省委省政府要求积极推进落实2018
                </div>
            </div>

            <!--公告5-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    郭杰忠一行走访校友企业
                </div>
            </div>

            <!--公告6-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    校美国北爱荷华大学校长Mark A. Nook.
                </div>
            </div>

            <!--公告7-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    【“三下乡”】我校“追寻总书记足迹”主
                </div>
            </div>

            <!--公告8-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    “时代楷模”王传喜
                </div>
            </div>

            <!--公告8-->
            <div style = " height: 20px;left: 0px ;float:left; background-position:center;">
                <div style="background-image: url('../images/ico.gif');background-repeat: no-repeat;  width:7px;height:11px;float:left;padding: 1px;margin-top: 5px;"></div>
                <div style = "font-size: 15px;color: black; float:left">
                    南昌航空大学“天宫开悟”项目赴.
                </div>
            </div>
        </div>
    </div>
    <%--右侧显示与操作模块--%>
    <div style="width: 83.7%; left: 16%;height: 100%;border: 0px solid black ;float:left ">
        <form style="height: 25px; float: left;" method="post" action="/course/table">
            <span style="top:10px;left:10px;position:relative">
                请选择
            </span>
            <select name="semester" style="position:relative ;left: 20px;top: 10px;height: 30px ;width: 120px ;text-align: left">
                <option>学期</option>
                <option>2016-2017上学期</option>
                <option>2016-2017下学期</option>
                <option>2017-2018上学期</option>
                <option>2017-2018下学期</option>
            </select>

            <span style="top:10px;left:30px;position:relative">
                请选择
            </span>
            <select name="week" style="position:relative ;left: 40px;top: 10px;height: 30px ;width: 120px ;text-align: left">
                <option>周次</option>
                <option>第一周</option>
                <option>第二周</option>
                <option>第三周</option>
                <option>第四周</option>
                <option>第五周</option>
                <option>第六周</option>
                <option>第七周</option>
                <option>第八周</option>
                <option>第九周</option>
                <option>第十周</option>
                <option>第十一周</option>
                <option>第十二周</option>
                <option>第十三周</option>
                <option>第十四周</option>
                <option>第十五周</option>
                <option>第十六周</option>
                <option>第十七周</option>
                <option>第十八周</option>
            </select>
            <div style="left: 400px;top: -17px ;position: relative;">
                <input type="submit" name="确定">
                <input type="reset" name="取消">
            </div>

        </form>
        <br>
        <br>
        <br>

        <div style="width: 100%;height: 25px;border: 1px solid #1babb3;text-align: center;background-color:#1babb3 ">
            课程表
        </div>
        <%--模块内容显示模块--%>
        <div style="text-align: center;width: 100%;height: 100%">
            <table border= "1" style="width: 100%">
                <tr  style="width:100%;height: 120px ">
                    <th style="width: 12.5%;">课程\工作日</th>
                    <th style="width: 12.5%;">星期一</th>
                    <th style="width: 12.5%;">星期二</th>
                    <th style="width: 12.5%;">星期三</th>
                    <th style="width: 12.5%;">星期四</th>
                    <th style="width: 12.5%;">星期五</th>
                    <th style="width: 12.5%;">星期六</th>
                    <th style="width: 18.5%;">星期日</th>
                </tr>

                <tr style="width:100%;height: 120px ">
                    <th style="width: 12.5%;">1,2节</th>
                    <c:forEach var="number" begin="1" end="7" step="1" >
                        <c:set var = "num" value =""></c:set>
                        <c:set var = "c" value =""></c:set>
                        <c:if test="${not empty tableList}">
                            <c:forEach items="${tableList}" var="courseTable">
                                <c:if test="${courseTable.getKworkDay()==number and courseTable.getKno()=='1.2节'}">
                                    <c:set var = "num" value="${courseTable.getCno()}"></c:set>
                                    <c:set var = "c" value ="${courseTable.getCroom()}"></c:set>
                                </c:if>
                            </c:forEach>
                        </c:if>
                            <td style="width: 12.5%;">
                                    ${num}
                                    <br>
                                    ${c}

                            </td>
                    </c:forEach>
                </tr>

                <tr style="width:100%;height: 120px ">
                    <th style="width: 12.5%;">3,4节</th>
                    <c:forEach var="number" begin="1" end="7" step="1" >
                        <c:set var = "num" value =""></c:set>
                        <c:set var = "c" value =""></c:set>
                        <c:if test="${not empty tableList}">
                            <c:forEach items="${tableList}" var="courseTable">
                                <c:if test="${courseTable.getKworkDay()==number and courseTable.getKno()=='3.4节'}">
                                    <c:set var = "num" value="${courseTable.getCno()}"></c:set>
                                    <c:set var = "c" value ="${courseTable.getCroom()}"></c:set>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td style="width: 12.5%;">
                                ${num}
                                <br>
                                ${c}
                        </td>
                    </c:forEach>
                </tr>

                <tr style="width:100%;height: 120px ">
                    <th style="width: 12.5%;">5,6节</th>
                    <c:forEach var="number" begin="1" end="7" step="1" >
                        <c:set var = "num" value =""></c:set>
                        <c:set var = "c" value =""></c:set>
                        <c:if test="${not empty tableList}">
                            <c:forEach items="${tableList}" var="courseTable">
                                <c:if test="${courseTable.getKworkDay()==number and courseTable.getKno()=='5.6节'}">
                                    <c:set var = "num" value="${courseTable.getCno()}"></c:set>
                                    <c:set var = "c" value ="${courseTable.getCroom()}"></c:set>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td style="width: 12.5%;">
                                ${num}
                                    <br>
                                        ${c}
                        </td>
                    </c:forEach>
                </tr>

                <tr style="width:100%;height: 120px ">
                    <th style="width: 12.5%;">7,8节</th>
                    <c:forEach var="number" begin="1" end="7" step="1" >
                        <c:set var = "num" value =""></c:set>
                        <c:set var = "c" value =""></c:set>
                        <c:if test="${not empty tableList}">
                            <c:forEach items="${tableList}" var="courseTable">
                                <c:if test="${courseTable.getKworkDay()==number and courseTable.getKno()=='7.8节'}">
                                    <c:set var = "num" value="${courseTable.getCno()}"></c:set>
                                    <c:set var = "c" value ="${courseTable.getCroom()}"></c:set>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td style="width: 12.5%;">
                                ${num}
                                <br>
                                 ${c}
                        </td>
                    </c:forEach>
                </tr>

                <tr style="width:100%;height: 120px ">
                    <th style="width: 12.5%;">9,10节</th>
                    <c:forEach var="number" begin="1" end="7" step="1" >
                        <c:set var = "num" value =""></c:set>
                        <c:set var = "c" value =""></c:set>
                        <c:if test="${not empty tableList}">
                            <c:forEach items="${tableList}" var="courseTable">
                                <c:if test="${courseTable.getKworkDay()==number and courseTable.getKno()=='9.10节'}">
                                    <c:set var = "num" value="${courseTable.getCno()}"></c:set>
                                    <c:set var = "c" value ="${courseTable.getCroom()}"></c:set>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td style="width: 12.5%;">
                                ${num}
                                    <br>
                                        ${c}
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </div>

    </div>
        <div style="background-color: rgba(218,255,253,0.81)">
            <tr>
                <td colSpan=3 align=middle vAlign=top bgColor=#cfe3f3>
                    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0" style="height:100px;">
                        <tr >
                            <td style="height:30%;font-size: 15px;" align="center">版权所有&nbsp;&copy;<南昌航空大学162015班HHLW小组></南昌航空大学162015班HHLW小组></td>
                        </tr>
                        <tr >
                            <td style="height:30%;font-size: 15px;" align="center">地址:博学楼20栋 ,  联系电话：考试中心（3863711） 学籍科（3863717） 教务科（3863712） 教研科（3863639） 教材科（3863710）</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </div>
</div>
</body>
</html>
