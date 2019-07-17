package com.nchu.servlet.user.student;

import com.nchu.entity.Class_Arrange_Class;
import com.nchu.entity.Class_Arrange_Room;
import com.nchu.entity.Class_Arrange_Stu;
import com.nchu.services.CourseServices;
import com.nchu.utils.StringHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/Query")
public class studentQuery extends HttpServlet {
    CourseServices Load_table =new CourseServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String XueNian=request.getParameter("XueNian");
        String Class_table=request.getParameter("Class_table");
        String Num=request.getParameter("Num");
        System.out.println("XueNian"+XueNian+"Class_table"+Class_table+"Num"+Num);
        if(StringHelper.empty(Num)){
            request.getSession().setAttribute("empty_Num_msg","编号不能为空");
            response.sendRedirect("/user/student.jsp");

        }else if(Class_table.equals("班级课表")){
            List<Class_Arrange_Class> class_list=Load_table.load_KeBiao1(XueNian,Num);
            request.getSession().setAttribute("class_list",class_list);
            response.sendRedirect("/user/student.jsp");




        }else if(Class_table.equals("个人课表")){
            List<Class_Arrange_Stu> stu_list=Load_table.load_KeBiao3(XueNian,Num);
            request.getSession().setAttribute("stu_list",stu_list);
            response.sendRedirect("/user/student.jsp");
        }else if(Class_table.equals("教室课表")){

            List<Class_Arrange_Room> room_list=Load_table.load_KeBiao2(XueNian,Num);
            request.getSession().setAttribute("room_list",room_list);
            response.sendRedirect("/user/student.jsp");

        }


    }
}
