<%@page import="com.smhrd.converter.ImageToBase64"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Store"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.smhrd.model.StoreDAO"%>
<%@page import="com.smhrd.model.Member"%>
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%
Member member = (Member) session.getAttribute("member");
%>
<body class="main-layout">

	<%
	StoreDAO dao = new StoreDAO();
	List<Store> list = dao.StoreList();

	pageContext.setAttribute("list", list);

	for (Store store : list) {
		//System.out.print("확인용 : " + (store.getStore_img() instanceof String));
		//dao.storeContent(store.getStore_img());
		/* System.out.print(" image path : " + store.getStore_img());
		File file = new File(
		"C:\\Users\\USER\\Desktop\\ToDoDoT\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\images\\" 
		 + store.getStore_img()); */
		System.out.print(" image path : " +store.getStore_img());
		File file = new File("C:\\Users\\ottki\\OneDrive\\바탕 화면\\빅데이터 23.12.14 - 24.06.10\\Projects\\2nd_Project\\ToDoDoT\\.metadata\\.plugins"
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\images\\"
				+ store.getStore_img());
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		System.out.println("파일의 값" + fileStringValue);

		store.setStore_img(fileStringValue);
	}
	%>

	<!-- loader  -->
	<div class="loader_bg">
		<div class="loader">
			<img src="images/loading.gif" alt="#" />
		</div>
	</div>

	<!-- end loader -->

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
									<li class="nav-item "><a class="nav-link" href="index.jsp">Home</a></li>
									<li class="nav-item"><a class="nav-link" href="about.jsp">MyPage</a></li>
									<li class="nav-item"><a class="nav-link"
										href="Mystore.jsp">MyStore</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="getStore.jsp]">StoreList</a></li>
								</ul>
							</div>
						</nav>
					</div>
					<div class="col-md-2">
						<ul class="social_icon">
							<li>
								<%
								if (member == null) {
								%>
								<button class="loginBtn"
									onclick="location.href='LoginJoinForm.jsp'">로그인</button> <%
 } else {
 %>
								<form action="LogoutController">
									<button class="logoutBtn">로그아웃</button>
								</form> <%
 }
 %>
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
						<h2 style="color: black;">가게 검색</h2>
						<!-- 검색창 -->
						<form action="getSearchResult.jsp" method="post">
							<div class="search1">
								<div class="search1">
									<input class="searchInput" name="name" type="text"
										placeholder="검색어 입력"> <img class="searchImg"
										src="images/search.png"> <select name="address"
										class="selectArea">
										<!-- 이거 value를 그냥 한글로할지 영어로 할지는 나중에 생각해야될듯 -->
										<option></option>
										<option>서초동</option>
										<option>잠원동</option>
										<option>반포동</option>
										<option>방배동</option>
										<option>도곡동</option>
										<option>양재동</option>
										<option>우면동</option>
										<option>원지동</option>
										<option>염곡동</option>
										<option>내곡동</option>
										<option>신원동</option>
									</select> <input class="selectDate" type="date" name="date"> <input
										type="submit" value="검색하기" class="searchBtn">
								</div>
							</div>
						</form>
						<!-- 검색창 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 이미지 슬라이드 시작 -->
	<div>
		<div>
			<!-- 가게의 이미지, 이름, 주소, 연락처 list에서 불러와서 출력 -->
			<%
			for (Store store : list) {
			%>
			<%-- <c:forEach items="${list}" var="b" varStatus="status"> --%>
			<div class="slider">
				<div class="slide-container">
					<swiper-container class="mySwiper"> <swiper-slide>
					<img src="data:image/jpg;base64,<%=store.getStore_img()%>"> </swiper-slide>
					<swiper-slide> <img src="images/nailartshop2.jpg">
					</swiper-slide> <swiper-slide> <img src="images/nailartshop3.jpg">
					</swiper-slide> <swiper-slide> <img src="images/nailartshop4.jpg">
					</swiper-slide> <swiper-slide> <img src="images/nailartshop5.jpg">
					</swiper-slide> <swiper-slide> <img src="images/nailartshop6.jpg"></swiper-container>
					<table class="storeListTb">
						<tr style="width: 80%">
							<td style="width: 80%">
								<h1>

									<a style="color: black"
										href="storeInfo.jsp?store_id=<%=store.getStore_id()%>"
										onclick="window.open(this.href,'_blank','width=600,height=1200');return false;"><%=store.getStore_name()%></a>
								</h1> <span>★★★★★ 4.8</span>
								<p style="color: black">11:00 ~ 21:00</p>
								<p style="color: black">
									주소 :
									<%=store.getStore_address()%></p>
								<p style="color: black">
									연락처 :
									<%=store.getStore_contact()%></p>
							</td>
							<td style="width: 19%; text-align: center;">
								<button onclick="" id="favoriteButton" class="favorite-btn">❤</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<%-- </c:forEach> --%>
			<%
			}
			%>
		</div>
	</div>
	<!-- 이미지 슬라이드 끝 -->
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
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/Functions.js"></script>
	<script>
		// 버튼 요소 가져오기
		var favoriteButton = document.getElementById('favoriteButton');

		// 버튼 클릭 시 토글 기능 추가
		favoriteButton.addEventListener('click', function() {
			this.classList.toggle('active'); // active 클래스를 토글
			// 여기에 찜 버튼을 눌렀을 때 수행할 동작 추가
			if (this.classList.contains('active')) {
				console.log('찜하기!');
			} else {
				console.log('찜 해제하기!');
			}
		});
	</script>
</body>
</html>