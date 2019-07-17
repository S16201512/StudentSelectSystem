package com.nchu.servlet.Course;

import com.nchu.entity.Course;
import com.nchu.services.CourseServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/course/delete")
public class DeleteCourseServlet extends HttpServlet {
    CourseServices courseServices = new CourseServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Cno = request.getParameter("id");

        //删除课程信息
        boolean b = courseServices.deleteByCno(Cno);
        if(b){
            // 在这里应该获取到所有的 课程 信息
            List<Course> list = courseServices.loadAll() ;
            // 应该发送到页面去进行显示
            request.getSession().setAttribute("courseList" , list );
            // 转发到课程列表页面
            response.sendRedirect("/user/teacher.jsp");
        }
        else{
            response.sendRedirect("/Teacher/fail.jsp");
        }

    }
}
