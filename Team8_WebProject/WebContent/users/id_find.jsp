<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String email_1=request.getParameter("email_1");
	String email_2=request.getParameter("email_2");
	String selectEmail=request.getParameter("selectEmail");
	
	if(selectEmail.equals("etc")){
		email_1=email_1+"@"+email_2;
	}else{
		email_1=email_1+"@"+selectEmail;
	}
	
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setEmail(email_1);
	String id=MemberDao.getInstance().id_search(dto);//아이디를 디비에서 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/id_find.jsp</title>
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