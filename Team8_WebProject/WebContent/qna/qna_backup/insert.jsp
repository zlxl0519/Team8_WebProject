<%@page import="dao.QnaDao"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 인코딩 설정
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("id");
	QnaDto dto = new QnaDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(id);
	boolean isSuccess = QnaDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Question</title>
</head>
<body>

	<div class="content">
		<%if(isSuccess){ %>
			<p>작성하신 글이 저장되었습니다.</p>
			<a href="qna_list.jsp">목록으로</a>
			<a href="content.jsp">작성한 글 확인</a>
		<%}else{ %>
			<p>글 작성에 실패했습니다.</p>
			<a href="insertform.jsp">다시 작성</a>
		<%} %>
	</div>

</body>
</html>