package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		
	MemberDAO dao = new MemberDAO();
	Member result = dao.idCheck(id);
	PrintWriter out = response.getWriter();
	if(result != null) { //사용할 수 없는 아이디 (NN)
		out.print("NN");
	}else { 		//사용할 수 있는 아이디 (YY)
		out.print("YY");
	}
	}

}
