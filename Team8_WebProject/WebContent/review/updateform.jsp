<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = dao.getData(num);
	String writer = dto.getWriter();
	String title = dto.getTitle();
	String content = dto.getContent();
	
	//로그인 된 아이디와 글 작성자가 같을 때에만 수정할 수 있도록
	String swriter = (String)session.getAttribute("id");
	if(!writer.equals(swriter)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"잘못된 접근입니다!");
		return;
	}
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
	<div class="form-wrap">
		<form action="update.jsp" method="post">
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<input type="hidden" name="id" value="<%=dto.getWriter() %>" />
			<div class="form-group">
				<label for="num">글번호</label>
				<input type="text" class="form-control" id="num" value="<%=dto.getNum() %>" disabled /><br/>
				<label for="id">작성자</label>
				<input type="text" class="form-control" id="id" value="<%=dto.getWriter() %>" disabled /><br/>
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" id="title" value="<%=dto.getTitle() %>" /><br/>
				<label for="content">글내용</label>
				<textarea name="content" id="content" cols="40" rows="20"><%=dto.getContent() %></textarea><br>
			</div>
			<button type="submit">등록</button>
		</form>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>