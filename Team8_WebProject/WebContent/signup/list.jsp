<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	List<MemberDto> list = MemberDao.getInstance().getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp : list){ %>
			<tr>
				<td><%=tmp.getId() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getEmail() %></td>
				<td><%=tmp.getPhone() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>