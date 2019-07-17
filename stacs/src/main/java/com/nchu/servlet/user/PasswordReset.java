package com.nchu.servlet.user;

import com.nchu.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/passwordreset")
public class PasswordReset extends HttpServlet {

    UserServices userServices = new UserServices() ;
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String adminPassword = request.getParameter("adminPassword");
        String identity = request.getParameter("identity");

        if (id.trim().length() == 8) {
            //进来了,说明学号满足长度为8位
            // 检验用户名是否存在
            boolean isUnique = userServices.isUnique(id, identity);
            if (!isUnique) {
                // 能进入到这里，应该是用户已经存在（ 用户编号是没有问题的）
                response.getWriter().print("<h1>身份验证成功</h1>");
                request.setAttribute("id",id);
                request.setAttribute("identity",identity);
                request.getRequestDispatcher("/user/passwordreset2.jsp").forward(request,response);


            }else{
            //用户不唯一
            String msg = "账号验证失败！ ";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/user/passwordreset.jsp").forward(request, response);
            }
        }else{
            //学号长度不为8位
            String msg = "账号验证失败！！ ";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/user/passwordreset.jsp").forward(request, response);
        }
    }
}
