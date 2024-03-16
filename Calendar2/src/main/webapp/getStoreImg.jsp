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
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>tododot</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="dist/sakura.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="storeInfo.css">
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
	
	String store_id = request.getParameter("store_id");
	StoreDAO dao = new StoreDAO();
	Store store = dao.storeContent(store_id);
	
	
	pageContext.setAttribute("store", store);
	System.out.print(store_id);
	System.out.print(store.getStore_img());
	
	pageContext.setAttribute("store_address", store_address);
	pageContext.setAttribute("store_name", store_name);
	pageContext.setAttribute("list", list);
	System.out.print(store_name);
	System.out.print(store_address);
	
	
	
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