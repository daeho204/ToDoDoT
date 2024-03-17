package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Review;
public class AddReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String reserv_no = request.getParameter("reserv_no");
		int review_star = Integer.parseInt(request.getParameter("review_star"));
		String review_content = request.getParameter("review_content");
		
		Review review = new Review(review_star, review_content);
		
		com.smhrd.model.ReviewDAO dao = new com.smhrd.model.ReviewDAO();
		int res = dao.addReview(review);
		
		System.out.println(res);
		
		if (res>0) {
			response.sendRedirect("storeInfo.jsp");}
			else {
			response.sendRedirect("storeInfo.jsp");
		}
	}

}
