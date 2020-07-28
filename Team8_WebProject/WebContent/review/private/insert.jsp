<%@page import="dao.ReviewDao"%>
<%@page import="dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 인코딩 설정
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("id");
	String profile = ReviewDao.getInstance().selectProfile(id);
	ReviewDto dto = new ReviewDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(id);
	dto.setProfile(profile);
	boolean isSuccess = ReviewDao.getInstance().insert(dto);
%>
<jsp:include page="../../include/header.jsp"></jsp:include>
	<div class="content">
		<div class="icon-wrap">
			<% if(isSuccess){%>
			<i class="fas fa-feather-alt"></i>
			<p class="form-span m20">
				<strong>작성하신 글이 저장되었습니다.</strong>
			</p>
			<a href="../rev_list.jsp" class="btn-a">목록으로</a>
			<% }else{%>
			<i class="fas fa-feather-alt"></i>
			<p class="form-span m20">
				<strong>글 작성에 실패하였습니다.</strong>
			</p>
			<a href="insertform.jsp" class="btn-a">다시 작성</a>
			<% }%>
		</div>
	</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>	