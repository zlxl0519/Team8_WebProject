<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "로그인 "; 
</script>
<%--로그인 페이지 입니다.--%>
<%
	//쿠키에 저장해 놓은 id 와 pwd 를 넣는 변수
	String savedId="";
	String savedPwd="";
	//쿠키에 저장된 값을 위에 변수에 넣는다.
	Cookie[] cooks=request.getCookies();
	if(cooks!=null){//쿠키 값이 넣어져 있다면
		for(Cookie tmp : cooks){
			//저장된 키값을 읽어온다.
			String key=tmp.getName();
			//키값이 savedId 라면 변수에 저장한다.
			if(key.equals("savedId")){
				savedId=tmp.getValue();
			}
			//키값이 savedPwd 라면 변수에 저장한다.
			if(key.equals("savedPwd")){
				savedPwd=tmp.getValue();
			}
		}
	}
%>
<div class="content">

<div class="form-wrap">
<h2>LOGIN</h2>

	<form id="loginForm" name="loginForm" action="login.jsp" method="post" >
	<div class="form-ul-wrap users-wrap">
		<ul>
			<li>
				<input type="text" name="id" id="id" value="<%=savedId %>" placeholder="아이디" />
			</li>
			
			<li>
				<input type="password" name="pwd" id="pwd" value="<%=savedPwd %>" placeholder="비밀번호"/>
			</li>
		
		</ul>
		
				<button class="btn-default mt20" type="submit">로그인</button>
				<div class="chk-wrap">
					<input type="checkbox" name="remember" value="remember" checked/>로그인 상태 유지
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