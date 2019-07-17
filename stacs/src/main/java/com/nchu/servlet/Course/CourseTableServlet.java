package com.nchu.servlet.Course;

import com.nchu.entity.CourseTable;
import com.nchu.entity.User;
import com.nchu.services.CourseTableServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/course/table")
public class CourseTableServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseTableServices courseTableServices = new CourseTableServices();

        String  semester = request.getParameter("semester");
        String week = request.getParameter("week");
        User u = (User)request.getSession().getAttribute("user");

        List<CourseTable> courseTableList= courseTableServices.loadByTnoSeW(u.getId(),semester,week);

        if(courseTableList != null){
            request.getSession().setAttribute("tableList",courseTableList);
            response.sendRedirect("/Course/CourseTable.jsp");
        }
        else{
            response.sendRedirect("/Teacher/fail.jsp");
        }
    }
}
