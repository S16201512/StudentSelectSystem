package com.nchu.servlet.Admin;

import com.nchu.entity.Course;
import com.nchu.entity.Student;
import com.nchu.entity.Teacher;
import com.nchu.services.StudentServices;
import com.nchu.services.TeacherServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebEndpoint;
import java.io.IOException;
import java.net.HttpCookie;
import java.util.List;

@WebServlet("/teacher/search")
public class TeacherSearchServlet extends HttpServlet {
    TeacherServices teacherServices = new TeacherServices();
    StudentServices studentServices = new StudentServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> teachers = teacherServices.loadAll();
        request.getSession().setAttribute("teacherList",teachers);
        if(teachers != null){
            response.sendRedirect("/user/showUsers.jsp");
        }
       else{
            response.sendRedirect("/user/fail.jsp");
        }
    }
}
