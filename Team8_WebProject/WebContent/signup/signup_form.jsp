<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "회원가입 페이지"; 
</script>
<%--회원가입 폼입니다.--%>
<div class="content">

<div class="form-wrap">
<h2>회원가입</h2>
	<form action="signup.jsp" method="post">
		<div class="form-ul-wrap">
		<ul>
			<li class="profile-wrap">
			<div class="profile-box">
			<label for="img">프로필 이미지</label>
				<div class="profile-img">
				 <img src="https://bit.ly/32l7wx5" />
				 
				</div>
				
					<div class="profile-btn">
						<label for="img"><i class="fas fa-images"></i></label>
						<input type="file" name="img" id="img"/>
					</div>
					
				</div>
				
			</li>
			<li>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" placeholder="30자 이내의 영문/숫자만 입력 가능합니다."/>
				<a href=""><button>중복확인</button></a>
				<span class="form-span">* 입력하신 아이디의 중복확인을 해주세요.</span>
			
			</li>
			<li>
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/>
			</li>
			<li>
				<label for="pwd2">비밀번호 확인</label>
				<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="비밀번호 입력 확인"/>
			</li>
			<li>
				<label for="email">이메일</label>
				<input type="text" name="email01" id="email01" />
				<span>&nbsp;&nbsp;@</span>
	            <input type="text" id="email02" name="email02" list="domains" placeholder="도메인입력/선택" />
	            <datalist id="domains">
	                <option value="naver.com">
	                <option value="daum.net">
	                <option value="gmail.com">
	                <option value="yahoo.co.kr">
	            </datalist>
			</li>
			<li>
				<label for="name">성함</label>
				<input type="text" name="name" id="name" />
			</li>
			<li>
				<label for="phone">연락처</label>
				<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"/>
			</li>
		</ul>
			
		</div>
		
		<div class="form-ul-wrap">
			<h2 class="mt20">반려견 정보</h2>
		<ul>
			<li>
				<label for="dname">반려견 이름</label>
				<input type="text" name="dname" id="dname" placeholder="반려견의 이름을 작성해주세요" />
			</li>
			<li>
				<label for="dage">반려견 나이</label>
				<input type="number" name="dage" id="dage" /><span>&nbsp;살</span>
			</li>
			<li>
				<label for="breed">반려견의 견종</label>
				<input type="text" name="breed" id="breed" placeholder="견종을 작성해주세요"/>
			</li>
			<li>
				<fieldset>
					<legend>반려견 무게</legend>
					<input type="checkbox" name="weight" value="0to4"/>0~4kg
					<input type="checkbox" name="weight" value="4to10"/>4~10kg
					<input type="checkbox" name="weight" value="10to25"/>10~25kg
					<input type="checkbox" name="weight" value="over25"/>25~kg
				</fieldset>
			</li>
			<li>
				<fieldset>
					<legend>중성화 유무</legend>
					<input type="radio" name="neutral" value="yes" checked/> 유
					<input type="radio" name="neutral" value="no" /> 무
				</fieldset>	
			</li>
			<li>
			
			<fieldset>
				<legend>성별선택</legend>
				<input type="radio" name="gender" value="male" checked/> 남아
				<input type="radio" name="gender" value="female" /> 여아
			</fieldset>
			</li>
			<li>
				<label for="memo">기타사항</label>
				<textarea name="memo" id="memo" cols="60" rows="10" placeholder="반려견 호텔링 시, 요청사항이나 주의해야하는 사항을 적어주세요"></textarea>
			</li>
		</ul>	
		</div>	
		
		
		<a href="signup.jsp"><button class="btn-default">회원가입</button></a>
	</form>
</div> <!--form-wrap 종료 --> 
	
</div><!-- content 종료  -->
<jsp:include page="../include/footer.jsp"></jsp:include>
