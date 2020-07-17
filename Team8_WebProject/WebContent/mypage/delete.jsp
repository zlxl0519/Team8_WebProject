<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	MemberDao.getInstance().delete(id);
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
</head>
<body>
<div class="container">
	<script>
		alert("<%=id %> 님 탈퇴 처리 되었습니다.")
		location.href="${pageContext.request.contextPath }/index.jsp";
	</script>
</div>
</body>
</html>