<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amung's QnA</title>
</head>
<body>
<%
	QnaDao dao = QnaDao.getInstance();
	List<QnaDto> list = dao.getList();
%>
<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="content">
		<h1>QnA 게시판</h1>	
		<h3>문의사항이 있다면 글 남겨주세요~^^</h3>
		<table>
			<thead>
				<tr>
					<th> 글번호 </th>
					<th> 제목 </th>
					<th> 작성자 </th>
					<th> 작성일 </th>
					<th> 조회수 </th>
				</tr>
			</thead>
			<tbody>
				<% for(QnaDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><a href="content.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getId() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td><%=tmp.getHit() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<a href="insertform.jsp"><button>작성하기</button></a>
	</div>
	
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>