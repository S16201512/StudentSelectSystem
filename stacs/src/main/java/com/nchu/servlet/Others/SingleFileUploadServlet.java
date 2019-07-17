package com.nchu.servlet.Others;
import com.nchu.entity.File;
import com.nchu.services.FileServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet( "/Other/singleFileUpload")
// 表示 对应的上传文件的配置
@MultipartConfig(location = "D:\\大学学习代码\\Java暑期实训\\合作\\最终版本\\final\\stacs18十八号下午完整版1.0版本\\stacs\\src\\main\\webapp\\uploadfiles")
public class SingleFileUploadServlet extends HttpServlet {
    /**
     * 如果是 get 方式请求的话，那么就可以认为是 不支持 上传文件
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    FileServices fileServices = new FileServices();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new RuntimeException("大傻逼 ， 不支持 get 方式上传文件") ;
    }

    /**
     * 如果是 post 方式请求的话，那么 认为 可以上传文件
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 如果支持上传 ，文件怎么上传 ？如果上传成功了，应该存在哪里 ？
        // 参数一定是 file 组件的名字
        Part p = request.getPart("file") ;
//        System.out.println( p.getName() ); // 得到的是  file 组件的名字
//        System.out.println(p.getSize() ); // 上传文件的大小
//        System.out.println( p.getSubmittedFileName() ); // 获取 到 文件 提交的名字
        // 将 上传的文件 写出到磁盘

         String fileName=p.getSubmittedFileName();
         if("".equals(fileName)){
             String msg = "上传文件为空！！！";
             request.getSession().setAttribute("fileName_msg",msg);
             response.sendRedirect("/user/uploading.jsp");

         }else {
             boolean isAdd = fileServices.addFile(fileName);
             if (isAdd == true){
                List<File> fileList =  fileServices.loadAllFileName();
                request.getSession().setAttribute("fileList",fileList);
                response.sendRedirect("/user/uploading.jsp");
             }
         }

        p.write( p.getSubmittedFileName() );
    }
}
