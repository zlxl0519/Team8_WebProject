<%@page import="test.reserve.dto.ReserveDto"%>
<%@page import="test.reserve.dao.ReserveDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    String id = (String)session.getAttribute("id");
    MemberDto dto=MemberDao.getInstance().getData(id);
	MemberDto dto2=MemberDao.getInstance().getPuppyData(id);
	ReserveDto dto3=ReserveDao.getInstance().getData(id);
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
	<h2>예약하기 </h2>
	<form action="reserve.jsp" method="post" id="reserveForm">
	<div class="form-ul-wrap">
		<ul>
			<li>
				<label>보호자명</label>
				<p><%=dto.getName() %></p>
			</li>
			<li>
				<label>연락처</label>
				<%=dto.getPhone() %> %>
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
				<p><%=dto3.getCheckin() %></p>
			</li>
			<li>
				<label>체크아웃</label>
				<p><%=dto3.getCheckout() %></p>
			</li>
			<li>
				<label>기타사항</label>
				<%=dto3.getEtc() %>
			</li>
		</ul>
		
		</div><!-- form-ul-wrap -->
		
		<button class="btn-default" type="submit" id="submit">예약하기</button>
	</form>
</div><!-- form-wrap -->
</div><!-- content -->


<jsp:include page="../include/footer.jsp"></jsp:include>