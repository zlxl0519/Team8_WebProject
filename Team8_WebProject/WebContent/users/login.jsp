
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
	
	//로그인 상태유지 체크했을때
	if(remember!=null){
		Cookie idCook=new Cookie("savedId", id);
		//저장시간 정하기
		idCook.setMaxAge(60*60*24);
		//응답하는 변수에 저장
		response.addCookie(idCook);
		
		Cookie pwdCook=new Cookie("savedPwd", pwd);
		pwdCook.setMaxAge(60*60*24);
		response.addCookie(pwdCook);
	}else{// 체크 안했을때는 쿠키에서 삭제한다.
		Cookie idCook=new Cookie("savedId", id);
		//저장시간 정하기
		idCook.setMaxAge(0);// 삭제하기 위해 0으로 한다.
		//응답하는 변수에 저장
		response.addCookie(idCook);
		
		Cookie pwdCook=new Cookie("savedPwd", pwd);
		pwdCook.setMaxAge(0);
		response.addCookie(pwdCook);
	}
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