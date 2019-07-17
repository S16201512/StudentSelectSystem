package com.nchu.servlet.Admin;

import com.nchu.entity.File;
import com.nchu.services.FileServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/fileupload")
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FileServices fs = new FileServices();
        List<File> fl = fs.loadAllFileName();
        if(fl==null){
            String msg = "还未上传文件！";
            request.getSession().setAttribute("upload_failmsg",msg);
            response.sendRedirect("/user/uploading.jsp");

        }
        request.getSession().setAttribute("fileList",fl);
        response.sendRedirect("/user/uploading.jsp");

    }
}
