package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Menu;
import com.smhrd.model.MenuDAO;

public class StoreMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String savePath=request.getServletContext().getRealPath("/images");
		System.out.println(savePath);
		int sizeLimit= 5 * 1024 * 1024; //5매가 제한 넘어서면 예외발생
		
		MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		/* int menu_id = multi.get("idx"); */
		String menu_name = multi.getParameter("menu_name");
		String menu_descript = multi.getParameter("menu_descript");
		String menu_price = multi.getParameter("menu_price");
		String menu_img = multi.getOriginalFileName("menu_img");

		Menu menu = new Menu(menu_name, menu_descript, menu_price,menu_img);
		System.out.print(menu);
		
		MenuDAO dao = new MenuDAO();
		int res = dao.Menuadd(menu);
		
		System.out.println(res);
		
		
		if (res>0) {
			// 포워딩
//			response.sendRedirect("joinSuccess.jsp?id="+id);
			RequestDispatcher rd = request.getRequestDispatcher("Mystore.jsp");
					rd.forward(request, response);}
					
			else {
			response.sendRedirect("Mystore.jsp");
		}
		
	

	}

}
