package com.nchu.servlet.user;

import com.nchu.dao.UserDao;
import com.nchu.entity.*;
import com.nchu.services.CourseServices;
import com.nchu.services.FileServices;
import com.nchu.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
    UserServices userServices = new UserServices() ;
    UserDao userDao = new UserDao() ;
    CourseServices courseServices  =new CourseServices();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id") ;
        String password = request.getParameter("password") ;
        String identity = request.getParameter("identity");


        request.getSession().setAttribute("tno",id);

        if("".equals(id) || "".equals(password)){
            request.setAttribute("msg1" , "用户名或密码不能为空");
            request.getRequestDispatcher("/index.jsp").forward(request , response );
        }else{
            // 判断是否有这个用户
            boolean b = userServices.load( id , password , identity) ;
            if( b ){
                // 有这个用户，可以进行登录了，应该去一个页面
                User u = userDao.loadById( id , identity) ;
                request.getSession().setAttribute("user" , u);
                if(identity.equals("管理员")){
                    request.getRequestDispatcher("/user/admin.jsp").forward(request , response );
                } else{
                    if(identity.equals("教师")){

                        // 在这里应该获取到所有的 课程 信息
                        List<Course> list = courseServices.loadAll() ;
                        // 应该发送到页面去进行显示
                        request.getSession().setAttribute("courseList" , list );
                        // 转发到课程列表页面
                        response.sendRedirect("/user/teacher.jsp");
                    } else{
                        Student student=userServices.load(id);
                        request.getSession().setAttribute("student",student);
                        List<Select_class> courselist=courseServices.loadAll1();
                        request.getSession().setAttribute("Stu_id",id);
                        request.getSession().setAttribute("courseList",courselist);
                        request.getSession().setAttribute("Button1","7");
                        List<Select_class> courselist1=courseServices.loadAll(id);
                        request.getSession().setAttribute("courseList2",courselist1);
                        response.sendRedirect("/user/student.jsp");
                    }
                }
            }else{
                // 没有这个用户
                // 给一个提示
                request.setAttribute("msg" , "用户名或密码错误");
                request.getRequestDispatcher("/index.jsp").forward(request , response );
            }
        }

    }
}
