<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TodoDot-회원정보수정</title>
    
    <!-- UpdateForm.css 적용 -->
    <link rel="stylesheet" href="css/UpdateForm.css">
   
</head>

<body>
<%
	Member member = (Member)session.getAttribute("member");
%>

    <form action="UpdateController" method="post">
        <div id="container">
            <h2>회원정보수정</h2>
            <input type="hidden" name="id" value="${member.id }">
            <li>접속한 ID : ${sessionScope.member.id}</li>
            <input type="text" name="name" value="${member.name }" placeholder="이름 변경">
            <!-- <input type="password" placeholder="기존 비밀번호"> -->
            <input type="password" name="pw"  placeholder="새 비밀번호">
            <input type="text" name="phone" value="${member.phone}" placeholder="전화번호 변경">
            <input type="text" name="address" value="${member.address}" placeholder="주소 변경">
            <input type="email" name="email" value="${member.email}" placeholder="이메일 변경">
            <input type="checkbox" name="isbusiness">
            <input type="text" name="bnum" value="${member.bnum}">
            <p></p>
            <button class="form_btn btnLoginJoin">수정 완료</button>
        </div>
    </form>

</body>

</html>