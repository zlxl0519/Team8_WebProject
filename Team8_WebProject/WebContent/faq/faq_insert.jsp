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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Question</title>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="content">
		<%if(isSuccess){ %>
			<p>작성하신 글이 저장되었습니다.</p>
			<a href="faq_main.jsp">목록으로</a>
		<%}else{ %>
			<p>글 작성에 실패했습니다.</p>
			<a href="faq_insertform.jsp">다시 작성</a>
		<%} %>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>	
</body>
</html>