package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");

		Member member = new Member(id, pw, tel, address);

		// 위에서 생성한 MavenMember 객체를 DAO 호출하면서 파라미터로 넘겨줌 -> 테이블에 넣기위해

		MemberDAO dao = new MemberDAO();
		int res = dao.join(member);

		System.out.println(res);

		if (res > 0) {
//			response.sendRedirect("joinSuccess.jsp");
			// 포워딩
			RequestDispatcher rd = request.getRequestDispatcher("joinSuccess.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
