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

@WebServlet("/course/select")
public class SelectClass extends HttpServlet {
    CourseServices cs =new CourseServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Sno=(String)request.getSession().getAttribute("Stu_id");

        String courseNo=request.getParameter("id2");


        boolean select=cs.select1(Sno,courseNo);
        if(select) {



            List<Select_class> courselist = cs.loadAll(Sno);



            request.getSession().setAttribute("courseList2", courselist);
            response.sendRedirect("/user/student.jsp");
        }else{
            List<Select_class> courselist1=cs.loadAll1();

           List<Select_class> courselist = cs.loadAll(Sno);


            for(Select_class a:courselist){
                if(a.getCno().equals(courseNo)) {
                    a.setSelect_Fail_msg("课程已选,请停止操作");

                }


            }

            request.getSession().setAttribute("courseList",courselist1);
            request.getSession().setAttribute("courseList2", courselist);
            response.sendRedirect("/user/student.jsp");
        }


    }
}
