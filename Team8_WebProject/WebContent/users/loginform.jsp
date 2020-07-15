<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>

<body>

<div class="container">
	<h1>LOGIN</h1>
	<form id="loginForm" action="login.jsp" method="post" >
		<div class="form-group col-md-6">
			<input class="form-control" type="text" name="id" id="id" placeholder="아이디" />
		</div>
		<div class="form-group col-md-6">
			<input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호"/>
		</div>
		<button class="btn btn-primary btn-lg btn-block col-md-6" type="submit">로그인</button>
		<input type="checkbox" name="remember" value="remember"/>로그인 상태 유지
	</form>
	<div class="content">
		<a href="findform.jsp">아이디 찾기</a>
		<a href="findform.jsp">비밀번호 찾기</a>
		<a href="${pageContext.request.contextPath }/signup/signup_form.jsp">회원가입</a>
	</div>
</div>
<script>

	$("#loginForm").on("submit", function(){
		
		if($("#id").val()==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
		
		if($("#pwd").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pwd").focus();
			return false;
		}
	});

</script>
</body>
</html>