package com.nchu.servlet.user;

import com.nchu.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/subuser")
public class SubUserServlet extends HttpServlet {

    UserServices userServices = new UserServices() ;
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String identity = request.getParameter("identity");

        if( id.trim().length()==8){
            //进来了,说明学号满足长度为8位
            // 检验用户名是否存在
            boolean isUnique = userServices.isUnique(id,identity);
            if( !isUnique ){
                // 能进入到这里，应该是用户已经存在（ 用户编号是没有问题的）
                // 证明该用户可以被删除

                boolean isSub = userServices.subUser(id,identity );
                if (isSub) {
                    // 删除成功
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().print("<h1>删除用户成功，1秒之后自动回到登录页面</h1>");
                    response.setHeader("refresh", "1;url=/user/admin.jsp");
                } else {
                    //添加失败
                    String msg = "出错了，请稍后重试 ";
                    request.setAttribute("internet_msg", msg);
                    request.getRequestDispatcher("/user/subuser.jsp").forward(request, response);
                }
            }else{
                //用户不唯一
                String msg = "该用户不存在 ";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/user/subuser.jsp").forward(request, response);
            }
        }else{
            //学号长度不为8位
            String msg = "对不起，用户名不满足统一格式——————长度8位数字 ";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/user/subuser.jsp").forward(request, response);
        }


    }
}
