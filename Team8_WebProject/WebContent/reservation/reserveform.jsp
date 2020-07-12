<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>

</head>
<body>
<div class="container">
	<h1>예약 페이지 폼입니다.</h1>
	<form action="reserve.jsp" method="post">
		<div class="form-group">
			<label for="name">보호자명</label>
			<input class="form-control" type="text" name="name" id="name"/>
		</div>	
		<div class="form-row">
			<div class="form-group">
				<label for="phone">연락처</label>
			</div>
			<div class="form-group col-md-2">
				<select name="phone" id="phone">
					<option value="">연락처 선택</option>
					<option value="010">010</option>
					<option value="070">070</option>
				</select>
			</div>
			<div class="form-group col-md-6">
			<%--연락처가 번호만 들어가도록 제한한다. jquery 사용 --%>
				<input class="form-control" type="text" name="phone2" id="phone2" maxlength="8" placeholder="'-'을 제외한 휴대폰번호를 입력해 주세요"/>
			</div>
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
		<div class="form-row">
			<div class="col" id="dogBreedInput">
				<label for="dogBreed">반려견종</label>
				<input class="form-control" type="text" name="dogBreed" id="dogBreed"/>
			</div>
			<div class="col" id="dogAgeInput">
				<label for="dogAge">반려견나이</label>
				<input class="form-control" type="text" name="dogAge" id="dogAge" />
			</div>
			<div id="button">
				<button class="btn btn-outline-primary" type="button" id="makeBtn">+</button>
				<button class="btn btn-outline-warning" type="button" id="removeBtn">-</button>
			</div>
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
		<button class="btn btn-outline-primary btn-block" type="submit">예약하기</button>
	</form>
</div>
<script>
	//연락처 입력칸에 번호만 입력되도록한다. 
	$("#phone2").on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	//반려견종, 반려견나이 입력칸 추가하기
	$("#makeBtn").on("click", function(){
		$("<label>").text("반려견종").attr("for", "dogBreed").appendTo("#dogBreedInput");
		$("<input>").attr("class", "form-control").attr("type", "text").attr("name", "dogBreed").appendTo("#dogBreedInput");
		$("<label>").text("반려견나이").attr("for","dogAge").appendTo("#dogAgeInput");
		$("<input>").attr("class", "form-control").attr("type", "text").attr("name","dogAge").appendTo("#dogAgeInput");
		
	});
	//반려견종, 반려견나이 입력칸 지우기
	$("#removeBtn").on("click" ,function(){
		
	});
</script>
</body>
</html>