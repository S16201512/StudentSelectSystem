package com.nchu.servlet.Course;

import com.nchu.entity.Select_class;
import com.nchu.services.CourseServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/course/reback")
public class Reback extends HttpServlet {
    CourseServices cs =new CourseServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Sno=(String)request.getSession().getAttribute("Stu_id");
        String courseNo=request.getParameter("id3");
        boolean select=cs.reback(Sno,courseNo);
        List<Select_class> courselist=cs.loadAll(Sno);
        request.getSession().setAttribute("courseList2",courselist);
        response.sendRedirect("/user/student.jsp");
    }
}
