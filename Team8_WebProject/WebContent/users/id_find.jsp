<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--이메일로 아이디 찾기 --%>
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

<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
<div class="icon-wrap">
	<%if(id!=null){
		//아이디 찾기 성공시
	%>
		<i class="fas fa-lock-open"></i>
		 	<p class="form-span m0">
		 	회원가입 시 사용한 아이디는<br/>
		 	<strong><%=id %></strong>입니다.
		 	</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/loginform.jsp'" class="btn-default">로그인하러가기 </button>
		</div>
	<%}else{ %>
		<i class="fas fa-lock"></i>
		<p class="form-span m0">
		 	<strong>가입한 아이디가 존재하지않습니다.</strong>
		 	</p>
		<p></p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/idfind_form.jsp'" class="btn-default">돌아가기</button>
		</div>
	<%} %>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
