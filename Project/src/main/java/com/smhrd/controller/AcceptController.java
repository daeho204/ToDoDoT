package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ReservationAndUserAndStore;
import com.smhrd.model.ReservationDAO;


public class AcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String user_id = request.getParameter("user_id");
        System.out.println(user_id);
        
        ReservationAndUserAndStore reservation = new ReservationAndUserAndStore(user_id);
	    ReservationDAO dao = new ReservationDAO();
	    int res = dao.accept(user_id);
	    System.out.println(res);
	   
	    if(res > 0) {
	    	System.out.println("예약성공");
	    	HttpSession session = request.getSession();
	    	session.setAttribute("reservation", reservation);
	    	response.sendRedirect("Mystore.jsp");
	    }
	}

}
