<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwdfind_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<body>
<div class="container">
	<h1>비밀번호 찾기</h1>
	<p>회원정보에 등록한 정보로 인증.</p>
	<div class="pwdfind">
		<h2>아이디와 이름, 핸드폰 번호를 입력해주세요.</h2>
		<form id="pwdfind_form" action="pwd_find.jsp" method="post">
			<div class="form-group">
				<label for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" />
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" />
			</div>
			<div class="form-group">
				<label for="phone">연락처</label>
				<input class="form-control" type="text" name="phone"	id="phone" />
			</div>
			<button type="submit">찾기</button>
			<button type="reset">취소</button>
		</form>
	</div>
</div>
<script>
	$("#pwdfind_form").on("submit", function(){
		//아이디 입력칸이 비어있다면
		if($("#id").val().length<1){
			alert("아이디를 올바르게 입력해주세요");
			$("#id").focus();
			return false;
		}
		//이름 입력칸이 비어있다면
		if($("#name").val().length<1){
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		
		//연락처 입력칸이 비어있다면
		if($("#phone").val().length<1){
			alert("연락처를 올바르게 입력해주세요");
			$("#phone").focus();
			return false;
		}
	});
</script>
</body>
</html>