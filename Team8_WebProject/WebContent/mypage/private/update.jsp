<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	MemberDto dto = new MemberDto();
	MemberDto dto2 = new MemberDto();
	MemberDto dto3 = new MemberDto();
	MemberDao dao = MemberDao.getInstance();
	
	//사람
	String id = (String)session.getAttribute("id");
	String email = request.getParameter("email01")+"@"+request.getParameter("email02");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String profile = request.getParameter("profile");
	
	//강아지
	String dname = request.getParameter("dname");
	int dage = Integer.parseInt(request.getParameter("dage"));
	String breed = request.getParameter("breed");
	String weight = request.getParameter("weight");
	String neutral = request.getParameter("neutral");
	String gender = request.getParameter("gender");
	String memo = request.getParameter("memo");
	
	
	
	//사람
	dto.setId(id);
	dto.setEmail(email);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setProfile(profile);
	
	
	//사람 비밀번호
	String pwd = request.getParameter("pwd");
	String pwdnew = request.getParameter("pwdnew");
	if(pwdnew.equals("")){//비밀번호 미수정시
	    dto.setPwd(pwd);
	}else{//비밀번호 수정시
		dto.setPwd(pwdnew);
	}

	
	//강아지
	dto.setDname(dname);
	dto.setDage(dage);
	dto.setBreed(breed);
	dto.setWeight(weight);
	dto.setNeutral(neutral);
	dto.setGender(gender);
	dto.setMemo(memo);
	dto.setMember_id(id);
	
	
	boolean isSuccess1 = dao.updateHuman(dto);
	boolean isSuccess2 = dao.updateDog(dto);
	
	
	
	
%>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="content">

	<div class="icon-wrap">
		<% if(isSuccess1 && isSuccess2){%>
		<i class="fas fa-lock-open"></i>
		<p class="form-span m20">
			<strong>수정이 완료되었습니다.</strong>
		</p>
		<a href="info.jsp" class="btn-default">확인</a>
		<% }else{%>
		<i class="fas fa-lock"></i>
		<p class="form-span m20">
			<strong>수정에 실패했습니다.</strong>
		</p>
		<a href="updateform.jsp" class="btn-default">확인</a>
		<% }%>

		
	</div>
</div>
<jsp:include page="../../include/footer.jsp"></jsp:include>