<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg"
	color="#111">
<script
	src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
<title>MeilNail - 로그인 / 회원가입</title>
<link rel="canonical" href="https://codepen.io/Shruti-Ag/pen/YzywyKb">
<link rel="search" type="application/opensearchdescription+xml"
	href="https://ssl.pstatic.net/sstatic/search/opensearch-description.https.xml">

<!-- LoginJoinForm.css 적용 -->
<link rel="stylesheet" href="css/LoginJoinForm.css">

</head>

<body translate="no">
	<div class="wrapper">
		<div class="container">
			<div class="sign-up-container">
				<form id="joinForm" action="JoinController" method="post">
					<h1>계정 만들기</h1>
					<div class="social-links">
						<div>
							<a href="#"><img class="login_icon"
								src="images/구글 아이콘 이미지.png" alt="구글 이미지"></a>
						</div>
						<div>
							<a href="#"><img class="login_icon" src="images/네이버 이미지.png"
								alt="네이버 이미지"></a>
						</div>
						<div>
							<a href="#"><img class="login_icon" src="images/카카오 이미지.png"
								alt="카카오 이미지"></a>
						</div>
					</div>
					<input type="text" id="input" placeholder="아이디" name="id">
					<div>
						<!-- <button id="check" onclick="idCheck()">ID중복체크</button> -->
						<input id="check" type="button" value="ID중복체크" onclick="idCheck()">
						<span id="id_ok"></span>
						<span id="id_already"></span>
					</div>
					
					<input type="password" placeholder="비밀번호" name="pw"> 
					<input type="text" placeholder="이름" name="name"> 
					<input type="text" placeholder="주소" name="address">
					<input type="text" placeholder="연락처" name="phone"> 
					<input type="email" placeholder="이메일" name="email">
					<!-- 가게 등록하기 -->

					<div id="storeRegister">
						<p>가게를 등록하시겠습니까?</p>
						<input id="checkbox" type="checkbox" name="isbusiness">
					</div>
					

					<input class="hidden" id="storeNum" type="text"
						placeholder="사업자 번호" name="bnum">

					<button class="form_btn btnLoginJoin">가입하기</button>
				</form>
			</div>
			<div class="sign-in-container">
				<form action="LoginController" method="post">
					<h1>로그인</h1>
					<div class="social-links">
						<div>
							<a href="#"><img class="login_icon"
								src="images/구글 아이콘 이미지.png" alt="구글 이미지"></a>
						</div>
						<div>
							<a href="#"><img class="login_icon" src="images/네이버 이미지.png"
								alt="네이버 이미지"></a>
						</div>
						<div>
							<a href="#"><img class="login_icon" src="images/카카오 이미지.png"
								alt="카카오 이미지"></a>
						</div>
					</div>
					<input type="text" placeholder="아이디" name="id"> <input
						type="password" placeholder="비밀번호" name="pw">
					<button class="form_btn btnLoginJoin">로그인</button>
				</form>
			</div>
			<div class="overlay-container">
				<div class="overlay-left">
					<h1>이미 회원이신가요?</h1>
					<button id="signIn" class="overlay_btn btnLoginJoin">로그인</button>
				</div>
				<div class="overlay-right">
					<h2>아직 회원이 아니신가요?</h2>
					<button id="signUp" class="overlay_btn btnLoginJoin">회원가입</button>
				</div>
			</div>
		</div>
	</div>

	<!-- LoginJoinForm.js 적용 -->
	<script type="text/javascript" src="js/LoginJoinForm.js"></script>
	<script>
	
	</script>    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    
</body>

</html>