<%@page import="java.util.Date"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//아이디 값 불러오기
	String id=(String)session.getAttribute("id");
	//한사람의 회원정보 불러오기
	MemberDto dto=MemberDao.getInstance().getData(id);
	
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
				<input type="hidden" name="name" value="<%=dto.getName() %>"/>
				<input type="text" value="<%=dto.getName() %>" name="name" id="name" disabled/>
			</li>
			<li>
				<label for="phone">연락처</label>
				<input type="hidden" name="phone" value="<%=dto.getPhone() %>" />
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
						<input type="text"  name="dogName" id="dogName" />
					</label>
				</li>
				<li>
					<label>
						반려견종
						<input type="text" name="dogBreed" id="dogBreed" />
					</label>
							
				</li>
				<li class="bbn">
					<label>
						반려견나이
						<input type="text" name="dogAge" id="dogAge" />
					</label>
				</li>
			</ul>
		</div>
		<ul>
			<li>
				<label for="checkin">체크인</label>
				<input type="text" name="checkin" id="checkin" placeholder="YYYY/MM/DD" />
			</li>
			<li>
				<label for="checkout">체크아웃</label>
				<input type="text" name="checkout" id="checkout" placeholder="YYYY/MM/DD" />
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
	
		
	//반려견이름, 반려견종, 반려견나이, 체크인, 체크아웃 입력 안했을시 폼전송 막기
	$("#reserveForm").on("submit", function(){
		if($("#dogName").val()==""){
			alert("반려견 이름을 입력해주세요");
			$("#dogName"+counter+"").focus();
			return false;
		
		}else if($("#dogBreed").val()==""){
			alert("반려견종을 입력해주세요");
			$("#dogBreed"+counter+"").focus();
			return false;
		
		}else if($("#dogAge").val()==""){
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

	$(function(){
		$("#checkin").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			changeYear:true, // 달력 년도 select 박스로 선택하게 하기
			changeMonth:true, // 달력 월 select 박스로 선택하게 하기
			showOn:"both", //버튼클릭하거나 포커스가 가면 달력이 나온다.
			buttonImage:"http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly:true,
			buttonText:"날짜 선택"
		});
		
		$("#checkout").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			changeYear:true, // 달력 년도 select 박스로 선택하게 하기
			changeMonth:true, // 달력 월 select 박스로 선택하게 하기
			showOn:"both", //버튼클릭하거나 포커스가 가면 달력이 나온다.
			buttonImage:"http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly:true,
			buttonText:"날짜 선택"		
		});
	});
	
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>