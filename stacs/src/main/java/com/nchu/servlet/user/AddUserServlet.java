package com.nchu.servlet.user;

import com.nchu.entity.Student;
import com.nchu.entity.Teacher;
import com.nchu.services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/adduser")
public class AddUserServlet extends HttpServlet {

    // 针对于 User 进行提供服务的类
    UserServices userServices = new UserServices() ;
    private boolean isAdd = false;
    private Student student = null;
    private Teacher teacher = null;
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取新用户的信息
        String identity = request.getParameter("identity");
        if(identity.equals("学生")){
            String  Smail  = request.getParameter("Smail");
            String  SidentityNo = request.getParameter("SidentityNo");
            String  Stele = request.getParameter("Stele");
            String  Sdorm  = request.getParameter("Sdorm");
            String  Sdept   = request.getParameter("Sdept");
            String  Sidentity  = request.getParameter("Sidentity");
            String  Sbirth  = request.getParameter("Sbirth");
            student = new Student();
            student.setSmail(Smail);
            student.setSidentityNo(SidentityNo);
            student.setStele(Stele);
            student.setSdorm(Sdorm);
            student.setSdept(Sdept);
            student.setSidentity(Sidentity);
            student.setSbirth(Sbirth);

        }else{
            teacher = new Teacher();
            String  Tphone  = request.getParameter("Tphone");
            String  Temail = request.getParameter("Temail");

            teacher.setTphone(Tphone);
            teacher.setTemail(Temail);
        }



        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");


        if( id.trim().length()==8){
            //进来了,说明学号满足长度为8位
            // 检验用户名是否唯一
            boolean isUnique = userServices.isUnique(id,identity);
            if( isUnique ){
                // 能进入到这里，应该是可以进行注册的（ 用户编号是没有问题的）
                // 证明可以添加该用户
                if(identity.equals("学生")){

                    isAdd = userServices.addStudent(student,id, password, username, gender,identity );
                }else{
                     isAdd = userServices.addTeacher(teacher,id, password, username, gender,identity );
                }
                if (isAdd) {
                    // 添加成功
                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().print("<h1>添加新用户成功成功，2秒之后自动回到登录页面</h1>");
                    response.setHeader("refresh", "2;url=/user/admin.jsp");
                } else {
                    //添加失败
                    String msg = "出错了，请稍后重试 ";
                    request.setAttribute("internet_msg", msg);
                    request.getRequestDispatcher("/user/adduser.jsp").forward(request, response);
                }
            }else{
                //用户不唯一
                String msg = "该用户已存在 ";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/user/adduser.jsp").forward(request, response);
            }
        }else{
            //学号长度不为8位
            String msg = "对不起，用户名不满足统一格式——————长度8位数字 ";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/user/adduser.jsp").forward(request, response);
        }



    }
}
