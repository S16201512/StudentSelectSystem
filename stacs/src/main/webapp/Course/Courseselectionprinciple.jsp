<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/16
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生选课原则</title>
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
<%--logo模块--%>
<div style="width: 100%;height: 10%;border: 0px solid black ;background-color: rgba(218,255,253,0.81)">
    <div style="position: relative;float: left;width:278px ;top:10px;height: 67px;left: 20px;background-image: url('../images/nchuloga.png')">

    </div>
</div>

<%--功能跳转栏--%>
<div style="width: 100%;height: 3%;border-bottom: 1px solid black ;background-color: #1babb3;">
    <div  style="width:12.5%;float: left;text-align:center;">
        <a style="text-decoration:none;" href="/user/teacher.jsp" >主页 </a>
    </div>
    <div  style="width:12.5%; float: left;text-align:center;">
        <a style="text-decoration:none;" href="/Teacher/newestNotice.jsp">最新通知 </a>
    </div>
    <div  style=" width:12.5%;float: left;text-align:center;">
        <a style="text-decoration:none;"href="/Teacher/instrustion.jsp">使用说明</a>
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
<div style=";width:100%;height: 85%;border-bottom: 1px solid black ;background-color: rgba(218,255,253,0.81) ">
    <%--左侧分块--%>
    <div style="width:16%;height: 100%;border-right: 1px solid black ;float:left ">
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
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;">周一</th>
                    <th style="width: 12.5%;">周二</th>
                    <th style="width: 12.5%;">周三</th>
                    <th style="width: 12.5%;">周四</th>
                    <th style="width: 12.5%;">周五</th>
                    <th style="width: 12.5%;">周六</th>
                    <th style="width: 18.5%;">周日</th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;">1.2</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;">3.4</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;">5.6</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
                    <th style="width: 12.5%;">7.8</th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 12.5%;"></th>
                    <th style="width: 18.5%;"></th>
                </tr>
                <tr  style="width:100%;height: 16px ;font-size: 15px">
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
    <div style="width: 83.7%;height: 100%;border: 0px solid black ;float:left ">
        <div style="width: 100.3%;height: 3.8%;background-color: #1babb3;color: snow ">
            选课原则
        </div>
        <div style="text-align: center ;font-size: 30px;height: 50px;top:50px;position:relative;">
            选课原则
        </div>
        <div style="top: 100px;position:relative;left: 25%;">
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
        <div style="background-color: rgba(218,255,253,0.81)">
            <tr>
                <td colSpan=3 align=middle vAlign=top bgColor=#cfe3f3><table width="800" border="0" align="center" cellpadding="5" cellspacing="0">
                    <tr>
                        <td style="font-size: 15px;" align="center">版权所有&nbsp;&copy;<南昌航空大学162015班HHLW小组></南昌航空大学162015班HHLW小组></td>
                    </tr>
                    <tr>
                        <td style="font-size: 15px;" align="center">地址:博学楼20栋 ,  联系电话：考试中心（3863711） 学籍科（3863717） 教务科（3863712） 教研科（3863639） 教材科（3863710）</td>
                    </tr>
                </table></td>
            </tr>

        </div>
</div>

</body>
</html>
