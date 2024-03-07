<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BoardDAO"%>
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
	BoardDAO dao = new BoardDAO();
	List<Board> list = dao.boardList();
	/* 자바의 변수 list는 jstl의 el을 사용할 수 없다 
	그래서 페이지 영역에 담아서 el기법으로 표시하기위해 pageContext사용 ("key", "value")
	47번
	*/
	pageContext.setAttribute("list", list);
	System.out.print(list.size());
%>
<div class="container">
  <h2>빅데이터반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body" id="list">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		        <th>삭제</th>
		      </tr>
		    </thead>
		    <tbody>
			<!-- 게시물 출력 -->
			<c:forEach items="${list}" var="b" varStatus = "status"> 
			<tr>
				<td>${status.count}</td>		
				<td><a href ="boardcontent.jsp?idx=${b.idx}">${b.title}</a></td>		
				<td>${b.writer}</td>		
				<td>${b.indate}</td>		
			</tr>
			</c:forEach>
		      <tr>
		      	<td colspan="4">
		      		<button onclick="location.href='boardform.jsp'" class="btn btn-sm btn-success">글작성</button>
		      		<button onclick="chat()" class="btn btn-sm btn-success">채팅하기</button>
		      	</td>
		      </tr>
		    </tbody>
		  </table>
    
    </div>
    <div class="panel-footer">빅데이터 분석서비스 개발자 과정 (담임 : 주미리)</div>
  </div>
</div>
<script>
	function chat(){
		// 함수 호출 시 채팅창 띄우기 (사이즈 지정) 새창에 띄워줄 리소스 / 창이름 / 크기 (가로,세로)
		window.open("<%= request.getContextPath()%>/chat2.jsp", "채팅하기", "width = 650, height = 800");
	}
</script>
</body>
</html>







