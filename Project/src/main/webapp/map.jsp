<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5a4d674bf36909d1cf9d7e211bfad53"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5a4d674bf36909d1cf9d7e211bfad53&libraries=services"></script>	
</head>
<body>

	
	<div id="tab-4" class="tab-content" onclick="map.relayout()">
				<div id="map"  style="width: 80%; height: 400px; text-align : center"></div>
	<script>
	
			        var storeAddress = "서울 강북구 도봉로10길 38 2층 네일다움";
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
				</script>
</body>
</html>