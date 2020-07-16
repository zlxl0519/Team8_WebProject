<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "비밀번호 찾기  "; 
</script>


<div class="content">
	<div class="form-wrap">
		<h2>비밀번호 찾기</h2>
		<p>회원정보에 등록한 정보로 인증.</p>
		
		<form id="pwdfind_form" action="pwd_find.jsp" method="post">
			<h2>아이디와 이름, 핸드폰 번호를 입력해주세요.</h2>
			<div class="form-ul-wrap">
				<ul>
					<li>
						<label for="id">아이디</label>
						<input class="form-control" type="text" name="id" id="id" />
					</li>
					<li>
						<label for="name">이름</label>
						<input class="form-control" type="text" name="name" id="name" />
					</li>
					<li>
						<label for="phone">연락처</label>
						<input class="form-control" type="text" name="phone"	id="phone" />
					</li>
					
				</ul>
				<button type="submit">찾기</button>
				<button type="reset">취소</button>
			</div>
		</form>
		
	</div><!-- form-wrap -->
	
</div><!-- content -->


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
<jsp:include page="../include/footer.jsp"></jsp:include>