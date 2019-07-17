package com.nchu.servlet.Course;

import com.nchu.entity.Course;
import com.nchu.services.CourseServices;
import com.nchu.utils.StringHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/course/update")
public class UpdateCourseServlet extends HttpServlet {
    CourseServices courseServices = new CourseServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Cno = (String)request.getSession().getAttribute("upCno");
        String Cname = request.getParameter("Cname");
        String Time_out = request.getParameter("Time_out");

        String Credit=request.getParameter("Credit");
       /* if(request.getParameter("Credit")!= null){
            Credit = Double.parseDouble(request.getParameter("Credit"));
        }*/
        String nullmsg1 = new String();
        if(StringHelper.empty(Cname) || StringHelper.empty(Time_out)|| Credit == null){
            nullmsg1 = "输入内容不能为空";
            request.setAttribute("nmsg1",nullmsg1);
            request.getRequestDispatcher("/Course/update.jsp").forward(request,response);
        }
        else{
            //更新课程信息
            boolean b = courseServices.update(Cno,Cname,Time_out,Double.parseDouble(request.getParameter("Credit")));
            if(b){
                //回到列表页面
                // 在这里应该获取到所有的 课程 信息
                List<Course> list = courseServices.loadAll();
                // 应该发送到页面去进行显示
                request.getSession().setAttribute("courseList" , list );
                // 转发到课程列表页面
                response.sendRedirect("/user/teacher.jsp");
            }
        }
    }
}
