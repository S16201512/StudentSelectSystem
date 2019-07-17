package com.nchu.servlet.Course;

import com.nchu.entity.Course;
import com.nchu.services.CourseServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course/detail")
public class DetailCourseServlet extends HttpServlet {
    CourseServices courseServices = new CourseServices();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Cno = request.getParameter("id");
        Course c = courseServices.loadByCno(Cno);
        if( c !=null){
            request.getSession().setAttribute("course",c);
            response.sendRedirect("/Course/detail.jsp");
        }
        else{
            response.sendRedirect("Teacher/fail.jsp");
        }
    }
}
