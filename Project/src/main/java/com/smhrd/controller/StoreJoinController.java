package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Member;
import com.smhrd.model.Store;
import com.smhrd.model.StoreDAO;

public class StoreJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String savePath = request.getServletContext().getRealPath("/images");
		int sizeLimit = 5 * 1024 * 1024; // 5MB 제한

		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());

		HttpSession session = request.getSession();
		String user_bnum = (String) session.getAttribute("user_bnum");
		System.out.println("사업자번호"+user_bnum);
		String store_name = multi.getParameter("store_name");
		String store_address = multi.getParameter("store_address");
		String store_contact = multi.getParameter("store_contact");
		String store_descript = multi.getParameter("store_descript");
		String store_img = multi.getOriginalFileName("store_img");
		
		
		// String store_descript = multi.getParameter("store_descript");

		Store store = new Store(user_bnum, store_name, store_address, store_contact, store_descript, store_img);
		StoreDAO dao = new StoreDAO();
		int res = dao.storejoin(store);

		System.out.println(store);
		System.out.println(res);

		if (res > 0) {
		
			response.sendRedirect("Mystore.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}

	}

}