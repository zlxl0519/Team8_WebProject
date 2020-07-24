<%@page import="test.reserve.dto.ReserveDto"%>
<%@page import="test.reserve.dao.ReserveDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "예약현황"; 
</script>
<div class="content">
<div class="sub-nav">
	<h2>MyPage</h2>
	<div class="sub-nav-gnb">
		<ul>
			<li><a href="info.jsp">내 정보 보기 </a></li>
			<li class="active"><a href="reserve_status.jsp">예약현황</a></li>
			<li><a href="update_pwdokform.jsp">내 정보 수정 </a></li>
		</ul>
	</div><!-- sub-nav-gnb -->
</div><!-- sub-nav -->

<p>예약현황 페이지 입니다.</p>

</div><!-- content -->


<jsp:include page="../include/footer.jsp"></jsp:include>