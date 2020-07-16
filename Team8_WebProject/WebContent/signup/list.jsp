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
<title>회원 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="content">
	<h1>회원 목록</h1>
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align : center;">
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">연락처</th>
				<th scope="col">가입일</th>
				<th scope="col">반려견 이름</th>
				<th scope="col">반려견 나이</th>
				<th scope="col">반려견 견종</th>
				<th scope="col">반려견 무게</th>
				<th scope="col">반려견 성별</th>
				<th scope="col">중성화 유무</th>
				<th scope="col">기타사항</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp : list){ %>
			<tr style="text-align: center;">
				<td scope="row"><%=tmp.getId() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getEmail() %></td>
				<td><%=tmp.getPhone() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><%=tmp.getDname() %></td>
				<td><%=tmp.getDage() %></td>
				<td><%=tmp.getBreed() %></td>
				<td><%=tmp.getWeight() %></td>
				<td><%=tmp.getGender() %></td>
				<td><%=tmp.getNeutral() %></td>
				<td><%=tmp.getMemo() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	</div>
</body>
</html>
<jsp:include page="../include/footer.jsp"></jsp:include>