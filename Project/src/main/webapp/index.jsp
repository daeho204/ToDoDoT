<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
<title>tododot</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="dist/sakura.min.css">
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
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!-- body -->
<!-- <button id="chat" onclick="chat()">
	<img class="src" src="images/chat.png" alt="chat-icon">
</button> -->
<body class="main-layout">
	<%
		Member member = (Member)session.getAttribute("member");
		

		// 다운캐스팅
		// 세션에 저장한 result는 원래 Member타입의 객체이지만
		// 세션에서 가져올때 세션 타입의 객체 형태이다. 세션이 더 높은 타입이기에
		// 낮은 타입의 Member로 다운캐스팅, 강제 형변환을 한다.
		// 세션 활용해 데이터 가져오기. 서버의 저장공간을 활용한다. 그래서 서버에 무리를 줄 잠재위험이 있어 주의해야함.
	%>

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
									<li class="nav-item active"><a class="nav-link"
										href="index.jsp">Home</a></li>
									<%if(member==null){ %>
										<li class="nav-item"><a class="nav-link" href="LoginJoinForm.jsp">MyPage</a>
										</li>
									<%}else{ %>
										<li class="nav-item"><a class="nav-link" href="about.jsp">MyPage</a>
										</li>
									<%} %>
									<%if(member==null){ %>
										<li class="nav-item"><a class="nav-link" href="LoginJoinForm.jsp">MyStore</a>
										</li>
									<%}else{ %>
										<li class="nav-item"><a class="nav-link" href="Mystore.jsp">MyStore</a>
										</li>
									<%} %>
									<%if(member==null){ %>
										<li class="nav-item"><a class="nav-link" href="LoginJoinForm.jsp">StoreList</a>
										</li>
									<%}else{ %>
										<li class="nav-item"><a class="nav-link" href="getStore.jsp">StoreList</a>
										</li>
									<%} %>
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
										<a>==마이페이지==</a> <a href="about.jsp">회원정보수정</a> <a href="about.jsp">예약확인</a>
										<a href="about.jsp">찜목록 확인</a> <a>==마이스토어==</a> <a href="Mystore.jsp">가게등록</a>
										<a href="Mystore.jsp">가게정보 수정</a> <a href="Mystore.jsp">예약 확인/수락</a> <
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
	<!-- banner -->
	<section class="banner_main">
		<div id="myCarousel" class="carousel slide banner1"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container-fluid">
						<div class="carousel-caption relative">
							<div class="row d_flex">
								<div class="col-md-6">
									<img class="bann_img" src="images/banner_ing.jpg" alt="#" />
								</div>
								<div class="col-md-6">
									<span>01/03</span>
									<h1>
										바쁜 일상 속에서 <br> 자신을 위한
									</h1>
									<h1 class="bann_desc">소중한 시간</h1>
									<p>날마다 바쁘게 달려온 자기 자신을 위한 작은 포상</p>
									<a class="get_btn" href="getStore.jsp" role="button">지금
										예약하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container-fluid">
						<div class="carousel-caption relative">
							<div class="row d_flex">
								<div class="col-md-6">
									<img class="bann_img" src="images/banner_ing2.jpeg" alt="#" />
								</div>
								<div class="col-md-6">
									<span>02/03</span>
									<h1>
										신규가입 회원을 위한<br>할인 이벤트
									</h1>
									<p>지금 가입하면 모든 네일아트샵에서 무조건 사용가능한 쿠폰 증정</p>
									<% if(member==null) {%>
									<a class="get_btn" href="LoginJoinForm.jsp"
										onclick="LoginJoin()" 
										role="button"> 가입하기</a>
									<%}else{ %>
									<a class="get_btn"
										href="index.jsp" 
										role="button"> 가입하기</a>
									<%} %>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container-fluid">
						<div class="carousel-caption relative">
							<div class="row d_flex">
								<div class="col-md-6">
									<img class="bann_img" style="padding-left: 200px"
										src="images/banner_ing3.jpeg" alt="#" />
								</div>
								<div class="col-md-6">
									<span>03/03</span>
									<h1>
										100% 당첨되는<br>포토리뷰 이벤트!
									</h1>
									<p>매일네일을 통해 예약서비스를 이용하신 후 포토리뷰를 남겨주시면 모든 분께 선물을 증정해드립니다</p>
									<a class="get_btn" href="getStore.jsp" role="button">리뷰
										작성하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#myCarousel" role="button"
					data-slide="prev"> <i class="fa fa-long-arrow-left"
					aria-hidden="true"></i> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#myCarousel" role="button"
					data-slide="next"> <i class="fa fa-long-arrow-right"
					aria-hidden="true"></i> <span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>
	<!-- end banner -->

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
	<script>
		var member = '<%=member%>';
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
		
		function LoginJoin(){
			if(member==null){
				window.location.href = "LoginJoinForm.jsp";
			}
			else{
				window.location.href = "index.jsp";

			}
		}
	</script>
</body>
</html>