package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;

public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String savePath = request.getServletContext().getRealPath("/upload");
		int sizeLimit = 5 * 1024 * 1024; // 5MB 제한

		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String img = multi.getOriginalFileName("img");
		
		
		Board board = new Board(title, content, writer, img);
		BoardDAO dao = new BoardDAO();
		int res = dao.insert(board);
		
		if (res > 0) {
			response.sendRedirect("boardlist.jsp");
		} else {
			response.sendRedirect("boardform.jsp");
		}
	}

}
