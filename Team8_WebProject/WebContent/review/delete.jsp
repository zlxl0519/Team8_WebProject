<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = dao.getData(num);
	
	String writer = dto.getWriter();
	String id = (String)session.getAttribute("id");
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"잘못된 접근입니다!");
		return;
	}
	
	boolean isSuccess = QnaDao.getInstance().delete(num);

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
			alert("삭제되었습니다!");
			location.href = "qna_list.jsp";
		</script>
	<%} else{ %>
		<script>
			alert("삭제 실패!");
			location.href = "content.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>