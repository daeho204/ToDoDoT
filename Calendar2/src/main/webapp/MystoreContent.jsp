<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
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
	MenuDAO dao = new MenuDAO();
	Menu menu = dao.mystoreContentMenu(menu.getMenu_id());
	pageContext.setAttribute("Menu",menu);
	
	List<Menu> list = dao.StoreList();
	pageContext.setAttribute("list", list);
%>
<form action="reserv.jsp">
	<div id="tab-2" class="tab-content">
		<table style="width: 100%">
			<%
			for (int i = 0; i < list.size(); i++) {
				idx=i;
			
			%>
			<tr style="width: 100%">
				<td class="menuTd" style="width: 30%"><img
					src="data:image/jpg;base64,<%=menu.getMenu_img()%>"
					width="250px" ></td>
				<td class="menuTd" style="width: 60%"><%=list.get(i).getMenu_name()%><br><%=list.get(i).getMenu_price()%></td>

				<td class="menuTd" style="width: 9%"><input type="checkbox"></td>
			</tr>
			<%};%>
		</table>
		<div class="menuReservation">
			<button class="reserveBtn" type="submit">예약하기</button>
		</div>
	</div>
	</form>
	

<%-- <img src="data:image/jpg;base64,<%= menu.getMenu_img()%>"> --%>

</body>
</html>