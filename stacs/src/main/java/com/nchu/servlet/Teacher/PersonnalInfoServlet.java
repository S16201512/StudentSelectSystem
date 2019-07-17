package com.nchu.servlet.Teacher;


import com.nchu.entity.Teacher;
import com.nchu.entity.User;
import com.nchu.services.TeacherServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teacher/personnalInfo")
public class PersonnalInfoServlet extends HttpServlet {
    TeacherServices teacherServices =new TeacherServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute("user");
        Teacher teacher = teacherServices.loadById(user.getId());
        if(teacher != null){
            request.getSession().setAttribute("teacher",teacher);
            response.sendRedirect("/Teacher/personnalInfo.jsp");
        }
        else{
            response.sendRedirect("/Teacher/fail.jsp");
        }
    }
}
