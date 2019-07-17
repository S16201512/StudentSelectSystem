package com.nchu.servlet.Others;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/jiaoWu")
public class JiaoWu extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String 年级=request.getParameter("年级");
        String 学院列表=request.getParameter("学院列表");
        if(年级.equals("年级")){
            request.getSession().setAttribute("MSG","");
        }
    }
}
