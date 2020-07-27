<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
	<div>
		<a href="../signup/list.jsp"><i class="fas fa-users"></i>회원 리스트 </a>
	</div>
	<div>
		<a href="../gallary/list_admin.jsp"><i class="fas fa-camera-retro"></i>amung 일상 갤러리 관리</a>
	</div>
	<div>
		<a href="../gallary/list_admin.jsp"><i class="fas fa-edit"></i>amung 공지사항 관리</a>
	</div>
	
	
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>