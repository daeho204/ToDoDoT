package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Store;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Member member = new Member(id, pw);
		MemberDAO dao = new MemberDAO();
		Member result = dao.login(member);
		System.out.println(result);
		if (result != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("member", result); // 서버에 세션 생성해 저장한다.
			// 세션은 서버에 있어서 클라이언트(웹사이트)에서 확인할 수 없다.
			//로그인 성공하면 isbusiness값 들고오기
			session.setAttribute("session", member.getIsbusiness());
			response.sendRedirect("index.jsp");
		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("LoginFail.jsp");
		}

	}
}
