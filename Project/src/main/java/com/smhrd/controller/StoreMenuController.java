package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Menu;
import com.smhrd.model.MenuDAO;

public class StoreMenuController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String savePath = request.getServletContext().getRealPath("/images");
        System.out.println(savePath);
        int sizeLimit = 5 * 1024 * 1024; // 5MB 제한
        MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
                new DefaultFileRenamePolicy());
        
        HttpSession session = request.getSession();
		String store_id = (String) session.getAttribute("store_id");
		System.out.println("store_id: "+store_id);
        String menu_name = multi.getParameter("menu_name");
        String menu_descript = multi.getParameter("menu_descript");
        String menu_priceStr = multi.getParameter("menu_price");
        int menu_price = Integer.parseInt(menu_priceStr);
        String menu_img = multi.getOriginalFileName("menu_img");

        Menu menu = new Menu(store_id ,menu_name, menu_descript, menu_price, menu_img);
        System.out.println(menu);

        // DAO 클래스의 인스턴스 생성
        MenuDAO dao = new MenuDAO();
        
        // 메뉴 추가 메서드 호출
        int res = dao.addMenu(menu);
        
        System.out.println(res);
        
        if (res > 0) {
			// 포워딩하기
			RequestDispatcher rd = request.getRequestDispatcher("MystoreUpdate.jsp");
//			response.sendRedirect("joinSuccess.jsp?id="+id); // 쿼리스트링 방식. 간편하지만 아이디가 주소창에 노출된다
			rd.forward(request, response);

		} else {
			response.sendRedirect("Mystore.jsp");
		}
    }
}