package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

/**
 * Servlet implementation class IdCheckController
 */
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		Member result = dao.idCheck(id);
		
		PrintWriter out = response.getWriter();
		
		if(result!=null) { // 중복된 아이디 발견
			out.print("NN"); // 브라우저 console창 출력
		}else { // 사용 가능한 아이디
			out.print("YY");
		}
	}

}
