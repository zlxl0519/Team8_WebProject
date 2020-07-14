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
<script>
$(document).ready(function(){
	var counter =1;
	 
	$("#addBtn").on("click", function(){
		 
		 var str="<label> 반려견종<input class='form-control' type='text' value='' name='dogBreed"+counter+"' id='dogBreed"+counter+"'/></label>";
		var str2="<label>반려견나이<input class='form-control' type='text' value='' name='dogAge"+counter+"' id='dogAge"+counter+"' /></label>"
		 var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter++);
		 newTextBoxDiv.after().html(str+str2);
		  newTextBoxDiv.appendTo("#dogInput");
	});
	$("#removeBtn").on("click", function(){
		
		$("#TextBoxDiv" + counter--).remove();
	});
});
</script>
<div class="container">
	<h1>예약 페이지 폼입니다.</h1>
	<form action="reserve.jsp" method="post">
		<div class="form-group">
			<label for="name">보호자명</label>
			<input class="form-control" type="text" value="" name="name" id="name"/>
		</div>	
		<div class="form-group">
			<label for="phone">연락처</label>
			<%--연락처가 번호만 들어가도록 제한한다. jquery 사용 --%>
			<input class="form-control" type="text" value="" name="phone" id="phone" maxlength="11" placeholder="'-'을 제외한 휴대폰번호를 입력해 주세요"/>
			
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
		<button class="btn btn-outline-primary" type="button" id="addBtn">+</button>
		<button type="button" id="removeBtn">-</button>
		<div id="dogInput" class="form-row">
			<div id="TextBoxDiv">
				<label>
					반려견종
					<input class="form-control" type="text" value="" name="dogBreed" id="dogBreed"/>
				</label>
				<label>
					반려견나이
					<input class="form-control" type="text" value="" name="dogAge" id="dogAge" />
				</label>
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
	
	
	
</script>
</body>
</html>