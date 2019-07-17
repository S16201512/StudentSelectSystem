package com.nchu.servlet.Course;

import com.nchu.entity.Course;
import com.nchu.services.CourseServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course/load")
public class LoadByCnoServlet extends HttpServlet {

    CourseServices cs = new CourseServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Cno = request.getParameter("Cno") ;
        Course c = cs.loadByCno( Cno ) ;
        request.getSession().setAttribute("course" , c );
        response.sendRedirect("/courses/update.jsp");
    }


}
