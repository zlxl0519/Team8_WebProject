<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = dao.getData(num);
	String id = dto.getId();
	String title = dto.getTitle();
	String content = dto.getContent();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input type="hidden" name="id" value="<%=dto.getId() %>" />
		<div class="form-group">
			<label for="num">글번호</label>
			<input type="text" class="form-control" id="num" value="<%=dto.getNum() %>" disabled /><br/>
			<label for="id">작성자</label>
			<input type="text" class="form-control" id="id" value="<%=dto.getId() %>" disabled /><br/>
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" value="<%=dto.getTitle() %>" /><br/>
			<label for="content">글내용</label>
			<textarea name="content" id="content" cols="60" rows="30"><%=dto.getContent() %></textarea><br>
		</div>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>