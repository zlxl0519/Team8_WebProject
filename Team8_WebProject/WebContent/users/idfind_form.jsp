<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "아이디 찾기  "; 
</script>
<div class="content">
	<h1>아이디 찾기</h1>
	<span>회원정보에 등록한 정보로 인증</span>
	<div>
		<h2>이름, 이메일로 찾기</h2>
		<form id="id_emailfind" action="id_find.jsp" method="post">
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" name="name" id="name" />
			</div>
			<div class="form-group">
				<label for="email">e-mail</label>
				<input type="text" name="email_1" id="email_1" />@
				<input type="text" name="email_2" id="email_2" />
				<select name="selectEmail" id="selectEmail">
					<option value="etc">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
				</select>
			</div>
			<button type="submit">찾기</button>
			<button type="reset">취소</button>
		</form>
	</div>
	<div class="id_phonefind">
		<h2>이름, 핸드폰번호로 찾기</h2>
		<form id="id_phonefind" action="id_find2.jsp" method="post">
			<div class="form-group">
				<label for="name2">이름</label>
				<input type="text" name="name2" id="name2" />
			</div>
			<div class="form-group">
				<label for="phone">연락처</label>
				<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"/>
			</div>
			<button type="submit">찾기</button>
			<button type="reset">취소</button>
		</form>
	</div>
</div>
<script>
	//이메일 뒤에 주소 입력하는 기능
	$("#selectEmail").change(function(){
		if($(this).val()=="etc"){//직접입력일 경우
			$("#email_2").val(""); //값 초기화
			$("#email_2").attr("disabled", false);//활성화
		}else{//직접입력이 아닐경우
			$("#email_2").val($("#selectEmail").val()); //선택값 입력
			$("#email_2").attr("disabled", true)// 비활성화
		}
	});
	
	//이름 , 이메일로 찾기 버튼을 입력안하고 눌렀을때
	$("#id_emailfind").on("submit", function(){
		
		if($("#name").val().length<1){
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}
		
		if($("#email_1").val().length<1 && $("#email_2").val().length<1){//이메일을 입력하지 않았다면
			alert("이메일을 제대로 입력해주세요");
			$("#email_1").focus();
			return false;
		}
	});
	
	//이름, 연락처로 찾기 버튼을 입력안하고 눌렀을때
	$("#id_phonefind").on("submit", function(){
		if($("#name2").val().length<1){
			alert("이름을 입력해주세요");
			$("#name2").focus();
			return false;
		}
		
		if($("#phone").val().length<1){
			alert("연락처를 입력해주세요");
			$("#phone").focus();
			return false;
		}
	});
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
	