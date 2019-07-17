 <%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/13
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生选课界面</title>
    <style type="text/css">
        @import "../styles/com.nchu.styles.css";
        *{
            margin:0px ;
            padding:0px;
        }
    </style>
</head>
<body>

<div style="width: 100%;height: 10%;background-image: url('/images/nchuloga.png');background-position: left ;
background-repeat:no-repeat;background-color:rgba(218,255,253,0.81); ">




</div>
<div style="width: 100%;height: 3%;border-bottom: 1px solid black;background-color: #1babb3">
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=1">最新通知 </a></div>
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=2" >使用说明 </a></div>
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=3" >选课原则 </a></div>
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=4" >课表查询 </a></div>
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=5" >教学计划查询</a></div>
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=6" >个人资料</a></div>
    <div  style="width:14%;float: left;text-align:center;"><a style="text-decoration:none;"href="/student/handle_Button?id=7" >选课首页</a></div>
</div>
<div style=";width:100%;height: 85.2% ">
    <div style="width:16%;height: 100%;border-bottom: 1px solid black;border-right:1px solid black  ;float:left ">
        <div style="height: 20%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                注销登录
            </div>
            <div style="height: 40%">
                <p style="height:10% "> </p>
               <span style="width:40%">你好 </span>
                <span>${student.getUsername()}!</span>

            </div>
            <div >
                <a href="/" style="text-decoration: none">注销登录</a>

            </div>
        </div>

        <div style="height: 20%;text-align: center;background-color: rgba(218,255,253,0.81);">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                当前日期
            </div>
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
        <div style="height: 25%;text-align: center;background-color: rgba(218,255,253,0.81)">
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
        <div style="height: 35%;text-align: center;background-color: rgba(218,255,253,0.81)">
            <div style="line-height: 30px;text-align: center;background-color: #1babb3">
                课程表示例
            </div>
            <table border="1" style="top:10px;position:relative;height: 85%">
                <tr  style="width:100%;height: 20%  ;font-size: 15px">
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;">周一</th>
                    <th style="width: 12.5%;">周二</th>
                    <th style="width: 12.5%;">周三</th>
                    <th style="width: 12.5%;">周四</th>
                    <th style="width: 12.5%;">周五</th>
                    <th style="width: 12.5%;">周六</th>
                    <th style="width: 18.5%;">周日</th>
                </tr>
                <tr  style="width:100%;height: 16.5%  ;font-size: 15px">
                    <th style="width: 12.5%;">1.2</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16.5%  ;font-size: 15px">
                    <th style="width: 12.5%;">3.4</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16.5%  ;font-size: 15px">
                    <th style="width: 12.5%;">5.6</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16.5%  ;font-size: 15px">
                    <th style="width: 12.5%;">7.8</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16.5% ;font-size: 15px">
                    <th style="width: 12.5%;">9.10</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>

            </table>

        </div>

        <%--<div style="height: 20%;text-align: center;background-color: #ff9b7a">系统列表</div>
        <div style="height: 20%;text-align: center;background-color: #c86fff">课程表</div>
        <div style="height: 20%;text-align: center;background-color: #7eff58">状态图片含义说明</div>--%>
    </div>
    <c:if test="${Button1=='1'}">
        <div style="width: 83.73%;height: 100%;border-bottom:1px solid black;float:left;">
            <div style="width: 100%;height: 4.5%;background-color: rgba(105,200,229,0.81);color: snow  ">
                最新通知
            </div>
            <div style="width: 100%;height: 95%;background-color: rgba(218,255,253,0.81)">
            <div >
                <h1 style="text-align: center">
                    选课须知
                </h1>
            </div>
            <div >
            <p style="text-align: center">
                选课结束后请再次登录,已确认所有所选课程均已选中;
            </p>
            <p style="text-align: center">
                所有操作完成后,请单击“注销”按钮退出选课系统,以免被其他人修改选课结果;
            </p>
            <p style="text-align: center">
                选课结束后,教务科会在期末前将选课结果导入教务系统的数据库,最终名单在“学期所选课程页面”内查询;
            </p>
            <p style="text-align: center">
                如果查询结果与选课结果有差异,请及时联系本学院教务员;
            </p>
            </div>
            </div>

        </div>
    </c:if>
    <c:if test="${Button1=='2'}">
        <div style="width: 83.7%;height: 100%;border-bottom:1px solid black;float:left ">
            <div style="width: 100%;height: 4.5%;background-color: rgba(105,200,229,0.81);color: snow ">
                使用说明
            </div>
            <div style="width: 100%;height: 95%;background-color: rgba(218,255,253,0.81)">
            <div >
                <h1 style="text-align: center">
                    系统介绍
                </h1>

            </div>
            <div>
                <p style="text-align: center">
                    本系统为测试版本,如使用有任何问题请联系开发人员;
                </p>
                <p style="text-align: center">
                    最佳分辨率：1024*768;
                </p>
                <p style="text-align: center">
                    浏览器支持：IE6及以上;
                </p>
                <p style="text-align: center">
                    浏览器设置：必须允许接收外界cookie;
                </p>
            </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Button1=='3'}">
        <div style="width: 83.7%;height: 100%;border-bottom:1px solid black;float:left ">
            <div style="width: 100%;height: 4.5%;background-color: rgba(105,200,229,0.81);color: snow  ">
                选课原则
            </div>
            <div style="width: 100%;height: 95%;background-color: rgba(218,255,253,0.81)">
            <div style="text-align: center ;font-size: 30px;height: 20px;top:0px;position:relative;">
                选课原则
            </div>
            <div style="top: 50px;position:relative;left: 25%;">
                <div style="font-size: 15px;left: 25%;right: 25%;width:50%">
            <span style="width:50%">1、学生应在学院教学主管部门及辅导员指导下进行网上选课，每学期在学校规定时间内依据所在专业教学计划、
            个人教学计划、学生选课手册、参考班级课程表进行选课。</span>
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25%;width:50%">
                    2、本科生网上选课分为三个阶段：预选、正选及补退选。通过接入校园网的计算机进行选课，每学期选课各阶段具体时间见教务处网站通知。
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25% ;width:50%">
                    3、本科生按照四学年（五年制专业按照五学年）安排学习进程，平均每学期选课学分不得少于20学分，不得高于32学分。
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25% ;width:50%">
                    4、学生不能参加未选课程的学习和考核；选课后未在规定时间内办理退选手续而无故不参加课程学习和考核者，该课程成绩记为“0”分，不能取得相应的学分。
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25% ;width:50%">
                    5、核心课组内的必修课程期末考试成绩在40分（不含40分）以下或其补考成绩60分（不含60分）以下必须通过该课程重修取得该课程的学分；
                    拓展课组内的限选课程期末考试成绩在60分（不含60分）以下，可以通过重修该课程取得相应学分，也可以通过选修相应课组下的其它课程取得学分；
                    拓展课组内的任选课程期末考试成绩在60分（不含60分）以下，可以通过选修相应课组下的其它课程取得学分，不设置补考或重修。
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25% ;width:50%">
                    6、学生必须在选课结束后自行打印个人课表，作为选课和上课凭证。
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25% ;width:50%">
                    7、除核心课组的必修课程外，某门课程的选课人数少于20人时。原则上该课程停开，由教务处会同各学院通知学生改选其它课程。
                </div><br>
                <div style="font-size: 15px;left: 25%;right: 25% ;width:50%">
                    8、休学复学、转专业、转学的学生如错过选课时间，
                    《内蒙古农业大学学生选课申请表》，并执此表向教务处教学管理办公室办理选课。
                </div><br>
            </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Button1=='4'}">
        <div style="width: 83.7%;height: 100%;border-bottom:1px solid black;float:left ">
            <div style="width: 100%;height: 4.5%;background-color: rgba(105,200,229,0.81);color: snow  ">
                课表查询
            </div>
            <div style="width: 100%;height: 95%;background-color: rgba(218,255,253,0.81)">
            <div>
                <form action="/student/Query" method="post">
                    <div style="float: left">
                    学年学期 ：
                    <select name="XueNian">
                        <option value="2018-2019,2">2018-2019,2</option>
                        <option value="2018-2019,1">2018-2019,1</option>
                        <option value="2017-2018,2">2017-2018,2</option>
                        <option value="2017-2018,1">2017-2018,1</option>
                        <option value="2016-2017,2">2016-2017,2</option>
                        <option value="2016-2017,1">2016-2017,1</option>

                    </select>
                    </div>
                    <div style="position: relative;left:50px;float: left">
                    课表类型：
                    <input type="radio" checked name="Class_table" value="班级课表">班级课表
                    <input type="radio" name="Class_table" value="教室课表">教室课表

                    <input type="radio" name="Class_table" value="个人课表">个人课表
                    </div>
                    <div style="position: relative;left:120px;float: left">

                    <input type="text" name="Num" placeholder="请输入学生/教室/班级编号">

                    <c:if test="${not empty empty_Num_msg}">
                        <span style="width: 60px;color: #ff07d5">编号不能为空！</span>
                        ${empty_Num_msg=null}

                    </c:if>

                        <input type="submit" value="查看课表" style="position:relative;left: 160px">

                    </div>

                </form>

                <div style="height: 25px"></div>
            </div>


            <c:if test="${not empty class_list}">
            <div style="width: 100%;height: 25px;border: 1px solid dodgerblue;text-align: center">
                课程表
            </div>
                <%--模块内容显示模块--%>
            <div style="text-align: center;width: 100%;height: 100%">

                <table border= "1" style="width: 100%;height:87%">
                    <tr  style="width:100%;height: 120px ">
                        <th style="width: 10%;"></th>
                        <th style="width: 17.8%;">星期一</th>
                        <th style="width: 17.8%;">星期二</th>
                        <th style="width: 17.8%;">星期三</th>
                        <th style="width: 17.8%;">星期四</th>
                        <th style="width: 17.8%;">星期五</th>

                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width:10%;">1,2节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>

                                <c:forEach items="${class_list}" var="workDayo">
                                <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='1,2节'}">
                                <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                            </c:if>
                        </c:forEach>

                        <td style="width: 17.8%;text-align: center">
                            ${c}
                            <br>
                            ${num}
                            <br>
                            ${c1}

                        </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width:10%;">3,4节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty class_list}">
                                <c:forEach items="${class_list}" var="workDayo">
                                <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='3,4节'}">
                                <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                            </c:if>
                        </c:forEach>
                        </c:if>
                        <td style="width: 17.8%;text-align: center">
                            ${c}
                            <br>
                            ${num}
                            <br>
                            ${c1}

                        </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">5,6节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty class_list}">
                                <c:forEach items="${class_list}" var="workDayo">
                                <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='5,6节'}">
                                <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                            </c:if>
                        </c:forEach>
                        </c:if>
                        <td style="width: 17.8%;text-align: center">
                            ${c}
                            <br>
                            ${num}
                            <br>
                            ${c1}

                        </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">7,8节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty class_list}">
                                <c:forEach items="${class_list}" var="workDayo">
                                <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='7,8节'}">
                                <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                            </c:if>
                        </c:forEach>
                        </c:if>
                        <td style="width: 17.8%;text-align: center">
                            ${c}
                            <br>
                            ${num}
                            <br>
                            ${c1}

                        </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">9,10节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty class_list}">
                                <c:forEach items="${class_list}" var="workDayo">
                                <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='9,10节'}">
                                <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                            </c:if>
                        </c:forEach>
                        </c:if>
                        <td style="width: 17.8%;text-align: center">
                            ${c}
                            <br>
                            ${num}
                            <br>
                            ${c1}

                        </td>

                        </c:forEach>
                    </tr>
                </table>

            </div>
                ${class_list=null}
            </c:if>

            <c:if test="${not empty stu_list}">
            <div style="width: 100%;height: 25px;border: 1px solid dodgerblue;text-align: center">
                课程表
            </div>
                <%--模块内容显示模块--%>
            <div style="text-align: center;width: 100%;height: 100%">

                <table border= "1" style="width: 100%;height:87%">
                    <tr  style="width:100%;height: 120px ">
                        <th style="width: 10%;"></th>
                        <th style="width: 17.8%;">星期一</th>
                        <th style="width: 17.8%;">星期二</th>
                        <th style="width: 17.8%;">星期三</th>
                        <th style="width: 17.8%;">星期四</th>
                        <th style="width: 17.8%;">星期五</th>

                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width:10%;">1,2节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>

                                <c:forEach items="${stu_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='1,2节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                        <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                                    </c:if>
                                </c:forEach>

                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}
                                <br>
                                    ${c1}

                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width:10%;">3,4节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty stu_list}">
                                <c:forEach items="${stu_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='3,4节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                        <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}
                                <br>
                                    ${c1}

                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">5,6节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty stu_list}">
                                <c:forEach items="${stu_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='5,6节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                        <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}
                                <br>
                                    ${c1}

                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">7,8节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty stu_list}">
                                <c:forEach items="${stu_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='7,8节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                        <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}
                                <br>
                                    ${c1}

                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">9,10节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty stu_list}">
                                <c:forEach items="${stu_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='9,10节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>
                                        <c:set var = "c1" value ="${workDayo.getRoomNo()}"></c:set>

                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}
                                <br>
                                    ${c1}

                            </td>

                        </c:forEach>
                    </tr>
                </table>

            </div>
                ${stu_list=null}
            </c:if>

            <c:if test="${not empty room_list}">
            <div style="width: 100%;height: 25px;border: 1px solid dodgerblue;text-align: center">
                课程表
            </div>
                <%--模块内容显示模块--%>
            <div style="text-align: center;width: 100%;height: 100%">

                <table border= "1" style="width: 100%;height:87%">
                    <tr  style="width:100%;height: 120px ">
                        <th style="width: 10%;"></th>
                        <th style="width: 17.8%;">星期一</th>
                        <th style="width: 17.8%;">星期二</th>
                        <th style="width: 17.8%;">星期三</th>
                        <th style="width: 17.8%;">星期四</th>
                        <th style="width: 17.8%;">星期五</th>

                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width:10%;">1,2节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>


                                <c:forEach items="${room_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='1,2节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>


                                    </c:if>
                                </c:forEach>

                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}


                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width:10%;">3,4节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty room_list}">
                                <c:forEach items="${room_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='3,4节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>


                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}


                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">5,6节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty room_list}">
                                <c:forEach items="${room_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='5,6节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>


                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}

                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">7,8节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty room_list}">
                                <c:forEach items="${room_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='7,8节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>


                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}


                            </td>
                        </c:forEach>
                    </tr>

                    <tr style="width:100%;height: 15.2% ">
                        <th style="width: 10%;">9,10节</th>
                        <c:forEach var="number" begin="1" end="5" step="1" >
                            <c:set var = "num" value =""></c:set>
                            <c:set var = "c" value =""></c:set>
                            <c:set var = "c1" value =""></c:set>
                            <c:if test="${not empty room_list}">
                                <c:forEach items="${room_list}" var="workDayo">
                                    <c:if test="${workDayo.getKworkDay()==''+number and workDayo.getKno()=='9,10节'}">
                                        <c:set var = "num" value="${workDayo.getTname()}"></c:set>
                                        <c:set var = "c" value ="${workDayo.getCname()}"></c:set>


                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <td style="width: 17.8%;text-align: center">
                                    ${c}
                                <br>
                                    ${num}


                            </td>

                        </c:forEach>
                    </tr>
                </table>

            </div>
                ${room_list=null}
            </c:if>








         </div>
    </c:if>


    <c:if test="${Button1=='5'}">
        <div style="width: 83.7%;height: 100%;border-bottom:1px solid black;float:left ">
            <div style="width: 100%;height: 4.5%;background-color: rgba(105,200,229,0.81);color: snow  ">
                教学计划
            </div>
            <div style="width: 100%;height: 95%;background-color: rgba(218,255,253,0.81)">


            <div style="width: 100%;height: 95%">
                <p>
                    <h1>文化素质课和公共选修课的学分/学时换算办法说明：</h1>
                </p>
                <p>
                    1）2007、2008、2009级，文化素质课和公共选修课每16学时为0.5学分；
                </p>
                <p>
                    2）自2010级开始，文化素质课和公共选修课每16学时为1.0学分。
                </p>
                <p>
                    3）<a href="/images/2018级 软件学院教务安排.txt" download="2018级 软件学院教务安排.txt">2018级 软件学院教务安排.txt</a>
                </p>
                <p>
                    4）<a href="/images/2017级 软件学院教务安排.txt" download="2017级 软件学院教务安排.txt">2017级 软件学院教务安排.txt</a>
                </p>
                <p>
                    5）<a href="/images/2016级 软件学院教务安排.txt" download="2016级 软件学院教务安排.txt">2016级 软件学院教务安排.txt</a>
                </p>
                

                <p>
                    注：毕业审核以此规定为准
                </p>
                <p>
                    由于存在跨年级组班上课情况，部分学生选课时系统中的学分值与本说明不一致的，应以本说明为准。
                </p>
                <p>
                    发现课程学分有误的学生请及时与教务处联系更正。
                </p>
                <div>
                    <h1>教务文件如下：</h1>
                    
                </div>
                <c:if test="${not empty file_empty}">
                    ${file_empty}

                </c:if>

                <c:if test="${not empty fileList}">
                    <c:forEach items="${fileList}" var="fl" varStatus="vs">

                        <p style="">
                         ${vs.count}）   <a href="/uploadfiles/${fl.getFileName()}" download="${fl.getFileName()}">${fl.getFileName()}</a>
                        </p>

                    </c:forEach>

                </c:if>


            </div>
            </div>
        </div>
    </c:if>
    <c:if test="${Button1=='6'}">
        <div style="width: 83.7%;height: 100%;border-bottom:1px solid black;float:left ">
            <div style="width: 100%;height: 4.5%;background-color: rgba(105,200,229,0.81);color: snow  ">
                个人资料
            </div>
            <div style="width: 100%;height: 95%;background-color: rgba(218,255,253,0.81)">
            <div >
                <p>学生姓名：${student.getUsername()}

                </p>
                <p>学生性别：${student.getGender()}

                </p>
                <p>学生身份证号：${student.getSidentityNo()}

                </p>
                <p>学生电话：${student.getStele()}

                </p>
                <p>学生寝室：${student.getSdorm()}

                </p>
                <p>所在部门：${student.getSdept()}

                </p>
                <p>学生生日：${student.getSbirth()}

                </p>
                <p>学生邮箱：${student.getSmail()}

                </p>

            </div>
            </div>
        </div>
    </c:if>

     <c:if test="${Button1=='7'}">
         <div style="width: 83.7%;height: 100%;border-bottom:1px solid black;float:left;background-color: rgba(218,255,253,0.81) ">

             <div style="width: 100%;height: 4.5%;border: 0px solid black  ">
                 <div style="margin-left: 60px;width:18%;float:left" > 课程名称</div>
                 <div style="width:18%;float:left" > 课程学时</div>
                 <div style="width:18%;float:left" > 课程学分</div>
                 <div style="width:18%;float:left" > 授课教师</div>
                 <div style="width:18%;float:left" > 操作</div>
             </div>

             <div style="width: 100%;height: 47%;border: 0px solid black ;">
                 <c:if test="${empty courseList}">
                     <div style="text-align: center">
                         暂无课程

                     </div>

                 </c:if>
                 <c:if test="${not empty courseList}">


                     <c:forEach items="${courseList}" var="course" varStatus = "v">
                         <c:if test="${v.count%2=='1'}">

                         <div style="padding-left: 60px;background-color: #1babb3;width:18% ;float:left">
                                 ${course.getCname()}

                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getTime_out()}
                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getCredit()}
                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getTname()}

                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getSelect_Fail_msg()}

                         </div>
                         <div style="width:23.2% ;background-color: #1babb3;float:left;">
                             <div style="with:50%;float:left;text-align: center;">
                                 <a style="text-decoration:none;text-align: center" href="/course/select?id2=${course.getCno()}">
                                     选课
                                 </a>
                             </div>



                         </div>
                     </c:if>
                         <c:if test="${v.count%2=='0'}">

                     <div style="padding-left: 60px;background-color: rgba(218,255,253,0.81);width:18% ;float:left">
                                     ${course.getCname()}

                             </div>
                     <div style="width:18% ;background-color: rgba(218,255,253,0.81);float:left">
                                     ${course.getTime_out()}
                             </div>
                     <div style="width:18% ;background-color: rgba(218,255,253,0.81);float:left">
                                     ${course.getCredit()}
                             </div>
                     <div style="width:18% ;background-color: rgba(218,255,253,0.81);float:left">
                                     ${course.getTname()}

                             </div>
                     <div style="width:18% ;background-color: rgba(218,255,253,0.81);float:left">
                                     ${course.getSelect_Fail_msg()}

                             </div>
                     <div style="width:23.2% ;background-color: rgba(218,255,253,0.81);float:left;">
                                 <div style="with:50%;float:left;text-align: center;">
                                     <a style="text-decoration:none;text-align: center" href="/course/select?id2=${course.getCno()}">
                                         选课
                                     </a>
                                 </div>




                             </div>
                       </c:if>
                     </c:forEach>
                 </c:if>

             </div>
             <div style="width: 100%;height: 47%;border-top: 1px solid black ">
                 <c:if test="${not empty courseList2}">
                     <c:forEach items="${courseList2}" var="course" varStatus = "vs">
                         <c:if test="${vs.count%2=='1'}">
                         <div style="padding-left: 60px;background-color: #1babb3;width:18% ;float:left">
                                 ${course.getCname()}

                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getTime_out()}
                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getCredit()}
                         </div>
                         <div style="width:18% ;background-color: #1babb3;float:left">
                                 ${course.getTname()}

                         </div>
                         <div style="width:23.2% ;background-color: #1babb3;float:left;">
                             <div style="with:50%;float:left;text-align: center;">
                                 <a  style="text-decoration:none;text-align: center " href="/course/reback?id3=${course.getCno()}">

                                     退选
                                 </a>
                             </div>
                         </div>
                     </c:if>
                         <c:if test="${vs.count%2=='0'}">
                             <div style="margin-left: 60px;width:18% ;float:left">
                                     ${course.getCname()}

                             </div>
                             <div style="width:18% ;float:left">
                                     ${course.getTime_out()}
                             </div>
                             <div style="width:18% ;float:left">
                                     ${course.getCredit()}
                             </div>
                             <div style="width:18% ;float:left">
                                     ${course.getTname()}

                             </div>
                             <div style="width:23.2% ;float:left;">
                                 <div style="with:50%;float:left;text-align: center;">
                                     <a  style="text-decoration:none;text-align: center " href="/course/reback?id3=${course.getCno()}">

                                         退选
                                     </a>
                                 </div>
                             </div>
                         </c:if>





                     </c:forEach>
                 </c:if>



             </div>



         </div>
     </c:if>
        </div>




    </div>
<div style="position: absolute;left: 500px">
    <tr>
        <td colSpan=3 align=middle vAlign=top bgColor=#cfe3f3><table width="800" border="0" align="center" cellpadding="5" cellspacing="0">
            <tr>
                <td style="font-size: 15px;" align="center">版权所有&nbsp;&copy;<南昌航空大学162015班HHLW小组></南昌航空大学162015班HHLW小组></td>
            </tr>
            <tr>
                <td style="font-size: 15px;" align="center">地址:博学楼20栋 ,  联系电话：考试中心（3863711） 学籍科（3863717） 教务科（3863712） 教研科（3863639）&nbsp; &nbsp;&nbsp;教材科（3863710）</td>
            </tr>
        </table></td>
    </tr>

</div>




</body>
</html>
