<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idSession=(String)session.getAttribute("id");
	MemberDto dto=MemberDao.getInstance().getData(idSession);
	
	
%>
<jsp:include page="../../include/header.jsp"></jsp:include>

<div class="content">
	<div class="form-wrap">
		

	<div class="icon-wrap">	
		<i class="fas fa-lock"></i>
		 	<p class="form-span m0">
		 	<strong>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</strong>
		 	</p>
		</div>
	
		
	<form name="update_pwdokform" action="update_pwdok.jsp" method="post" onsubmit="return checkValue()">
		
		<div class="form-ul-wrap users-wrap users-find-wrap">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" id="id" value="<%=idSession %>" disabled/> <br />
			</li>
			<li>
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd" name="pwd" />
			</li>
		</ul>
		
		<button type="submit" class="btn-default mt20 w100">확인</button>
		</div>
		
	</form>
	</div><!-- form-wrap -->
</div><!-- content -->
<script>
	function checkValue(){
		if(!document.update_pwdokform.pwd.value){
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>


<jsp:include page="../../include/footer.jsp"></jsp:include>