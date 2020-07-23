<%@page import="java.util.List"%>
<%@page import="test.reserve.dto.ReserveDto"%>
<%@page import="test.reserve.dao.ReserveDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//예약한 사람의 아이디 
	String id=(String)session.getAttribute("id");	
	//파라미터로 입력 폼 값 가져오기
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String service=request.getParameter("service");
	String dogName=request.getParameter("dogName");
	String dogBreed=request.getParameter("dogBreed");
	int dogAge=Integer.parseInt(request.getParameter("dogAge"));
	String checkin=request.getParameter("checkin");
	String checkout=request.getParameter("checkout");
	String etc=request.getParameter("etc");
	
	//예약한 강아지를 회원가입할때 입력한 강아지가 맞는지 반려견이름, 종, 나이로 비교해서 그 강아지 번호 구하기
	MemberDto dto=new MemberDto();
	dto.setDname(dogName);
	dto.setBreed(dogBreed);
	dto.setDage(dogAge);
	MemberDto mdto=MemberDao.getInstance().getDogNum(dto);
	
	//예약테이블에에 입력할 정보
	ReserveDto rdto=new ReserveDto();
	rdto.setMember_id(id);
	rdto.setService(service);
	rdto.setCheckin(checkin);
	rdto.setCheckout(checkout);
	rdto.setEtc(etc);
	
	//예약 테이블에 예약 정보 넣기
	boolean isSuccess=ReserveDao.getInstance().insert(rdto, mdto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/reservation/reserve.jsp</title>
</head><body>

<script>
	<%if(isSuccess){ %>
		alert("예약되었습니다.");
		location.href="reserve_status.jsp";
	<%}else{ %>
		alert("예약에 실패했습니다. 강아지 이름, 견종, 나이가 회원가입시 입력한 값과 같은지 확인해주세요.");
		location.href="reserveform.jsp";
	<%}%>
</script>
</body>
</html>