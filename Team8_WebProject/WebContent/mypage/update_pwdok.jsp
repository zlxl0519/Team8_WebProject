
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String id= (String)session.getAttribute("id");
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
<title>/update_pwdok.jsp</title>
</head>
<body>
	<%if(isValid){ 
		session.setAttribute("id", id);%>
		<script>
			alert("비밀번호가 확인되었습니다.");
			location.href="updateform.jsp";
		</script>
	<%} else{%>
		<script>
			alert("잘못된 비밀번호 입니다.");
			location.href="update_pwdokform.jsp";
		</script>
	<%} %>
</body>
</html>