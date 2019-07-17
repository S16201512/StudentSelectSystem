package com.nchu.servlet.user.student;

import com.nchu.entity.File;
import com.nchu.entity.Student;
import com.nchu.services.FileServices;
import com.nchu.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/handle_Button")
public class student_1  extends HttpServlet {
    UserServices us=new UserServices();
    FileServices fileServices = new FileServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");

        if(id.trim().equals("1")){

            request.getSession().setAttribute("Button1","1");
            response.sendRedirect("/user/student.jsp");
        }else if(id.trim().equals("7")){
            request.getSession().setAttribute("Button1","7");
            response.sendRedirect("/user/student.jsp");
        }else if(id.trim().equals("2")){
            request.getSession().setAttribute("Button1","2");
            response.sendRedirect("/user/student.jsp");

        }else if(id.trim().equals("3")){
            request.getSession().setAttribute("Button1","3");
            response.sendRedirect("/user/student.jsp");

        }else if(id.trim().equals("4")){
            request.getSession().setAttribute("Button1","4");
            response.sendRedirect("/user/student.jsp");

        }else if(id.trim().equals("5")){
            List<File> lf = fileServices.loadAllFileName();
            System.out.println("8888888"+lf);
            if (lf==null) {
                String msg = "暂无相关文件";
                request.getSession().setAttribute("file_empty",msg);
            }
            request.getSession().setAttribute("fileList",lf);
            request.getSession().setAttribute("Button1","5");
            response.sendRedirect("/user/student.jsp");

        }else if(id.trim().equals("6")){
            String Sno=(String)request.getSession().getAttribute("Stu_id");
            Student student=us.load(Sno);
            request.getSession().setAttribute("student",student);
            request.getSession().setAttribute("Button1","6");
            response.sendRedirect("/user/student.jsp");

        }
    }
}
