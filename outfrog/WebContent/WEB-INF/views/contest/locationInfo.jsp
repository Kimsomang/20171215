<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>찾아오시는 길</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=KFbrTnJK1NElktJ8Ulqf&submodules=geocoder"></script>
</head>
<body>
<h3>찾아오시는 길</h3>
<p>주소 : 서울특별시 금천구 가산디지털1로 149(가산동 371-59) 신한이노플렉스 2층 6강의실</p>
<div id="map" style="width:100%;height:400px;"></div>

<script>

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.4786992,126.8814174),
    zoom: 12
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.4786992,126.8814174),
    map: map
});


</script>
<input type="image" src="resources/image/traffic.png">
</body>
</html>