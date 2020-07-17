<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name2=request.getParameter("name2");
	String phone=request.getParameter("phone");
	MemberDto dto=new MemberDto();
	dto.setName(name2);
	dto.setPhone(phone);
	String id= MemberDao.getInstance().id_search2(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/id_find2.jsp</title>
</head>
<body>
	<%if(id!=null){ //아이디 찾기 성공시%>
		<p>회원가입 시 사용한 아이디는 <strong><%=id %></strong> 입니다.</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/loginform.jsp'">로그인 화면으로 돌아가기</button>
		</div>
	<%}else{ %>
		<p>가입한 아이디가 존재하지 않습니다.</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/idfind_form.jsp'">돌아가기</button>
		</div>
	<%} %>
</body>
</html>