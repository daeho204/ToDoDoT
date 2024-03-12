<%@page import="com.smhrd.model.Menu"%>
<%@page import="com.smhrd.model.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="StoreMenuController" method="post" enctype="multipart/form-data"> 
		<!-- <input type="text" name = "user_bnum" placeholder="사업자번호를 입력하세요" > -->
		<!-- <input type="text" name="menu_id" placeholder="메뉴id을 입력하세요"> -->
		<input type="text" name="menu_name" placeholder="메뉴이름을 입력하세요">
		<input type="text" name="menu_descript" placeholder="메뉴 설명을 입력하세요">
		<input type="text" name="menu_price" placeholder="가격을 입력하세요">
		<input type="file" name="menu_img"  id="photo">
		<input type="submit" value="menu" class="button fit">
	</form>
	
	
    			
    			
    		

</body>
</html>