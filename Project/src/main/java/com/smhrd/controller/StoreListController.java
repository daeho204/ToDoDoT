package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Store;
import com.smhrd.model.StoreDAO;

public class StoreListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		
		System.out.println(name);
		System.out.println(address);
		Store store = new Store(name, address);
		StoreDAO dao = new StoreDAO();
		Store result = dao.SearchList(store);
		
		if (result != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("store", result); 
			response.sendRedirect("getSearchResult.jsp");
		} else {
			System.out.println("결과없음");
		}
		
	}

}
