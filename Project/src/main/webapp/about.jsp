<%@page import="com.smhrd.model.ReservationAndUserAndStore"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReservationDAO"%>
<%@page import="com.smhrd.model.ReservationVO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="dist/sakura.min.css">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<title>Insert title here</title>
</head>
<%
	Member member = (Member)session.getAttribute("member");
	String user_id = member.getId();
	session.setAttribute("user_id", user_id);
	ReservationDAO dao = new ReservationDAO();
	//List<ReservationVO> list = dao.getReserve();
	List<ReservationAndUserAndStore> list = dao.getReserve();
	for(ReservationAndUserAndStore res : list){
		System.out.print(" store_name : " +res.getStore_name());
		System.out.print(" user_name : " +res.getUser_name());
		System.out.print(" menu : " +res.getMenu_name());
	};
	pageContext.setAttribute("list", list);
	
%>

<body class="main-layout">
	<!-- loader  -->
	<div class="loader_bg">
		<div class="loader">
			<img src="images/loading.gif" alt="#" />
		</div>
	</div>
	<!-- end loader -->
	<!-- header -->
	<header>
		<!-- header inner -->
		<div class="header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
						<div class="full">
							<div class="center-desk">
								<div class="logo">
									<a href="index.jsp"><img src="images/logo.png" alt="#" /></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-7 col-lg-7 col-md-9 col-sm-9">
						<nav class="navigation navbar navbar-expand-md navbar-dark ">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample04"
								aria-controls="navbarsExample04" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarsExample04">
								<ul class="navbar-nav mr-auto" style="margin-top: 5px">
									<li class="nav-item "><a class="nav-link"
										href="index.jsp">Home</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="about.html">MyPage</a></li>
										<li class="nav-item"><a class="nav-link"
										href="Mystore.jsp">MyStore</a></li>
									<li class="nav-item"><a class="nav-link" href="getStore.jsp">StoreList</a></li>
								</ul>
							</div>
						</nav>
					</div>
					<div class="col-md-2">
						<ul class="social_icon">
							<li>
								<% if(member==null){ %>
									<button class="loginBtn" onclick="location.href='LoginJoinForm.jsp'">로그인</button>
									<%} else{%>
									<form action="LogoutController">
										<button class="logoutBtn">로그아웃</button>
									</form>
									<%} %>
								<div class="dropdown"
									style="position: absolute; top: 10px; right: -50px;">
									<button onclick="myFunction()" class="dropbtn">메뉴</button>
									<div id="myDropdown" class="dropdown-content">
									<% if(member==null){ %>
									<%}else{ %>
										<a>==마이페이지==</a> <a href="#home">회원정보수정</a> <a href="#about">예약확인</a>
										<a href="#contact">찜목록 확인</a> <a>==마이스토어==</a> <a href="#add">가게등록</a>
										<a href="#add">가게정보 수정</a> <a href="#add">예약 확인/수락</a> <a
											href="#add">일정 확인</a>
									<%} %>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header inner -->
	<!-- end header -->
	<div class="back_re"
		style="background-image: linear-gradient(to right, mistyrose, white);">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="title">
						<h2 style="color: black;">마이페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원정보수정 시작 -->
	<div class="memInfoEdit">
		<div style="width: 40%">
			<h2 class="memInfoEditTitle">회원정보</h2>
			<table class="memInfoTable" style="width: 100%;">
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 29%">이름</td>
					<td class="memInfoTableTd" style="width: 69%">${member.name }</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 29%">주소</td>
					<td class="memInfoTableTd" style="width: 69%">${member.address}</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 29%">전화번호</td>
					<td class="memInfoTableTd" style="width: 69%">${member.phone}</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 29%">이메일</td>
					<td class="memInfoTableTd" style="width: 69%">${member.email}</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 29%">사업자인가요?</td>
					<td class="memInfoTableTd" style="width: 69%">
						<%
						String isbusiness = member.getIsbusiness();
						if(isbusiness.equals("0")) {%>
						아니요
						<%}else{ %>
						예
						<%} %>
					</td>
				</tr>
			</table>
			<div class="memInfoBtn">
				<a href="UpdateForm.jsp">
					<button class="memInfoUpdateBtn">
						회원정보 수정
					</button>
				</a>
			</div>
		</div>
	</div>
	<!-- 회원정보수정 끝 -->
	<!-- 예약확인 시작 -->
	<div class="memInfoEdit">
	<!-- 만약에 예약이 거절되었다면 "어떤 값"을 반환받고 그 값에 따라 예약정보를 보일지, 예약취소 메시지를 띄울지 조건문 
	쓰면 될듯합니다 -->
		<div style="width: 50%">
			 <% for(ReservationVO res:list) { %>
			<h2 class="memInfoEditTitle">예약 확인</h2>
			<table class="memInfoTable" style="width: 100%;">
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">업체명</td>
					<td class="memInfoTableTd" style="width: 49%"><%= res.getStore_name() %></td>
					<td class="reserveImg" rowspan="6" style="width: 35%"><img style="width:200px" src="images/nailart1.jpeg"></td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">날짜</td>
					<td class="memInfoTableTd" style="width: 39%">2024/03/08/15:30</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">메뉴</td>
					<td class="memInfoTableTd" style="width: 39%"><%= res.getMenu_name() %></td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">가격</td>
					<td class="memInfoTableTd" style="width: 39%">90,000원</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">업체 주소</td>
					<td class="memInfoTableTd" style="width: 39%">서울시 서초구 동작대로 132
						안석빌딩 9층</td>
				</tr>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">업체 연락처</td>
					<td class="memInfoTableTd" style="width: 39%">01086328420</td>
				</tr>
			</table>
			
			<div class="memInfoBtn">
				<button class="memInfoUpdateBtn" onclick="chat()">채팅하기</button>
				<button class="memInfoUpdateBtn" onclick="">취소하기</button>
			</div>
			<% } %>
		</div>
	</div>
	<!-- 예약확인 끝 -->
	<!-- 찜목록 시작 -->
	<div class="memInfoEdit">
		<div style="width: 50%">
			<h2 class="memInfoEditTitle">찜목록</h2>
			<table class="memInfoTable" style="width: 100%;">
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="favoriteImg" rowspan="8" style="width:30%"><img style="width:200px" src="images/nailartshop1.jpg"></td>
					<td class="memInfoTableTd" style="width: 15%">업체명</td>
					<td class="memInfoTableTd" style="width: 39%">Olive Nail</td>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">영업시간</td>
					<td class="memInfoTableTd" style="width: 39%">10:00~18:00</td>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">업체주소</td>
					<td class="memInfoTableTd" style="width: 39%">서울시 서초구 동작대로 132
						안석빌딩 9층</td>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">연락처</td>
					<td class="memInfoTableTd" style="width: 39%">01086328420</td>
				</tr>
			</table>
			<table class="memInfoTable" style="width: 100%;">
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="favoriteImg" rowspan="8" style="width:30%"><img style="width:200px" src="images/nailartshop2.jpg"></td>
					<td class="memInfoTableTd" style="width: 15%">업체명</td>
					<td class="memInfoTableTd" style="width: 39%">뷰티플네일</td>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">영업시간</td>
					<td class="memInfoTableTd" style="width: 39%">10:00~18:00</td>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">업체주소</td>
					<td class="memInfoTableTd" style="width: 39%">서울시 서초구 동작대로 132
						안석빌딩 9층</td>
				<tr class="memInfoTableTr" style="width: 100%">
					<td class="memInfoTableTd" style="width: 15%">연락처</td>
					<td class="memInfoTableTd" style="width: 39%">01086328420</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 찜목록 끝 -->
	<div class="endImg">
		<img src="images/slin.png">
	</div>
	<!--  footer -->
	<footer>
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="conta">
							<li><i class="fa fa-map-marker" aria-hidden="true"></i> 서울시
								서초구 동작대로 132 안석빌딩 9층</li>
							<li><i class="fa fa-phone" aria-hidden="true"></i> 전화번호 :
								1522-7800</li>
							<li><i class="fa fa-envelope" aria-hidden="true"></i><a
								href="#"> smhrd@smhrd.or.kr</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->
	<!-- Javascript files-->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="dist/sakura.min.js"></script>
	<script src="js/Functions.js"></script>
	<!-- <script>
		var sakura = new Sakura('body', {
			colors : [ {
				gradientColorStart : 'hotpink',
				gradientColorEnd : 'pink',
				gradientColorDegree : 120,
			}, {
				gradientColorStart : 'hotpink',
				gradientColorEnd : 'pink',
				gradientColorDegree : 120,
			}, {
				gradientColorStart : 'hotpink',
				gradientColorEnd : 'pink',
				gradientColorDegree : 120,
			}, ],
			maxSize : 30,
			minSize : 20,
		});
	</script> -->
</body>
</html>