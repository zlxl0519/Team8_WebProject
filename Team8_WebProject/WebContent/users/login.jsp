<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id= request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	MemberDto dto=new MemberDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=MemberDao.getInstance().isValid(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<%if(isValid){ 
		session.setAttribute("id", id);%>
		<script>
			alert("로그인 되었습니다.");
			location.href="${pageContext.request.contextPath }/index.jsp";
		</script>
	<%} else{%>
		<script>
			alert("가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.");
			location.href="${pageContext.request.contextPath }/users/loginform.jsp";
		</script>
	<%} %>
</body>
</html>