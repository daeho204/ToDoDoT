package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

/**
 * Servlet implementation class JoinController
 */
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String bnum;
		String isbusiness;
		
		// 가게등록 체크 안하면
		if (request.getParameter("isbusiness") == null) {
			isbusiness = "0"; // 가게등록여부 => 0
			bnum = "";
			System.out.println("가게등록여부 : " + isbusiness);
			System.out.println("사업자번호" + bnum);
		} else { // 가게등록 체크하면
			isbusiness = "1"; 
			bnum = request.getParameter("bnum");
		}
		
		// 내가 정의한 Member 객체로 가져온다.
		// Member객체는 회원 정보(id,pw,name,address,phone,email)를 저장한다
		Member member = new Member(id, pw, name, address, phone, email, isbusiness, bnum);
		System.out.println("멤버 객체 : " + member);
		MemberDAO dao = new MemberDAO();
		int res = dao.join(member);
		// MemberDAO객체는 join메소드로 Member객체를 받는다
		// Member객체의 회원정보를 통해 결과를 반환한다
		
		System.out.println("결과 : " + res);
		
		// 새로 만든 회원의 이름을 JoinSuccess.jsp로 보내기 위해 만듦
		request.setAttribute("name", name);
		System.out.println("가져올 이름 : " + name);

		if (res > 0) {
			ServletContext context = getServletContext();
			// 포워딩하기
			RequestDispatcher rd = request.getRequestDispatcher("JoinSuccess.jsp");
//			response.sendRedirect("joinSuccess.jsp?id="+id); // 쿼리스트링 방식. 간편하지만 아이디가 주소창에 노출된다
			rd.forward(request, response);

		} else {
			response.sendRedirect("LoginJoinForm.jsp");
		}
	}

}
