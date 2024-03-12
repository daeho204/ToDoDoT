<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <form action="StoreJoinController" method="post" enctype="multipart/form-data">
      <!-- <input type="text" name = "user_bnum" placeholder="사업자번호를 입력하세요" > -->
      <input type="text" name="store_name" placeholder="가게이름을 입력하세요">
      <input type="text" name="store_address" placeholder="가게주소를 입력하세요">
      <input type="text" name="store_contact" placeholder="가게전화번호를 입력하세요">
      <input type="file" name="store_img" placeholder="가게 이미지를 선택하세요">
      
      <input type="submit" value="JoinUs" class="button fit">
   </form>
   
   
</body>
</html>