package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ReservationDAO;
import com.smhrd.model.ReservationVO;

public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 체크박스의 값을 배열로 받기
		String user_id = request.getParameter("user_id");
		String store_id = request.getParameter("store_id");
		String selectedMenu = request.getParameter("selectedMenu");
//	    String[] selectedMenus = request.getParameterValues("menu");
	    System.out.println("user_id : " + user_id);
	    System.out.println("store_id : " + store_id);
	    System.out.println("selected_menu : " + selectedMenu);
	    // 선택된 메뉴들 출력
//	    if (selectedMenus != null) {
//	        for (String menu : selectedMenus) {
//	            System.out.println("선택한 메뉴: " + menu);
//	        }
//	    } else {
//	        System.out.println("선택된 메뉴가 없습니다.");
//	    }
	
	    ReservationVO reservation = new ReservationVO(user_id, store_id, selectedMenu);
	    ReservationDAO dao = new ReservationDAO();
	    int res = dao.reserve(reservation);
	    System.out.println(res);
	   
	    if(res > 0) {
	    	System.out.println("예약성공");
	    	HttpSession session = request.getSession();
	    	session.setAttribute("reservation", res);
	    	response.sendRedirect("about.jsp");
	    }
	}
}
	

