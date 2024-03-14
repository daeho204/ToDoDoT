<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TodoDot - 로그인 알림</title>
    
    <!-- UpdateForm.css 적용 -->
    <!-- <link rel="stylesheet" href="UpdateForm.css"> -->
    
    <link rel="stylesheet" href="css/UpdateForm.css">
</head>

<body>
       <div id="container">
            <h3>입력하신 아이디, 비밀번호를 다시 확인해주세요.</h3>
			<h3>아이디 혹은 비밀번호가 일치하지 않거나</h3>
			<h3>존재하지 않는 회원정보일 수 있습니다</h3>
			<a href="LoginJoinForm.jsp">로그인 페이지로 돌아가기</a>
			<a href="index.jsp">홈화면으로 돌아가기</a>
       </div>
</body>

</html>