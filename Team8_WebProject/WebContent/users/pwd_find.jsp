
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
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
 	<div class="icon-wrap">
 		<%if(pwd!=null){ //비밀번호를 찾았다면%>
 		<i class="fas fa-lock-open"></i>
		 	<p class="form-span m0">
		 	회원님이 설정한 비밀번호는<br/>
		 	<strong><%=pwd %></strong>입니다.
		 	</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/loginform.jsp'" class="btn-default">로그인하러 가기</button>
		</div>
	<%}else{ %>
	<i class="fas fa-lock"></i>
		<p class="form-span m0">
		<strong>비밀번호 찾기를 실패하셨습니다.</strong>
		</p>
		<div>
			<button onclick="location.href='${pageContext.request.contextPath }/users/pwdfind_form.jsp'" class="btn-default">돌아가기</button>
		</div>
	<%} %>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>