<%@page import="dao.QnaDao"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = dao.getData(num);
	dao.viewCount(num);
	//세션에서 아이디 얻어오기
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
	<h1>QnA 게시판</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getHit() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="60" rows="30" readonly><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td>
			<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
			<%if(dto.getWriter().equals(id)){ %>
				<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
				<a href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
			<%} %>
				<a href="qna_list.jsp">목록</a>
			</td>
		</tr>		
	</table>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>

<script>
	function deleteConfirm(num){
		var isDelete = confirm(num+"번 글을 삭제하시겠습니까?");
		  if(isDelete){
	            location.href="delete.jsp?num="+num;
		  }
	}
</script>

</body>
</html>