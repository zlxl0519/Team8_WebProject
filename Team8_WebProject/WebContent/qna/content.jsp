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
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="60" rows="30" readonly><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
				<a href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
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