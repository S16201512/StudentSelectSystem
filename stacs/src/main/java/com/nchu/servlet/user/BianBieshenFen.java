package com.nchu.servlet.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/Bianbie")
public class BianBieshenFen extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identity = request.getParameter("identity");
        if(identity.equals("学生")){
            request.getSession().setAttribute("leiXing","xuesheng");
            response.sendRedirect("/user/adduser.jsp");

        }else if(identity.equals("教师")){
            request.getSession().setAttribute("leiXing","jiaoshi");
            response.sendRedirect("/user/adduser.jsp");

        }
    }
}
