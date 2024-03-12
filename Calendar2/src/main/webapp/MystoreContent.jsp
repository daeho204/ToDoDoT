<%@page import="com.smhrd.model.Menu"%>
<%@page import="com.smhrd.model.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	/* int idx = Integer.parseInt(request.getParameter("idx"));  */
	int idx=2;
	MenuDAO dao = new MenuDAO();
	Menu menu = dao.mystoreContentMenu(idx);
	pageContext.setAttribute("Menu",menu);
%>

<table class="table table-bordered">
<tr>
    			<td>Menu_id</td>
    			<td><%= menu.getMenu_id()%></td>
    		</tr>
    		<tr>
    			<td>menu_name</td>
    			<td><%= menu.getMenu_name()%></td>
    		</tr>
    		<tr>
    			<td>menu_descript</td>
    			<td><%= menu.getMenu_descript()%></td>
    		</tr>
    		<tr>
    			<td>menu_price</td>
    			<td><%= menu.getMenu_price()%></td>
    		</tr>
    		<tr>
    			<td>menu_img</td>
    			<td><img src="data:image/jpg;base64,<%= menu.getMenu_img()%>"></td>
    		</tr>
    	</table>

<%-- <img src="data:image/jpg;base64,<%= menu.getMenu_img()%>"> --%>

</body>
</html>