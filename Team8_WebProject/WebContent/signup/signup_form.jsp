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

<%--회원가입 폼입니다.--%>
	<h1>회원가입 폼입니다.</h1>
	<div class="content">
	<form action="signup.jsp" method="post" id="signup">
		<div style=" width:450px; border-top-style: solid; margin-bottom: 20px; padding-top: 10px;">
			<label for="img">프로필 이미지</label>
			<input type="file" name="img" id="img"/><br />
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" placeholder="30자 이내의 영문/숫자만 입력 가능합니다."/><br />
			<span>*입력하신 아이디의 중복확인을 해주세요.</span>
			<a href=""><button>중복확인</button></a><br />
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/><br />
			<label for="pwd2">비밀번호 확인</label>
			<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="비밀번호 입력 확인"/><br />
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			<label for="email">이메일</label>
			<input type="text" name="email01" id="email01" /><span>@</span>
            <input id="email02" name="email02" list="domains" placeholder="도메인입력/선택"><br />
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            </datalist>
			<label for="name">성함</label>
			<input type="text" name="name" id="name" />
			<br />
			<label for="phone">연락처</label>
			<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"/>
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
		<a href="signup.jsp"><button>회원가입 하기</button></a>
	</form>
	</div>

	<script>
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
				}else{
					$("#alert-success").hide(); 
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
					return false;
				}
			}
		})
	</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"></jsp:include>
