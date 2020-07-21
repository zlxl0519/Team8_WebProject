<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	MemberDto dto=MemberDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script>
	function checkValue(){
		if(!document.update_pwdokform.pwd.value){
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>
</head>
<body>
<div class="container">
	<h1>비밀번호 확인</h1>
	<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</p>
	<form name="update_pwdokform" action="pwd_ok.jsp" method="post" onsubmit="return checkValue()">
		<label for="id">아이디</label>
		<input type="text" id="id" value="<%=dto.getId() %>" disabled/>
		<label for="pwd">비밀번호</label>
		<input type="text" id="pwd" name="pwd_ok" />
		<button type="submit">확인</button>
	</form>
</div>
</body>
</html>