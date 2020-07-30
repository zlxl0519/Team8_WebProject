<%@page import="dao.FaqDao"%>
<%@page import="dto.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 인코딩 설정
	request.setCharacterEncoding("utf-8");
	String qst = request.getParameter("qst");
	String ans = request.getParameter("ans");

	FaqDto dto = new FaqDto();
	dto.setQst(qst);
	dto.setAns(ans);

	boolean isSuccess = FaqDao.getInstance().insert(dto);
%>
<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="content">
	<div class="icon-wrap">
		<%if(isSuccess){ %>
			<i class="fas fa-edit"></i>
			<p class="form-span m20">
				<strong>작성하신 글이 저장되었습니다</strong>
			</p>
		<a href="faq_main.jsp" class="btn-default">목록</a>
		<%}else{ %>
			<i class="fas fa-edit"></i>
			<p class="form-span m20">
				<strong>글 작성에 실패했습니다</strong>
			</p>
			<a href="faq_insertform.jsp" class="btn-default">다시 작성</a>
		<%} %>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>	