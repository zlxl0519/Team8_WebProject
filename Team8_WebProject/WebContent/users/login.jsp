
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//입력한 아이디, 비밀번호
	String id= request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//로그인 상태유지 checkbox값
	String remember=request.getParameter("remember");//체크했을때는 remember값이 안했을땐 null 값이 들어있다.
	
	//회원정보 MemberDto 에 담기
	MemberDto dto=new MemberDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//회원정보가 있는지 확인
	boolean isValid=MemberDao.getInstance().isValid(dto);
	
	//기존 DB의 사용자 아이디, 비밀번호
	MemberDto dto2=MemberDao.getInstance().getData(id);
	String dbId=dto2.getId();
	String dbPwd=dto2.getPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<%if(dbId.equals(id)){ %>
		<%if(isValid){ //로그인시 회원정보가 있다면
			session.setAttribute("id", id);%>
			<script>
				alert("로그인 되었습니다.");
				location.href="${pageContext.request.contextPath }/index.jsp";
			</script>
		<%}%>
		
	<%} %>
	
</body>
</html>