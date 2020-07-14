<%@page import="test.Dogs.dao.DogsDao"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.Dogs.dto.DogsDto"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email01")+"@"+request.getParameter("email02");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String dname = request.getParameter("dname");
	int dage = Integer.parseInt(request.getParameter("dage"));
	String breed = request.getParameter("breed");
	String weight = request.getParameter("weight");
	String neutral = request.getParameter("neutral");
	String gender = request.getParameter("gender");
	String memo = request.getParameter("memo");
	
	MemberDto dto1 = new MemberDto();
	dto1.setId(id);
	dto1.setPwd(pwd);
	dto1.setEmail(email);
	dto1.setName(name);
	dto1.setPhone(phone);
	
	DogsDto dto2 = new DogsDto(); 
	dto2.setId(id);
	dto2.setDname(dname);
	dto2.setDage(dage);
	dto2.setBreed(breed);
	dto2.setBreed(breed);
	dto2.setWeight(weight);
	dto2.setNeutral(neutral);
	dto2.setGender(gender);
	dto2.setMemo(memo);
	
	boolean isSuccess1 = MemberDao.getInstance().insert(dto1);
	boolean isSuccess2 = DogsDao.getInstance().insert(dto2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(isSuccess1 && isSuccess2){%>
		<p>회원가입이 완료되었습니다. <a href="signup_form.jsp">확인</a></p>
	<% }else{%>
		<p>회원가입을 실패했습니다. <a href="signup_form.jsp">확인</a></p>
	<% }%>
</body>
</html>