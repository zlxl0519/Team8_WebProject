<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = new QnaDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("글이 수정 완료되었습니다!");
			location.href = "content.jsp?num=<%=num%>";
		</script>
	<%} else{ %>
		<script>
			alert("수정 실패!");
			location.href = "updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>