<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content mt30">
		<a href="../signup/list.jsp" class="btn-a btn-default"><i class="fas fa-users"></i>회원 리스트 </a>
		<a href="../gallery/list_admin.jsp" class="btn-a btn-default btn-gray"><i class="fas fa-camera-retro"></i>amung 일상 갤러리 관리</a>
		<a href="../notice/notice_list.jsp" class="btn-a btn-default btn-y"><i class="fas fa-edit f_ye"></i>amung 공지사항 관리</a>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>