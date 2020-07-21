<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 아이디
	String id=(String)session.getAttribute("id");
	//세션에 저장된 비밀번호 
	String pwd=(String)session.getAttribute("pwd");
	MemberDto dto = MemberDao.getInstance().getData(id);
	MemberDto emailData = MemberDao.getInstance().getEmail(id);
%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amung- 개인정보수정"; 
</script>
<%-- 회원정보수정 --%>
<div class="content">
	<div class="sub-nav">
	<h2>MyPage</h2>
	<div class="sub-nav-gnb">
		<ul>
			<li><a href="info.jsp">내 정보 보기 </a></li>
			<li><a href="reserve_status.jsp">예약현황</a></li>
			<li class="active"><a href="update_pwdokform.jsp">내 정보 수정 </a></li>
		</ul>
	</div><!-- sub-nav-gnb -->
</div><!-- sub-nav -->
<div class="form-wrap">
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div class="form-ul-wrap mb0">
		
			<ul>
				<li class="profile-wrap bbn">
				<div class="profile-box">
				<label for="img">프로필 이미지</label>
					<div class="profile-img">
					 <!-- <img src="https://bit.ly/32l7wx5" /> -->
					</div>
					
						<div class="profile-btn">
							<label for="img"><i class="fas fa-images"></i></label>
							<input type="file" name="img" id="img"/>
						</div>
						
					</div>
					
				</li>
			</ul>
		</div>
			
	</form>
	<form action="signup.jsp" method="post" id="signup">
		<div class="form-ul-wrap">
		<ul>
			
			<li>
				<label for="id">아이디 *</label>
				<input type="text" name="id" id="id" maxlength="30"  value="<%=dto.getId()%>" disabled/>
				<span class="form-span">* 아이디는 수정 할 수 없습니다.</span>
			</li>
			<li>
				<label for="pwd">기존 비밀번호</label>
				<input type="text" name="pwdExist" id="pwdExist" maxlength="16" value="<%=dto.getPwd()%>" disabled/>
			</li>
			<li>
				<label for="pwd">변경 비밀번호</label>
				<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/>
				<div id="pwdAlert" class="form-span">* 특수문자는 8자 이상 16자리 이하의 영문/숫자/특수문자<br/>
													&nbsp;&nbsp;&nbsp;~!@#$%^&* 만 사용이 가능합니다.</div>
			</li>
			<li>
				<label for="pwd2">변경 비밀번호 확인</label>
				<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="변경 비밀번호 확인"/>
				<div class="alert alert-success form-span f_blue" id="alert-success">* 비밀번호가 일치합니다.</div>
				<div class="alert alert-danger form-span f_red" id="alert-danger">* 비밀번호가 일치하지 않습니다.</div>
			</li>
			<li>
				<label for="email">이메일</label>
				<input type="text" name="email01" id="email01" value="<%=emailData%>"/>
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
				<label for="name">성함 *</label>
				<input type="text" name="name" id="name" value="<%=dto.getName() %>" />
			</li>
			<li>
				<label for="phone">연락처*</label>
				<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요" value="<%=dto.getPhone()%>"/>
				<div id="phoneAlert" class="form-span">* 연락처는 '-' 없이 숫자만 입력해주세요.</div>
			
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
		<button type="submit" id="submit" class="btn-default">회원가입 하기</button>
	</form>
	</div>
	</div><!-- content 종료  -->


	<script>
	
	//========이메일선택시dataList 자동 선택======
		function init(){
            setComboValue("<%=dto.getEmail()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }


출처: https://all-record.tistory.com/117 [세상의 모든 기록]
		
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
	</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>

