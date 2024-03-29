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
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>milina</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	StoreDAO dao = new StoreDAO();
	List<Store> list = dao.StoreList();

	pageContext.setAttribute("list", list);
	%>

	<div>
		<form action="getStoreList.jsp" method="post">
			<input type="text" placeholder="지역을 입력해주세요" name="store_address">
			<!-- 다른 필요한 입력 필드들을 추가할 수 있습니다 -->
			<input type="submit" value="search">
		</form>
	</div>
	<div>
		<table width=500px height=150px border=2px solid black>
			<c:forEach items="${list}" var="b" varStatus="status">
				<tr>
					<td><a href="getStoreImg.jsp?store_id=${b.store_id}">가게선택</a></td>
					<td>STORE_ID : ${b.store_id}</td>
					<td>STORE_NAME : ${b.store_name}</td>
					<td>STORE_ADD : ${b.store_address}</td>
					<td>STORE_CONT : ${b.store_contact}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>