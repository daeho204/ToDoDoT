package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

/**
 * Servlet implementation class UpdateController
 */
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 세션 활용해 아이디 가져오기
//		HttpSession session = request.getSession();
//		Member loginMember = (Member)session.getAttribute("member");
//		String id = loginMember.getId();

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String isbusiness = request.getParameter("isbusiness");
		String bnum = request.getParameter("bnum");

		Member member = new Member(id, pw, name, address, phone, email, isbusiness, bnum);
		// 정보수정 입력칸 중 하나라도 비어있으면
		// 다시 확인해달라는 페이지로 이동함

		if (member.getId().equals("") || member.getName().equals("") || member.getPw().equals("") || member.getPhone().equals("")
				|| member.getAddress().equals("") || member.getEmail().equals("")) {
			response.sendRedirect("UpdateFail.jsp");
		}

		else {
			MemberDAO dao = new MemberDAO();
			int res = dao.update(member);
			System.out.println(res);
			if (res == 1) {
				HttpSession session = request.getSession();
				// 세션 값도 수정해야 웹페이지 출력값도 변경된다
				session.setAttribute("member", member);
				response.sendRedirect("about.jsp");
				System.out.println(member.getIsbusiness());
			} else {
				System.out.println("문제 발생");
				response.sendRedirect("UpdateFail.jsp");
			}
		}
	}

}
