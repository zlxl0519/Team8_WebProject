<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/master
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "아이디 찾기  "; 
</script>
<div class="content">
<div class="form-wrap">
		<h2>아이디 / 비밀번호 찾기</h2>
		<div class="find-tab">
			<a href="idfind_form.jsp" class="active bbn">아이디 찾기</a>
			<a href="pwdfind_form.jsp" class="bbc">비밀번호 찾기</a>
		</div>
		 
		 <div class="icon-wrap">
			<i class="fas fa-envelope"></i>
		 	<p class="form-span m0">
		 	<strong>등록된 이메일로 찾기</strong><br />
		 	가입 당시 입력한 이메일을 통해 아이디를 찾아주세요.
		 	</p>
		 </div>
		<form id="id_emailfind" action="id_find.jsp" method="post">
		<div class="form-ul-wrap users-wrap users-find-wrap">
			<ul class="mb20">
				<li>
					<input type="text" name="name" id="name" placeholder="이름 "/>
				</li>
				<li>
					<label for="email">e-mail</label>
					<input type="text" name="email_1" id="email_1" /> 
					&nbsp;&nbsp;@
					<input type="text" name="email_2" id="email_2" />
					<select name="selectEmail" id="selectEmail" class="m0">
						<option value="etc">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select>
				</li>
			</ul>
			<button type="submit" class="btn-default">찾기</button>
			<button type="reset" class="btn-default btn-gray">취소</button>
		</div><!-- users-find-wrap -->
		</form><!-- id_emailfind -->
	
	<div id="id_phonefind">
		<div class="icon-wrap">
			<i class="fas fa-mobile-alt"></i>		 	
		 	<p class="form-span m0">
		 	<strong>등록된 휴대폰 번호로 찾기</strong><br />
		 	가입 당시 입력한 연락처를 통해 아이디를 찾아주세요.
		 </div>
		<form id="id_phonefind" action="id_find2.jsp" method="post">
		<div class="form-ul-wrap users-wrap users-find-wrap">
			<ul>
				<li>
					<input type="text" name="name2" id="name2" placeholder="이름 "/>
				</li>
				<li>
					<input type="tel" name="phone" id="phone" placeholder="연락처 "/>
				</li>
			</ul>
			<div class="form-span m20 f_red">* 연락처는 '-' 없이 숫자만 입력해주세요.</div>
			<button type="submit" class="btn-default">찾기</button>
			<button type="reset" class="btn-default btn-gray">취소</button>
		</div><!-- users-find-wrap -->
		</form>
	</div><!-- id_phonefind -->
	
	</div><!-- form-wrap -->
		 
	
	
</div><!-- content 종료  -->


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
<<<<<<< HEAD
<jsp:include page="../include/footer.jsp"></jsp:include>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/id_find.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<body>
<div class="container">
	<h1>아이디 찾기</h1>
	<span>회원정보에 등록한 정보로 인증</span>
	<div class="id_emailfind">
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
</body>
</html>
>>>>>>> refs/heads/master
	
=======
<jsp:include page="../include/footer.jsp"></jsp:include>
>>>>>>> refs/remotes/origin/master
