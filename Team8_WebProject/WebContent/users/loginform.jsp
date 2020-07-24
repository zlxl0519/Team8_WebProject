<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "로그인 "; 
</script>
<%--로그인 페이지 입니다.--%>
<div class="content">

<div class="form-wrap">
<h2>LOGIN</h2>

	<form id="loginForm" name="loginForm" action="login.jsp" method="post" >
	<div class="form-ul-wrap users-wrap">
		<ul>
			<li>
				<input type="text" name="id" id="id" placeholder="아이디" />
			</li>
			
			<li>
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호"/>
			</li>
		
		</ul>
		
				<button class="btn-default mt20" type="submit">로그인</button>
				<div class="chk-wrap">
					<input type="checkbox" name="remember" value="remember"/>로그인 상태 유지
				</div>
				
				
				<div class="a-wrap">
					<a href="idfind_form.jsp">아이디 찾기</a>
					<a href="pwdfind_form.jsp">비밀번호 찾기</a>
					<a href="${pageContext.request.contextPath }/signup/signup_form.jsp">회원가입</a>
				
				</div>
				
				
		</div>
	</form>
	
</div> <!--form-wrap 종료 --> 
	
</div><!-- content 종료  -->

<script>

	$("#loginForm").on("submit", function(){
		
		if($("#id").val()==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}else if($("#pwd").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pwd").focus();
			return false;
		}
	});

</script>
<jsp:include page="../include/footer.jsp"></jsp:include>