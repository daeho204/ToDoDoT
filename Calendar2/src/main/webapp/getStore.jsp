<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Store"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	StoreDAO dao = new StoreDAO();
	List<Store> list = dao.StoreList();
	
	
	pageContext.setAttribute("list", list);
	System.out.print(list.size());
	
	
%>
	<div>
		<table width = 500px height = 150px border = 2px solid black>
		<c:forEach items="${list}" var="b" varStatus = "status"> 
			<tr>
				<td></td>
				<td>${b.store_name}</td>
				<td>${b.store_address}</td>
				<td>${b.store_contact}</td>
				
				
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>