<%@page import="test.member.dao.MemberDao"%>
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
	
	MemberDto dto = new MemberDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setDname(dname);
	dto.setDage(dage);
	dto.setBreed(breed);
	dto.setWeight(weight);
	dto.setNeutral(neutral);
	dto.setGender(gender);
	dto.setMemo(memo);
	
	boolean isSuccess1 = MemberDao.getInstance().insertHuman(dto);
	boolean isSuccess2 = MemberDao.getInstance().insertDog(dto);
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