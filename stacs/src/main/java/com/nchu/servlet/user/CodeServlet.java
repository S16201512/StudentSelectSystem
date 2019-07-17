package com.nchu.servlet.user;

import com.nchu.utils.GraphicHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/code")
public class CodeServlet  extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession() ;
        OutputStream out = response.getOutputStream() ;
        String code = GraphicHelper.create( 4,  false , 100 , 60 ,  out , 10 ) ;
        session.setAttribute("code" , code );
    }
}
