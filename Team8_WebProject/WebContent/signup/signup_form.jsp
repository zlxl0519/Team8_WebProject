<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "회원가입 "; 
</script>
<%--회원가입 폼입니다.--%>

	<h1>회원가입 폼입니다.</h1>
	<form action="signup.jsp" method="post">
		<div>
			<label for="img">프로필 이미지</label>
			<input type="file" name="img" id="img"/><br />
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" placeholder="영문/숫자만 입력 가능합니다."/>
			<p>*입력하신 아이디의 중복확인을 해주세요.</p>
			<a href=""><button>중복확인</button></a><br />
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/><br />
			<label for="pwd2">비밀번호 확인</label>
			<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="비밀번호 입력 확인"/><br />
			<label for="email">이메일</label>
			<input type="text" name="email01" id="email01" /><span>@</span>
            <input id="email02" name="email02" list="domains" placeholder="도메인입력/선택"><br />
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            </datalist>
			<label for="phone">연락처</label>
			<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"/>
			<br />
			<label for="nick">닉네임</label>
			<input type="text" name="nick" id="nick" /><a href=""><button>중복확인</button></a>
			
			<fildset>
				<legend>견종무게</legend>
				<input type="checkbox" name="dogweight" value="0to4"/>0~4kg
				<input type="checkbox" name="dogweight" value="4to10"/>4~10kg
				<input type="checkbox" name="dogweight" value="10to25"/>10~25kg
				<input type="checkbox" name="dogweight" value="over25"/>25~kg
			</fildset>
			<fildset>
				<legend>중성화 유무</legend>
				<input type="radio" name="neutralization" value="yes" checked/> 유
				<input type="radio" name="neutralization" value="no" /> 무
			</fildset>			
			<fildset>
				<legend>성별선택</legend>
				<input type="radio" name="gender" value="male" checked/> 남아
				<input type="radio" name="gender" value="female" /> 여아
			</fildset>
		</div>
		<a href=""><button>회원가입 하기</button></a>
	</form>
<jsp:include page="../include/footer.jsp"></jsp:include>