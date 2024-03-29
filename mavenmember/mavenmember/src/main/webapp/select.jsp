<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<%
	MemberDAO dao = new MemberDAO();
	List<Member> list = dao.selectAll();
	System.out.print(list.size());
%>
<body style="text-align: center;">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
		<nav id="Update">
		<table>
			<caption>
				<h2>회원관리페이지</h2>
			</caption>
			<tr>
				<td>Email</td>
				<td>Tel</td>
				<td>Address</td>
			</tr>
			<% for(Member m:list){ %>
				<tr>
				<td>회원 아이디 <%=m.getId() %></td>
				<td>회원 전화번호 <%=m.getTel() %></td>
				<td>회원 주소 <%=m.getAddress() %></td>
				<td><a href = "DeleteController?id=<%=m.getId()%>">삭제</a></td>
				<!-- queryString(?)을 사용해서 id가 지정한 아이디면 삭제, 공백 절대불가 -->
				</tr>
			<%}%>
			
			
			<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
		</table>
		</nav>
		<a href="main.jsp" class="button next scrolly">되돌아가기</a>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>

