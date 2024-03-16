package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.Member;
import com.smhrd.model.Store;
import com.smhrd.model.StoreDAO;

public class StoreListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		String area = request.getParameter("area");
		
		StoreDAO dao = new StoreDAO();
		
	}

}
