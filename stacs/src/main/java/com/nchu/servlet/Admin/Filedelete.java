package com.nchu.servlet.Admin;

import com.nchu.entity.File;
import com.nchu.services.FileServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/filedelete")
public class Filedelete extends HttpServlet {

    FileServices fs = new FileServices();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int fileNo =Integer.parseInt(request.getParameter("id"));
        String fileName = fs.loadByFileNo(fileNo);
        boolean isDelete = fs.deleteFile(fileNo);
        if (isDelete){
            java.io.File iof = new java.io.File("/D:\\大学学习代码\\Java暑期实训\\合作\\最终版本\\final\\stacs18十八号下午完整版1.0版本\\stacs\\src\\main\\webapp\\uploadfiles/"+fileName);
            System.out.println(iof);
            //删除文件
            iof.delete();

            List<File> lf = fs.loadAllFileName();
            request.getSession().setAttribute("fileList",lf);
            response.sendRedirect("/user/uploading.jsp");
        }else {
            String msg = "删除失败";
            request.getSession().setAttribute("deletefail_msg",msg);
            response.sendRedirect("/user/uploading.jsp");
        }

    }
}
