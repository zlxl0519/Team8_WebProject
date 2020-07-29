<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content admin">
	<div onClick="location.href ='../signup/list.jsp'">
		<span>
			<i class="fas fa-users"></i>
		</span>
		<p>회원 리스트</p>
	</div>
	<div onClick="location.href ='../gallery/admin/list_admin.jsp'">
		<span>
		<i class="fas fa-camera-retro"></i>
		</span>
		<p>
		amung 일상 갤러리 관리
		</p>
	</div>
	<div onClick="location.href ='../notice/notice_list.jsp'">
		<span>
		<i class="fas fa-edit"></i>
		</span>
		<p>amung 공지사항 관리</p>
	</div>
</div><!-- admin -->
<jsp:include page="../include/footer.jsp"></jsp:include>