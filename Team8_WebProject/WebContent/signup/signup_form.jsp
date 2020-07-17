<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

	<h1>회원가입 폼입니다.</h1>
	<div class="content">
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<label for="img">프로필 이미지</label>
		<input type="file" name="img" id="img"/><br />
	</form>
	<form action="signup.jsp" method="post" id="signup">
		<div style=" width:450px; border-top-style: solid; margin-bottom: 20px; padding-top: 10px;">
		
			<label for="id">아이디*</label>
			<input type="text" name="id" id="id" maxlength="30" placeholder="5자 이상 30자 이내의 영문/숫자만 입력 가능합니다."/><span id="checkResult"></span><br />
			<div id="idAlert">아이디는 5자 이상 30자 이내의 영문/숫자만 입력 가능합니다.</div>
			<span>*입력하신 아이디의 중복확인을 해주세요.</span>
			<button id="checkBtn">중복확인</button><br />
			
			<label for="pwd">비밀번호*</label>
			<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/><br />
			<div id="pwdAlert">특수문자는 8자 이상 16자리 이하의 영문/숫자/특수문자 ~!@#$%^&* 만 사용이 가능합니다.</div>
			<label for="pwd2">비밀번호 확인</label>
			<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="비밀번호 입력 확인"/><br />
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			
			<label for="email">이메일*</label>
			<input type="text" name="email01" id="email01" /><span>@</span>
            <input id="email02" name="email02" list="domains" placeholder="도메인입력/선택"><br />
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            </datalist>
			
			<label for="name">성함*</label>
			<input type="text" name="name" id="name" />
			<br />
			
			<label for="phone">연락처*</label>
			<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"/>
			<div id="phoneAlert">연락처는 '-' 없이 숫자만 입력해주세요.</div>
			<br />
			<span>* 표시가 되어있는 칸은 반드시 입력하셔야 가입이 가능합니다</span>
		</div>
			
		<div style=" width:450px; border-top-style: solid; margin-bottom: 20px; padding-top: 10px;">
			<label for="dname">반려견 이름</label>
			<input type="text" name="dname" id="dname" placeholder="반려견의 이름을 작성해주세요" /><br />
			<label for="dage">반려견 나이</label>
			<input type="number" name="dage" id="dage" /><span>살</span><br />
			<label for="breed">반려견의 견종</label>
			<input type="text" name="breed" id="breed" placeholder="견종을 작성해주세요"/><br />
			<fieldset>
				<legend>반려견 무게</legend>
				<input type="checkbox" name="weight" value="0to4"/>0~4kg n 
				<input type="checkbox" name="weight" value="4to10"/>4~10kg
				<input type="checkbox" name="weight" value="10to25"/>10~25kg
				<input type="checkbox" name="weight" value="over25"/>25~kg
			</fieldset><br />
			
			<fieldset>
				<legend>중성화 유무</legend>
				<input type="radio" name="neutral" value="yes" checked/> 유
				<input type="radio" name="neutral" value="no" /> 무
			</fieldset><br />	
			
			<fieldset>
				<legend>성별선택</legend>
				<input type="radio" name="gender" value="male" checked/> 남아
				<input type="radio" name="gender" value="female" /> 여아
			</fieldset><br />
			
			<label for="memo">기타사항</label>
			<textarea name="memo" id="memo" cols="60" rows="10" placeholder="반려견 호텔링 시, 요청사항이나 주의해야하는 사항을 적어주세요"></textarea>
		
		</div>

		<button type="submit" id="submit">회원가입 하기</button>
	</form>
	</div>



	<script>
		
	var canUse = false;
	
	//==========  비밀번호 재확인 일치불일치 =============
		$("#alert-success").hide();
		$("#alert-danger").hide();
		
		$("#signup").keyup(function(){
			var pwd1 = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			if(pwd1!="" || pwd2!=""){
				if(pwd1==pwd2){
					$("#alert-sucess").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
					 canUse = true;
				}else{
					$("#alert-success").hide(); 
					$("#alert-danger").show();
					$("#submit").attr("disabled", true);
					 canUse = false;
				}
			}
		})
	
		
	//=========== 아이디 중복 확인 =======================
		var isChecked = false;
		
		$("#checkBtn").on("click", function(){
			
			var inputId = $("#id").val();
			isChecked = true;
			
			$.ajax({
				method : "get",
				url : "checkid.jsp",
				data : "inputId="+inputId,
				success : function(data){
					if(data.isExist || !canUseId2){
						$("#checkResult").text("사용이 불가한 아이디입니다.").css("color", "red");
						canUseId=false;
					}else{
						$("#checkResult").text("사용 가능한 아이디입니다.").css("color","green");
						canUseId=true;
					}
				}
			}); 
			return false;
		});
		
		$("#signup").on("submit", function(){
			if(!canUseId){
				alert("아이디 중복을 확인하세요");
				return false;
			}
		})
		
		
		
	//=========아이디 영문/숫자 제한==============
		var enNumCheck = RegExp(/[^A-Za-z0-9]{5,30}$/);
		$("#idAlert").hide();
		$("#id").keyup(function(){
			if(enNumCheck.test($("#id").val())){
				$("#idAlert").show();
				$("#submit").attr("disabled", true);
				canUseId2 = false;
			}else{
				$("#idAlert").hide();
				$("#submit").removeAttr("disabled");
				 canUseId2 = true;
			}
		})
		
		
		
	//=========비밀번호 영문/숫자/특수문자 제한===========
		var enNumSpkCheck = RegExp(/[^A-Za-z0-9~!@#$%^&*]{8,16}$/);

		$("#pwdAlert").hide();
		$("#pwd").keyup(function(){
			if(enNumSpkCheck.test($("#pwd").val())){
				$("#pwdAlert").show();
				$("#submit").attr("disabled", true);
				 canUse = false;
			}else{
				$("#pwdAlert").hide();
				$("#submit").removeAttr("disabled");
				 canUse = true;
			}
		})
		
		
	//=========연락처 숫자 제한===========
		var numCheck = RegExp(/[^0-9]$/);
		$("#phoneAlert").hide();
		$("#phone").keyup(function(){
			if(numCheck.test($("#phone").val())){
				$("#phoneAlert").show();
				$("#submit").atter("disabled", true);
			}else{
				$("#phoneAlert").hide();
				$("#submit").removeAttr("disabled");
				 canUse = true; 
			}
		})

		
		//=========기타...등등===========
		$("#submit").on("click", function(){
			if($("#id").val() == "" || $("#id").val().length <5){
				alert("아이디를 5자 이상 쓰세요")
				$("#id").focus();
				return false;
			}else if(!isChecked){
				alert("아이디 중복확인을 해주세요")
				$("#id").focus();
				return false;
			}else if($("#pwd").val() == "" || $("#pwd").val() != $("#pwd2").val()){
				alert("비밀번호를 확인하세요.")
				$("#pwd").focus();
				return false;
			}else if($("#email01").val() == "" || $("#email02").val() == ""){
				alert("이메일을 확인하세요")
				$("#email").focus();
				return false;
			}else if($("#phone").val() == "" || $("#phone").val().length < 10){
				alert("연락처를 확인하세요")
				$("#phone").focus();
				return false;
			}else if($("#name").val() == ""){
				alert("이름을 확인하세요")
				$("#name").focus();
			}else if(!canUse){
				alert("잘못입력하신 가입란이 있습니다. 다시 확인해주세요.")
				return false;
			}
		})
		
	</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"></jsp:include>

<%--
	자바스크립트 정규식에서 자주 사용되는 메소드 search(), test(), replace()
	1. search(); == 전체 문장에서 찾고자 하는 문자열이 몇 번째에 위치해있는지 알려준다.
		용례) var string = "Please visit myWeb!";
			 var position = string.search("myWeb");
			 console.log(position);
			 -->  result : 13
	
	2. test(); == 문장 안에 찾으려는 문자가 들어있으면, 결과는 "true"이다.
		용례) var string = "Please visit myWeb!";
			 var reg = /my/;
			 var testing = reg.test(string);
			 console.log(testing);
			 --> result : true
			 
	3. replace(); == 문자열의 일부를 다른 문자열로 바꿀 때 사용한다.
		용례) var string = "Please visit myWeb!";
			 var change = string.replace("myWeb", "Naver");
			 console.log(change);
			 --> result : Please visit Naver!
 --%>

