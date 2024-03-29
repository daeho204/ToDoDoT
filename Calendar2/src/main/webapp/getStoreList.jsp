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
	request.setCharacterEncoding("UTF-8");
	String store_address = request.getParameter("store_address");
	StoreDAO dao = new StoreDAO();
	List<Store> list = dao.StoreList();
	
	pageContext.setAttribute("store_address", store_address);
	pageContext.setAttribute("list", list);
	System.out.print(store_address);
	%>
		<table width=500px height=150px border=2px solid black>
			<c:forEach items="${list}" var="b" varStatus="status">
				<c:if test="${store_address eq b.store_address}" >
				<tr>
					<td><a href="getStoreImg.jsp?store_id=${b.store_id}">가게선택</a></td>
					<td>STORE_ID : ${b.store_id}</td>
					<td>STORE_NAME : ${b.store_name}</td>
					<td>STORE_ADD : ${b.store_address}</td>
					<td>STORE_CONT : ${b.store_contact}</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>