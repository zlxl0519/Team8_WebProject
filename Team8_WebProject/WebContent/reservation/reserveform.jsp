<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//아이디 값 불러오기
	String id=(String)session.getAttribute("id");
	//한사람의 회원정보 불러오기
	MemberDto dto=MemberDao.getInstance().getData(id);
	//한사람 회원의 강아지 정보 불러오기
	MemberDto dtoPuppy=MemberDao.getInstance().getPuppyData(id);
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<%--예약페이지

--%>
<div class="content">
<div class="form-wrap">
	<h2>예약하기 </h2>
	<form action="reserve.jsp" method="post" id="reserveForm">
	<div class="form-ul-wrap">
		<ul>
			<li>
				<label for="name">보호자명</label>
				<input type="text" value="<%=dto.getName() %>" name="name" id="name" disabled/>
			</li>
			<li>
				<label for="phone">연락처</label>
				<%--연락처가 번호만 들어가도록 제한한다. jquery 사용 --%>
				<input type="text" value="<%=dto.getPhone() %>" name="phone" id="phone" maxlength="11" placeholder="'-'을 제외한 휴대폰번호를 입력해 주세요" disabled/>
			
			</li>
			<li class="bbn">
				<label for="service">희망서비스</label>
				<select name="service" id="service">
					<option value="">서비스 선택</option>
					<option value="호텔&데이케어">호텔&amp;데이케어</option>
					<option value="독파크">독파크</option>
					<option value="스페셜 케어">스페셜 케어</option>
				</select>
			</li>
		</ul>
		<div id="dogInput">
		
		
			<ul id="TextBoxDiv">
				<li>
					<label>
						반려견 이름
						<input type="text" value="<%=dtoPuppy.getDname() %>" name="dogName" id="dogName0" disabled/>
					</label>
				</li>
				<li>
					<label>
						반려견종
						<input type="text" value="<%=dtoPuppy.getBreed() %>" name="dogBreed" id="dogBreed0" disabled/>
					</label>
							
				</li>
				<li class="bbn">
					<label>
						반려견나이
						<input type="text" value="<%=dtoPuppy.getDage() %>" name="dogAge" id="dogAge0" disabled/>
					</label>
					<button type="button" id="addBtn">+</button>
					<button type="button" id="removeBtn"class="btn-gray">-</button>
				</li>
			</ul>
		</div>
		<ul>
			<li>
				<label for="checkin">체크인</label>
				<input type="date" name="checkin" id="checkin" placeholder="MM/DD/YYYY" />
			</li>
			<li>
				<label for="checkout">체크아웃</label>
				<input type="date" name="checkout" id="checkout" placeholder="MM/DD/YYYY" />
			</li>
			<li>
				<label for="etc">기타사항</label>
				<textarea name="etc" id="etc" cols="30" rows="10" 
			     placeholder="효과적인 서비스 추천을 위해 반려견 이름, 중성화 여부, 문제행동 등 자세한사항을 작성해 주세요. 그리고 추가한 강아지의 정보도 입력해주세요"></textarea>
		
			</li>
		</ul>
		
		</div><!-- form-ul-wrap -->
		
		<button class="btn-default" type="submit" id="submit">예약하기</button>
	</form>
</div><!-- form-wrap -->
</div><!--content -->
<script>
	//연락처 입력칸에 번호만 입력되도록한다. 
	$("#phone2").on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	//반려견이름, 반려견종, 반려견 나이 입력칸  추가/ 삭제 하는 기능
	$(document).ready(function(){
		var counter = 0;
		 //입력칸 추가하기
		$("#addBtn").on("click", function(){
			//카운터 1 증가 
			counter++;
			var newTextBoxDiv = $(document.createElement('ul')).attr("id", 'TextBoxDiv'+counter);
			var str="<li><label>반려견이름<input type='text' name='dogName' id='dogName"+counter+"'/></label></li>"
			var str2="<li><label> 반려견종<input type='text' name='dogBreed' id='dogBreed"+counter+"'/></label></li>";
			var str3="<li class='bbn'><label>반려견나이<input type='text' name='dogAge' id='dogAge"+counter+"' /></label></li>"
			newTextBoxDiv.after().html(str+str2+str3);
			newTextBoxDiv.appendTo("#dogInput");
		
		});
		//입력칸 삭제하기
		$("#removeBtn").on("click", function(){
			if(counter>=1){
				//현재 카운터 삭제 
				$("#TextBoxDiv"+counter).remove();
				//카운터 1 감소 시키기
				counter--;
			}
		});
	});
	
		
		//반려견이름, 반려견종, 반려견나이, 체크인, 체크아웃 입력 안했을시 폼전송 막기
		$("#reserveForm").on("submit", function(){
			if($("#dogName"+counter+"").val()==""){
				alert("반려견 이름을 입력해주세요");
				$("#dogName"+counter+"").focus();
				return false;
			
			}else if($("#dogBreed"+counter+"").val()==""){
				alert("반려견종을 입력해주세요");
				$("#dogBreed"+counter+"").focus();
				return false;
			
			}else if($("#dogAge"+counter+"").val()==""){
				alert("반려견 나이를 입력해주세요");
				$("#dogAge"+counter+"").focus();
				return false;
			
			}else if($("#checkin").val()==""){
				alert("체크인 날짜를 입력해주세요");
				$("#checkin").focus();
				return false;
			
			}else if($("#checkout").val()==""){
				alert("체크아웃 날짜를 입력해주세요");
				$("#checkout").focus();
				return false;
			}
		});

	
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>