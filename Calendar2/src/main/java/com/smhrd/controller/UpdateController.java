package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
//		HttpSession session = request.getSession();
//		Member loginMember = (Member)session.getAttribute("member");
//		String id = loginMember.getId();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		System.out.println(id);

		Member member = new Member(id, pw, tel, address);

		MemberDAO dao = new MemberDAO();
		int res = dao.update(member);

		System.out.println(res);

		if (res > 0) {
//			response.sendRedirect("joinSuccess.jsp");
			// 포워딩
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
		
		if(res>0) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("update.jsp");
		}
	
	}

}
