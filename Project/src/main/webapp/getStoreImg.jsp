<%@page import="com.smhrd.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Store"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%	
	Member member = (Member)session.getAttribute("member");
	String store_id = request.getParameter("store_id");
	StoreDAO dao = new StoreDAO();
	Store store = dao.storeContent(store_id);
	
	
	pageContext.setAttribute("store", store);
	System.out.print(store_id);
	System.out.print(store.getStore_img());
	
	
	
%>
	<%-- <%
    // store_address와 store.store_address가 같을 때만 해당 부분을 출력
    if (store_address != null && store_address.equals(store.getStore_address())) {
	%> --%>

	<div>
		<table width=500px height=150px border=2px solid black>

			<tr>
				<td>가게이름 : ${store.store_name}</td>
				<td>이미지 : <img src="data:image/jpg;base64, ${store.store_img}"
					width="250px" , height="150px">
				</td>
			</tr>
			<tr>
				<td>가게설명:</td>
				<td>메뉴:</td>
			</tr>

		</table>
	</div>
	<%-- <% }; %> --%>

</body>
</html>