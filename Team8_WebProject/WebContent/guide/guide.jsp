<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
	<h1>이용안내</h1>
	<h2>운영시간</h2>
	<p>매일 10:30~21:00</p><br />
		<ul>
			<li>에이멍은 연중 무휴로 운영됩니다.</li>
			<li>독파크를 제외한 모든 서비스는 100% 예약제로 운영됩니다.</li>
			<li>호텔은 사전예약 시 8시부터 입실이 가능합니다.(사전예약 필수)</li>
			<li>사전입실 시 개인 상담이 어려우니 양해해 주시기 바랍니다.</li>
		</ul>
	<h2>상담문의</h2>
	<p>예약 및 상담시간 08:00 ~ 20:00</p>
		<ul>
			<li>에이멍 1111-2222</li>
		</ul>
	<h2>안내사항</h2>
	<p>이용 시 주의사항</p><br />
		<ul>
			<li>
				1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지 않은  반려견은 입실이 제한됩니다.
				<br>* 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요.
			</li>
			<li>
				1살 미만의 반려견인 경우 항체 검사가 필수 입니다.
				<br>(단, 1살 이상 시 재접종 기록 확인)
			</li>
			<li>생리,건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려견 일 경우 입실이 제한됩니다.</li>
			<li>
				펫택시 이용 시, 별도의 예약이 필요합니다.
				<br>(* 픽업 서비스 페이지 참고)
			</li>
		</ul>
	<h2>오시는 길</h2>
	<p>바우라움 위치</p><br />
		<ul>
			<li><i class="far fa-compass"></i>
				서울특별시 강남구 테헤란로 124 삼원타워 (1층 우리은행 건물)
				<br />※ 주차안내 : 평일주차 무료, 주말주차 30분 무료(이후 10분 당 500원)
			</li>
			<li><i class="fas fa-subway"></i>
				지하철 이용 시
				<br /><br />2호선 (강남 1번출구, 역삼 3번출구) , 도보 10분
				<br />신분당선(강남)
			</li>
		</ul>
</div>
<div id="map" style="width:500px;height:400px;"></div>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
	var markers = [
	    {
	        position: new kakao.maps.LatLng(33.450701, 126.570667)
	    },
	    {
	        position: new kakao.maps.LatLng(33.450001, 126.570467), 
	        text: '텍스트를 표시할 수 있어요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	    }
	];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng( 37.49889085864613, 127.03185970191794), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.49889085864613, 127.03185970191794); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
    	position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);   
</script>
</body>
</html>