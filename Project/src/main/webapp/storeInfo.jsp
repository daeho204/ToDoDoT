<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Menu"%>
<%@page import="com.smhrd.model.MenuDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Store"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.StoreDAO"%>
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
<title>tododot</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="dist/sakura.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="storeInfo.css">
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
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5a4d674bf36909d1cf9d7e211bfad53&libraries=services"></script>
</head>
<body>

	<%
	Member member = (Member)session.getAttribute("member");
	String store_id = request.getParameter("store_id");
	String user_id = member.getId();
	StoreDAO dao = new StoreDAO();
	Store store = dao.storeContent(store_id);
	
	pageContext.setAttribute("user_id", user_id);
	pageContext.setAttribute("store", store);
	System.out.println("storeid: " + store_id);
	System.out.println("storeimg: " + store.getStore_img());


	%>
	<section class="banner_main1">
		<div id="myCarousel" class="carousel slide banner1"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div style="text-align: center;" class="container-fluid">
						<img class="bann_img"
							src="data:image/jpg;base64, ${store.store_img}" alt="#" />
					</div>
				</div>
				<div class="carousel-item">
					<div style="text-align: center;" class="container-fluid">
						<img class="bann_img" src="images/banner_ing2.jpeg" alt="#" />
					</div>
				</div>
				<div class="carousel-item">
					<div style="text-align: center;" class="container-fluid">
						<img class="bann_img" src="images/banner_ing3.jpeg" alt="#" />
					</div>
				</div>
				<a class="carousel-control-prev" href="#myCarousel" role="button"
					data-slide="prev" style="top: 50%"> <i
					class="fa fa-long-arrow-left" aria-hidden="true"></i> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#myCarousel" role="button"
					data-slide="next" style="top: 50%"> <i
					class="fa fa-long-arrow-right" aria-hidden="true"></i> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>
	<section class="storeMain">
		<div class="storeContainer">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">홈</li>
				<li class="tab-link" data-tab="tab-2">메뉴</li>
				<li class="tab-link" data-tab="tab-3">리뷰</li>
				<li class="tab-link" data-tab="tab-4">찾아오시는 길</li>
			</ul>

			<div id="tab-1" class="tab-content current">
				<h1>${store.store_name}</h1>
				<span>★★★★★ 4.8</span>
				<div>
					<h4>영업시간</h4>
					<p>11:00 ~ 21:00</p>
				</div>
				<div class="card-content">
					<h4>매장 정보</h4>
					<p class="storeDesc">
						첫방문 고객 총비용 10% 포인트 지급! 현금처럼 사용 가능!<br> 타샵제거 여부와 자세한 사항을 예약
						메모에 남겨주세요!<br> <br> **사주보는 네일샵**(샵에 문의)<br> <br>
						샵에 50여개의 이벤트 가격 아트 보유중입니다.<br> 결제하고 오셔서 다른 아트로 바꾸셔도 되요!<br>
						<br> 젤제거<br> 타샵 제거만 하시면 2만원<br> 젤시술 같이하시면 만원<br>
						자샵제거 만원 자샵제거+젤네일시 5천원<br> 회원권은 제거 무료<br> <br> 일요일은
						정상영업! 빨간날도 열어요!<br>
					</p>
					<input type="checkbox" class="card-content__more-btn">
				</div>
				<div>
					<h4>연락처</h4>
					<p>${store.store_contact}</p>
				</div>
				<div>
					<h4>주소</h4>
					<p>${store.store_address}</p>
				</div>
				<div>
					<h4>채팅하기</h4>
					<button style="background-color: black; color: white;"
						onclick="chat()">채팅하기</button>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
			<form action = "Reservation">
				<table style="width: 100%">
					<tr style="width: 100%">
						<td class="menuTd" style="width: 30%"><img class="storeImg"
							src="images/nailart1.jpeg"></td>
						<td class="menuTd" style="width: 60%">이달의 아트(90분)<br>90000원
						</td>
						<td class="menuTd" style="width: 9%">
							<input type="checkbox" name="menu" value="이달의 아트(90분)">
                			<input type="hidden" name="selectedMenu" value="이달의 아트(90분)">
                			<input type="hidden" name="user_id" value="${user_id}">
                			<input type="hidden" name="store_id" value="${store.store_id}">
            			</td>
					</tr>
					<tr style="width: 100%">
						<td class="menuTd" style="width: 30%"><img class="storeImg"
							src="images/nailart2.jpg"></td>
						<td class="menuTd" style="width: 60%">젤 프렌치(90분)<br>90000원
						</td>
						<td class="menuTd" style="width: 9%">
							<input type="checkbox" name="menu" value="젤 프렌치(90분)">
                			<!-- <input type="hidden" name="selectedMenu" value="젤 프렌치(90분)"> -->
            			</td>
					</tr>
					<tr style="width: 100%">
						<td class="menuTd" style="width: 30%"><img class="storeImg"
							src="images/nailart3.jpg"></td>
						<td class="menuTd" style="width: 60%">이달의 아트(60분)<br>90000원
						</td>
						<td class="menuTd" style="width: 9%">
							<input type="checkbox" name="menu" value="이달의 아트(60분)">
                			<!-- <!-- <input type="hidden" name="selectedMenu" value="이달의 아트(60분)"> --> -->
            			</td>
					</tr>
				</table>
				<div class="menuReservation">
					<button style="position:relative;top:30px;" class="reserveBtn" onclick="submitForm()">예약하기</button>
				</div>
				</form>
				<div>
					<input class="selectDate" type="date" name="date">	
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<div>
					<h4>손 기본케어</h4>
					<span>★★★★★ 5</span>
					<p>
						네일 받았는데 사장님이 너무 친절하고 좋았어요.<br> 또 갈거에요~! 굳굳!
					<p>
					<p>billytm90</p>
				</div>
				<div>
					<h4>젤 그라데이션</h4>
					<span>★★★★★ 5</span>
					<p>
						급하게 약속이 잡혀서 당황했는데 빠르게 작업해주셨어요<br> 덕분에 좋은 시간을 보냈습니다~
					<p>
					<p>chaerin24</p>
				</div>
				<div>
					<h4>이달의 아트</h4>
					<span>★★★★★ 5</span>
					<p>
						사장님이 너무 친절하시고 실력이 좋으세요~<br> 다음에도 꼭 부탁드릴 예정입니다!
					<p>
					<p>nada208</p>
				</div>
				<div>
					<form action="AddReviewController" method="post">
						<div>
							<table style="width: 100%">
								<tr>
									<td style="width: 10%">메뉴 :</td>
									<td><input style="width: 50%" type="text" name="menu_id"
										placeholder='메뉴의 이름을 적어주세요.'></td>
								</tr>
								<tr>
									<td>평점 :</td>
									<td><input style="width: 50%" type="number"
										name="review_star" placeholder='평점은 1~5에서 매겨주세요.'></td>
								</tr>
								<tr>
									<td>리뷰 :</td>
									<td><textarea style="width: 100%" rows="4" name="review_content"
											placeholder='아름다운 세상을 위해 네티켓을 지켜주세요.'></textarea></td>
								</tr>
								
							</table>
							<div style="text-align:right">
								<button style="background:black;color:white" type="submit">리뷰 남기기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="tab-4" class="tab-content" >
				<div id="map" style="width: 100%; height: 400px;"></div>
			
			<script>
			        var storeAddress = "${store.store_address}";
			        var geocoder = new kakao.maps.services.Geocoder();
			        geocoder.addressSearch(storeAddress, function(result, status) {
			            if (status === kakao.maps.services.Status.OK) {
			                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			                var mapContainer = document.getElementById('map');
			                var mapOptions = {
			                    center: coords,
			                    level: 3
			                };
			                var map = new kakao.maps.Map(mapContainer, mapOptions);
			                var marker = new kakao.maps.Marker({
			                    map: map,
			                    position: coords
			                });
			            } else {
			                alert('주소를 찾을 수 없습니다.');
			            }
			        });
			        window.mapCreated = true;
				</script>
				<h6>*지도가 제대로 로딩이 되지 않았다면 전체화면으로 변경해주세요</h6>
			</div>
		</div>
	</section>








	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="dist/sakura.min.js"></script>
	<script src="js/Functions.js"></script>
	<script>
		$(document).ready(function() {
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});
		});
		<!-- 
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 -->
	</script>
	
	<script>
	function submitForm() {
		var store_id = "${store.store_id}";
		var user_id = "${user_id}";
		var selectedMenu = document.getElementByName("menu")
    	var selectedMenus = [];
    	/* var checkboxes = document.getElementsByName("menu");
    	for (var i = 0; i < checkboxes.length; i++) {
        	if (checkboxes[i].checked) {
            	selectedMenus.push(checkboxes[i].value);
        	}
    	} */
    	document.querySelector("form").action = "Reservation?store_id=" + store_id + "&user_id=" + user_id +"menu_name="+selectedMenu;
    	//document.getElementsByName("selectedMenu")[0].value = selectedMenus.join(", ");
    	document.querySelector("form").submit();
	}
</script>
</body>
</html>