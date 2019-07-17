package com.nchu.servlet.Admin;

import com.nchu.entity.Student;
import com.nchu.services.StudentServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/search")
public class StudentSerchServlet extends HttpServlet {
    StudentServices studentServices = new StudentServices();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Student> students = studentServices.loadAll();
        System.out.println(students);
        request.getSession().setAttribute("studentList",students);
        if(students != null){
            response.sendRedirect("/user/StudentSearch.jsp");
        }
        else{
            response.sendRedirect("/Teacher/fail.jsp");
        }

    }
}
