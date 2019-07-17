package com.nchu.servlet.Course;

import com.nchu.entity.Course;
import com.nchu.services.CourseServices;
import com.nchu.services.t_TCServices;
import com.nchu.utils.StringHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/course/add")
public class AddCourseServlet extends HttpServlet {
    CourseServices cs = new CourseServices();
    t_TCServices t_tcServices = new t_TCServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Cname = request.getParameter("Cname") ;
        String Time_out= request.getParameter("Time_out") ;

        String Credit=(String)request.getParameter("Credit");
//        if(Credit !=null){
//            Credit = Double.parseDouble(request.getParameter("Credit")) ;
//        }
        String Cintroduction = request.getParameter("Cintroduction");
        String Tno = (String)request.getSession().getAttribute("tno");
        System.out.println(Cname + " " + Time_out + " " + Credit + " " + Tno + " " );
        String nullmsg = new String();
        if(StringHelper.empty(Cname) || StringHelper.empty(Time_out)|| Credit == null|| StringHelper.empty(Tno)){
            nullmsg = "输入内容不能为空";
            request.setAttribute("nmsg",nullmsg);
            request.getRequestDispatcher("/Course/courseAdd.jsp").forward(request,response);
        }
        else{
            boolean b = cs.add(Cname,Time_out, Double.parseDouble(Credit),Cintroduction,Tno);
            //如果添加成功
            if(b){
                //获取所有老师课程信息
                List<Course> list = cs.loadAll();

                request.getSession().setAttribute("courseList" , list );
                // 转发到教师主页面
                response.sendRedirect("/user/teacher.jsp");
            }
        }
    }
}
