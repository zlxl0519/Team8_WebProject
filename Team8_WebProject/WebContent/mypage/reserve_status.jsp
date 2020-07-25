<%@page import="test.reserve.dto.ReserveDto"%>
<%@page import="test.reserve.dao.ReserveDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    String id = (String)session.getAttribute("id");
   //사람 정보 
    MemberDto dto=MemberDao.getInstance().getData(id);
   //개 정보 
	MemberDto dto2=MemberDao.getInstance().getPuppyData(id);
   //예약 정보 
	ReserveDto dto3=ReserveDao.getInstance().getData(id);
   
   
	// - 를 기준으로 문자열 추출
    String checkin = dto3.getCheckin();
    String checkout = dto3.getCheckout();
    String regdate = dto.getRegdate();
    
   // split()을 이용해 '-'를 기준으로 문자열을 자른다.
   // split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
   String date[] = checkin.split("-");
   String date2[] = checkout.split("-");
   String date3[] = regdate.split("-");

   %>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "예약현황"; 
</script>
<div class="content">
<div class="sub-nav">
	<h2>MyPage</h2>
	<div class="sub-nav-gnb">
		<ul>
			<li class="active"><a href="reserve_status.jsp">예약현황</a></li>
			<li><a href="info.jsp">내 정보 보기 </a></li>
			<li><a href="update_pwdokform.jsp">내 정보 수정 </a></li>
		</ul>
	</div><!-- sub-nav-gnb -->
</div><!-- sub-nav -->

<div class="form-wrap">
	<div class="form-ul-wrap">
		<ul>
			<li>
				<label>보호자명</label>
				<p><%=dto.getName() %></p>
			</li>
			<li>
				<label>연락처</label>
				<p><%=dto.getPhone() %></p>
			</li>
			<li>
				<label>희망서비스</label>
				<p><%=dto3.getService() %></p>
			</li>
			<li>
				<label>반려견 이름</label>
				<p><%=dto2.getDname() %></p>
			</li>
			<li>
				<label>반려견종</label>
				<p><%=dto2.getBreed() %></p>		
			</li>
			<li>
				<label>반려견나이</label>
				<p><%=dto2.getDage() %></p>
			</li>
			<li>
				<label>체크인</label>
				<p>
					<%=date[0] %> 년 
					<%=date[1] %> 월
					<%=date[2] %> 일 
				</p>
			</li>
			<li>
				<label>체크아웃</label>
				<p>
					<%=date2[0] %> 년 
					<%=date2[1] %> 월
					<%=date2[2] %> 일 
				
				</p>
			</li>
			<li>
				<label>기타사항</label>
				<pre><%=dto3.getEtc() %></pre>
			</li>
		</ul>
		
		</div><!-- form-ul-wrap -->
</div><!-- form-wrap -->
</div><!-- content -->


<jsp:include page="../include/footer.jsp"></jsp:include>