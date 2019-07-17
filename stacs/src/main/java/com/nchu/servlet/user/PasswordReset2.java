package com.nchu.servlet.user;

import com.nchu.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/passwordreset2")
public class PasswordReset2 extends HttpServlet {

    // 针对于 User 进行提供服务的类
    UserServices userServices = new UserServices() ;

    /**
     * 错误反馈
     * @param msg_name
     * @param msg
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void errorResponse(String identity,String msg_name , String msg , HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setAttribute(msg_name, msg);
        request.setAttribute("identity",identity);
        request.getRequestDispatcher("/user/passwordreset2.jsp").forward(request, response);
    }


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String inputCode = request.getParameter("inputCode") ;
        String code = (String) request.getSession().getAttribute("code") ;
        String identity = request.getParameter("identity");
        System.out.println("888888888"+identity);
        if("".equals(newPassword) &&"".equals(confirmPassword) ){
            String newPassword_msg = "密码不能为空！ ";
            errorResponse(identity,"newPassword_msg",newPassword_msg,request,response);
        }else {
            if (newPassword.equals(confirmPassword)) {
                // 证明可以注册
                //验证码不区分大小写
                if (code.equalsIgnoreCase(inputCode)) {
                    //验证码输入正确
                    boolean isReset = userServices.reset(id, newPassword, identity);
                    if (isReset) {
                        // 密码修改成功
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().print("<h1>密码修改成功成功，3秒之后自动回到登录页面</h1>");
                        response.setHeader("refresh", "3;url=/user/admin.jsp");
                    } else {
                        // 修改失败
                        String register_msg = "出错了，请稍后重试 ";
                        errorResponse(identity, "msg", register_msg, request, response);
                    }

                } else {
                    // 验证码输入有误
                    String inputcode_msg = "验证码输入有误 ";

                    errorResponse(identity, "inputcode_msg", inputcode_msg, request, response);
                }
            } else {
                // 友好提示
                // 能进入到这里，证明 两次密码不一致
                String password_error_msg = "两次密码不一致 ";
                errorResponse(identity, "password_error_msg", password_error_msg, request, response);
            }
        }


    }
}
