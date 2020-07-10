<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>예약 페이지 폼입니다.</h1>
	<form action="reserve.jsp" method="post">
		<div class="form-group">
			<label for="name">보호자명</label>
			<input class="form-control" type="text" name="name" id="name"/>
		</div>	
		<div class="form-group">
			<label for="phone">연락처</label>
			<select name="phone" id="phone">
				<option value="">연락처 선택</option>
				<option value="010">010</option>
				<option value="070">070</option>
			</select>
			<input class="form-control" type="text" name="phone2" id="phone"/>
		</div>
		<div class="form-group">
			<label for="service">희망서비스</label>
			<select class="form-control" name="service" id="service">
				<option value="">서비스 선택</option>
				<option value="호텔&데이케어">호텔&데이케어</option>
				<option value="독파크">독파크</option>
				<option value="스페셜 케어">스페셜 케어</option>
			</select>
		</div>
		<div class="form-group">
			<label for="dogBreed">반려견종</label>
			<input class="form-control" type="text" name="dogBreed" id="dogBreed"/>
			<label for="dogAge">반려견나이</label>
			<input class="form-control" type="text" name="dogAge" id="dogAge" />
			<input class="form-control" type="button" value="plus" />
		</div>
		<div class="form-group">
			<label for="checkin">체크인</label>
			<input class="form-control" type="date" name="checkin" id="checkin" placeholder="MM/DD/YYYY" />
		</div>
		<div class="form-group">
			<label for="checkout">체크아웃</label>
			<input class="form-control" type="date" name="checkout" id="checkout" placeholder="MM/DD/YYYY" />
		</div>
		<div class="form-group">
			<label for="etc">기타</label>
			<textarea class="form-control" name="etc" id="etc" cols="30" rows="10" 
			placeholder="효과적인 서비스 추천을 위해 반려견 이름, 중성화 여부, 문제행동 등 자세한 사항을 작성해 주세요."></textarea>
		</div>
		<button class="btn btn-primary" type="submit">예약하기</button>
	</form>
</div>
</body>
</html>