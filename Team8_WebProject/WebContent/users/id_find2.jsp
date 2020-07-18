<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--연락처로 아이디 찾기  --%>
    
<%
	request.setCharacterEncoding("utf-8");
	String name2=request.getParameter("name2");
	String phone=request.getParameter("phone");
	MemberDto dto=new MemberDto();
	dto.setName(name2);
	dto.setPhone(phone);
	String id= MemberDao.getInstance().id_search2(dto);
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
