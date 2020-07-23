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
	MemberDto dto2 = MemberDao.getInstance().getPuppyData(id);
	
	// @를 기준으로 문자열 추출
    String email = dto.getEmail();
    
    // @ 의 인덱스를 찾는다
    int idx = email.indexOf("@"); 
    
    // @ 앞부분을 추출
    // substring은 첫번째 지정한 인덱스는 포함하지 않는다.
    // 아래의 경우는 첫번째 문자열인 a 부터 추출된다.
    String mail1 = email.substring(0, idx);
    
    // 뒷부분을 추출
    // 아래 substring은 @ 바로 뒷부분인 n부터 추출된다.
    String mail2 = email.substring(idx+1);

	/* String[] */
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "회원 정보 수정"; 
</script>
<%--회원정보 수정 폼입니다.--%>
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
	
	<%-- 프로필사진  업로드 폼--%>
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
		<div class="form-ul-wrap mb0">
			<ul>
				<li class="profile-wrap bbn">
				<div class="profile-box">
				<label for="image">프로필 이미지</label>
					<div class="profile-img">
						<%if(dto.getProfile()==null){ %>
							<img id="profileImage" src="${pageContext.request.contextPath }/include/img/icon_user.png"/>
						<%}else{ %>
							<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile() %>"/>
						<%} %>
						
						
					</div><!-- profile-img -->
					
						<div class="profile-btn">
							<label for="image"><i class="fas fa-images"></i></label>
							<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
						</div>
						
					</div><!-- Profile-box -->
					
				</li><!-- profile-wrap -->
			</ul>
		</div><!-- form-ul-wrap -->
	</form>
	
	
	
	<%-- 나머지 정보 업로드 폼 --%>
	<form action="update.jsp" method="post" id="signup">
		<input type="hidden" name="profile" id="profile" />
		<div class="form-ul-wrap">
		<ul>
			
			<li>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" maxlength="30" value="<%=dto.getId()%>" disabled/>
				<span class="form-span">* 아이디는 변경이 불가합니다.</span>
			</li>
			<li>
				<label for="pwdnew">기존 비밀번호</label>
				<input type="text" name="pwdnew" id="pwdnew" maxlength="16" value="<%=dto.getPwd()%>" disabled/>
			</li>
			<li>
				<label for="pwd">변경 비밀번호</label>
				<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/>
				<div id="pwdAlert" class="form-span" style="margin-left : 103px;">* 특수문자는 8자 이상 16자리 이하의 영문/숫자/특수문자<br/>
													&nbsp;&nbsp;&nbsp;~!@#$%^&* 만 사용이 가능합니다.
				</div>
			</li>
			<li>
				<label for="pwd2">변경 비밀번호 확인</label>
				<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="비밀번호 입력 확인"/>
				<div class="alert alert-success form-span f_blue" id="alert-success"style="margin-left : 135px;">* 비밀번호가 일치합니다.</div>
				<div class="alert alert-danger form-span f_red" id="alert-danger"style="margin-left : 135px;">* 비밀번호가 일치하지 않습니다.</div>
			</li>
			<li class="updateform">
				<label for="email">이메일</label>
				<input type="text" name="email01" id="email01" value="<%=mail1 %>" />
				<span>&nbsp;&nbsp;@</span>
	            <input type="text" id="email02" name="email02" list="domains" placeholder="도메인입력/선택" value="<%=mail2 %>" />
	            <select id="domains" name="email02">
	            	<option value="">직접선택</option>
	                <option value="naver.com">naver.com</option>
	                <option value="daum.net">daum.net</option>
	                <option value="gmail.com">gmail.com</option>
	                <option value="kakao.com">kakao.com</option>
	            </select>
			</li>
			<li>
				<label for="name">성함</label>
				<input type="text" name="name" id="name" value="<%=dto.getName() %>"/>
			</li>
			<li>
				<label for="phone">연락처</label>
				<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"  value="<%=dto.getPhone() %>" />
				<div id="phoneAlert" class="form-span">* 연락처는 '-' 없이 숫자만 입력해주세요.</div>
			
			</li>
		</ul>
			
		</div>
		
		<div class="form-ul-wrap">
			<h2 class="mt20">반려견 정보</h2>
		<ul>
			<li>
				<label for="dname">반려견 이름</label>
					<input type="text" name="dname" id="dname" placeholder="반려견의 이름을 작성해주세요"
					value="<%=dto2.getDname() %>" />
			</li>
			<li>
				<label for="dage">반려견 나이</label>
				<input type="number" name="dage" id="dage" value="<%=dto2.getDage() %>" /><span>&nbsp;살</span>
			</li>
			<li>
				<label for="breed">반려견의 견종</label>
				<input type="text" name="breed" id="breed" placeholder="견종을 작성해주세요"  value="<%=dto2.getBreed() %>" />
			</li>
			<li>
				<fieldset>
					<legend>반려견 무게</legend>
						<%if(dto2.getWeight().equals("0to4")){ %>
							<input type="checkbox" name="weight" value="0to4" checked/>0~4kg
						<%}else{ %>
							<input type="checkbox" name="weight" value="0to4"/>0~4kg
						<%}%>
						
						<%if(dto2.getWeight().equals("4to10")){ %>
							<input type="checkbox" name="weight" value="4to10" checked/>4~10kg
						<%}else{ %>
							<input type="checkbox" name="weight" value="4to10"/>4~10kg
						<%}%>
						
						<%if(dto2.getWeight().equals("10~25kg")){ %>
							<input type="checkbox" name="weight" value="10to25" checked/>10~25kg
						<%}else{ %>
							<input type="checkbox" name="weight" value="10to25"/>10~25kg
						<%}%>
						
						<%if(dto2.getWeight().equals("over25")){ %>
							<input type="checkbox" name="weight" value="over25"  checked/>25~kg
						<%}else{ %>
							<input type="checkbox" name="weight" value="over25"/>25~kg
						<%}%>
				</fieldset>
			</li>
			<li>
				<fieldset>
					<legend>중성화 유무</legend>
					<%if(dto2.getNeutral().equals("yes")){ %>
							 <input type="radio" name="neutral" value="yes" checked/> 유
					<%}else{ %>
							<input type="radio" name="neutral" value="yes"/> 유
					<%}%>
					
					<%if(dto2.getNeutral().equals("no")){ %>
							<input type="radio" name="neutral" value="no" checked/> 무
					<%}else{ %>
							<input type="radio" name="neutral" value="no" /> 무
					<%}%>
				</fieldset>	
			</li>
			<li>
			
			<fieldset>
				<legend>성별선택</legend>
				<%if(dto2.getGender().equals("male")){ %>
					<input type="radio" name="gender" value="male" checked/> 남아		 
				<%}else{ %>
					<input type="radio" name="gender" value="male"/> 남아		
				<%}%>
				
				<%if(dto2.getGender().equals("female")){ %>
					<input type="radio" name="gender" value="female" checked /> 여아		 
				<%}else{ %>
					<input type="radio" name="gender" value="female" /> 여아		
				<%}%>
			</fieldset>
			</li>
			<li>
				<label for="memo">기타사항</label>
				<textarea name="memo" id="memo" cols="60" rows="10" placeholder="반려견 호텔링 시, 요청사항이나 주의해야하는 사항을 적어주세요"><%=dto2.getMemo() %></textarea>
			</li>
		</ul>	
		</div>	
		<button type="submit" id="submit" class="btn-default">수정하기</button>
	</form>
	</div>
	</div><!-- content 종료  -->
	
	<script src="${pageContext.request.contextPath }/include/js/jquery.form.min.js"></script>
	<script>
	
	
	
	
	//========= form 에 submit 이벤트가 일어 났을때 프로필 사진을 ajax 로 제출 하도록  ====================
		$("#profileForm").ajaxForm(function(data){
			//프로필 이미지를 업데이트 한다.
			$("#profileImage").attr("src", "${pageContext.request.contextPath }"+data.imageSrc);
			//회원정보 수정폼 전송될 때 같이 전송되도록 한다.
			$("#profile").val(data.imageSrc);
		});
	//이미지 파일을 선택했을때 change 이벤트가 일어난다.
	$("#image").on("change", function(){
		$("#profileForm").submit();//폼 강제 제출
	});
		
		
	var canUse = false;
	
	
	
	//이메일 입력방식 선택 
	$('#domains').change(function(){
		$("#domains option:selected").each(function () {
			if($(this).val()== '0'){ //직접입력일 경우 
				$("#email02").val(""); //값 초기화
				$("#email02").attr("disabled",false);//활성화 
				}else{ //직접입력이 아닐경우 
					$("#email02").val($(this).text()); //선택값 입력 
					$("#email02").attr("disabled",true); //비활성화 
					} }); });

	
	
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
	
		
	//=========아이디 영문/숫자 제한==============
		var enNumCheck = RegExp(/[^A-Za-z0-9]$/);
		$("#idAlert").hide();
		$("#id").keyup(function(){
			if(enNumCheck.test($("#id").val()) || $("#id").val().length < 5){
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
 	var enNumSpkCheck = RegExp(/[^A-Za-z0-9~!@#$%^&*]$/);

		$("#pwdAlert").hide();
		$("#pwd").keyup(function(){
			if(enNumSpkCheck.test($("#pwd").val()) || $("#pwd").val().length < 8){
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
			if($("#pwd").val() == " " || $("#pwd").val() != $("#pwd2").val()){
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
<jsp:include page="../include/footer.jsp"></jsp:include>
