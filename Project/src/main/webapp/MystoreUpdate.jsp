<%@page import="com.smhrd.model.Store"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.StoreDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.MenuDAO"%>
<%@page import="com.smhrd.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="dist/sakura.min.css">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<%
Member member = (Member) session.getAttribute("member");
String user_bnum = member.getBnum();
session.setAttribute("user_bnum", user_bnum);
System.out.print(user_bnum);


System.out.print("bnum은" + member.getBnum());

/* HttpSession httpSession = request.getSession();
String user_bnum = member.getBnum(); // 실제로는 세션에 저장될 사용자의 bnum 값
session.setAttribute("user_bnum", user_bnum);
System.out.print(user_bnum); */ 


StoreDAO dao = new StoreDAO();
Store store = dao.storeOwnContent(user_bnum);
pageContext.setAttribute("store", store);
String store_id = store.getStore_id();
session.setAttribute("store_id",store_id);


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
									<a href="index.html"><img src="images/logo.png" alt="#" /></a>
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
									<li class="nav-item "><a class="nav-link" href="index.jsp">Home</a></li>
									<li class="nav-item"><a class="nav-link" href="about.jsp">MyPage</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="MyStore.jsp">MyStore</a></li>
									<li class="nav-item"><a class="nav-link"
										href="getStore.jsp">StoreList</a></li>
									<li class="nav-item"><a class="nav-link"
										href="pricing.html">Pricing</a></li>
									<li class="nav-item"><a class="nav-link"
										href="contact.html">Contact Us</a></li>
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
										<%
										if (member == null) {
										%>
										<%
										} else {
										%>
										<a>==마이페이지==</a> <a href="#home">회원정보수정</a> <a href="#about">예약확인</a>
										<a href="#contact">찜목록 확인</a> <a>==마이스토어==</a> <a href="#add">가게등록</a>
										<a href="#add">가게정보 수정</a> <a href="#add">예약 확인/수락</a> <a
											href="#add">일정 확인</a>
										<%
										}
										%>
									</div>
								</div>
							</li>
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
						<h2 style="color: black;">마이스토어</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 가게등록시작 -->
	<form action="StoreJoinController" method="post"
		enctype="multipart/form-data">
		<div class="memInfoEdit">
			<div style="width: 35%">
				<h2 class="memInfoEditTitle">가게 정보 수정하기</h2>
				<table class="memInfoTable" style="width: 100%;">
					<tr class="memInfoTableTr" style="width: 100%">
						<td class="storeInfoTableTd1" style="width: 35%">업체명 :</td>
						<td class="storeInfoTableTd2" style="width: 65%"><input
							class="storeInfoInput" type="text" name="store_name"
							placeholder="<%=store.getStore_name()%>"></td>
					<tr class="memInfoTableTr" style="width: 100%">
						<td class="storeInfoTableTd1" style="width: 35%">업체 주소 :</td>
						<td class="storeInfoTableTd2" style="width: 65%"><input
							class="storeInfoInput" type="text" name="store_address"
							placeholder="<%=store.getStore_address()%>"></td>
					<tr class="memInfoTableTr" style="width: 100%">
						<td class="storeInfoTableTd1" style="width: 35%">연락처 :</td>
						<td class="storeInfoTableTd2" style="width: 65%"><input
							class="storeInfoInput" type="text" name="store_contact"
							placeholder="<%=store.getStore_contact()%>"></td>
					<tr class="memInfoTableTr" style="width: 100%">
						<td class="storeInfoTableTd1" style="width: 35%">홍보문구 :</td>
						<td class="storeInfoTableTd2" style="width: 65%"><input
							class="storeInfoInput" type="text" name="store_descript"
							placeholder="<%=store.getStore_descript()%>"></td>
					</tr>
					<tr class="memInfoTableTr" style="width: 100%">
						<td class="storeInfoTableTd1" style="width: 35%">이미지 :</td>
						<td class="storeInfoTableTd2" style="width: 65%"><input
							type="file" class="storeInfoTableTd2" id="photo"
							name="store_img">
					</tr>
				</table>
				<div class="memInfoBtn">
					<button type="submit" class="memInfoUpdateBtn">수정하기</button>
				</div>
			</div>
		</div>
	</form>
	<!-- 가게등록 끝 -->
	<!-- 메뉴등록시작 -->

	<form action="StoreMenuController" method="post"
		enctype="multipart/form-data" id="menuForm">
		<div class="memInfoEdit">
			<div style="width: 35%">
				<h2 class="memInfoEditTitle">메뉴 등록</h2>
				<div id="menuContainer">
					<table class="memInfoTable" style="width: 100%;">
						<tr class="memInfoTableTr" style="width: 100%">
							<td class="storeInfoTableTd1" style="width: 35%">메뉴 이름 :</td>
							<td class="storeInfoTableTd2" style="width: 65%"><input
								class="storeInfoInput" type="text" name="menu_name"
								placeholder="메뉴 이름 등록"></td>
						</tr>
						<tr class="memInfoTableTr" style="width: 100%">
							<td class="storeInfoTableTd1" style="width: 35%">메뉴 설명 :</td>
							<td class="storeInfoTableTd2" style="width: 65%"><input
								class="storeInfoInput" type="text" name="menu_descript"
								placeholder="메뉴 설명 등록"></td>
						</tr>
						<tr class="memInfoTableTr" style="width: 100%">
							<td class="storeInfoTableTd1" style="width: 35%">메뉴 가격 :</td>
							<td class="storeInfoTableTd2" style="width: 65%"><input
								class="storeInfoInput" type="text" name="menu_price"
								placeholder="메뉴 가격 등록"></td>
						</tr>
						<tr class="memInfoTableTr" style="width: 100%">
							<td class="storeInfoTableTd1" style="width: 35%">메뉴 이미지 :</td>
							<td class="storeInfoTableTd2" style="width: 65%"><input
								type="file" class="storeInfoTableTd2" id="photo"
								name="menu_img"></td>
						</tr>
					</table>
				</div>
				<div class="memInfoBtn">
						<button type="submit" class="memInfoUpdateBtn addMenuBtn">
						저장하기</button>
				</div>
			</div>
		</div>
	</form>
	<!-- 메뉴등록 끝 -->
	<br><br>
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




