package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>AcceptController</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>AcceptController</h1>");
        out.println("</body>");
        out.println("</html>");
        
        request.setCharacterEncoding("UTF-8");
        String user_name = request.getParameter("user_name");
        System.out.println(user_name);
	}

}
