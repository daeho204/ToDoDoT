<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/JoinSuccess.css">

</head>
<body>
	<% String name = (String)request.getAttribute("name"); %>
        <div id="container">
            <h2 class="text">환영합니다!</h2>
            <h3 class="text"><%=name %>님</h3>
            <a href="LoginJoinForm.jsp"><button class="form_btn btnLoginJoin text">로그인하기</button></a>
        </div>
</body>
</html>