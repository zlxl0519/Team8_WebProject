
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	MemberDto dto=new MemberDto();
	dto.setId(id);
	dto.setName(name);
	dto.setPhone(phone);
	String pwd=MemberDao.getInstance().pwd_search(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_find.jsp</title>
</head>
<body>
	<%if(pwd!=null){ //비밀번호를 찾았다면%>
		<p>회원님의 비밀번호는?</p>
		<p><strong><%=pwd %></strong>입니다.</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/loginform.jsp'">로그인 화면으로 돌아가기</button>
		</div>
	<%}else{ %>
		<p>비밀번호 찾기를 실패하셨습니다.</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/pwdfind_form.jsp'">돌아가기</button>
		</div>
	<%} %>
</body>
</html>