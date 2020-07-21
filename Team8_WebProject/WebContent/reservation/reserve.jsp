<%@page import="test.reserve.dto.ReserveDto"%>
<%@page import="test.reserve.dao.ReserveDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//예약한 사람의 아이디 
	String id=(String)session.getAttribute("id");	
	//reserve form 에 입력한 것들
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String[] dogName=request.getParameterValues("dogName");
	String[] dogBreed=request.getParameterValues("dogBreed");
	String[] dogAge=request.getParameterValues("dogAge");
	//am_dogs 테이블에 삽입하기 위해 dogAge int 배열로 만들기
	int[] age=new int[dogAge.length];
	for(int i=0; i<dogAge.length; i++){
		try{
			age[i]=Integer.parseInt(dogAge[i]);
		}catch(NumberFormatException nfe){
			
		};
	}
	//reserve table 에 넣을 값들
	String service=request.getParameter("service");
	String checkin=request.getParameter("checkin");
	String checkout=request.getParameter("checkout");
	String etc=request.getParameter("etc");
	
	//입력한 강아지 정보를 강아지 주인의 id 값으로 넣기
	MemberDto dto=new MemberDto();
	for(int i=0; i<dogName.length; i++){
		dto.setDname(dogName[i]);
		dto.setBreed(dogBreed[i]);
		dto.setDage(age[i]);
	}
	dto.setId(id);
	boolean dogsisSuccess=MemberDao.getInstance().insertDog(dto);
	
	//reserve table에 입력한것 값 넣기
	//1. MemberDao 에 한명회원의 강아지정보를 불러오는 메소드 사용
	MemberDto Mdto=MemberDao.getInstance().getPuppyData(id);
	//2. ReseveDto 에  reserve table 에 insert 할 값들 넣기
	ReserveDto Rdto=new ReserveDto();
	Rdto.setMember_id(id);
	Rdto.setService(service);
	Rdto.setCheckin(checkin);
	Rdto.setCheckout(checkout);
	Rdto.setEtc(etc);
	//3. ReserveDao에 insert 하는 메소드에 사용
	boolean isSuccess=ReserveDao.getInstance().insert(Rdto, Mdto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/reservation/reserve.jsp</title>
</head><body>

<script>
	<%if(isSuccess && dogsisSuccess){ %>
		alert("예약되었습니다.");
		location.href="reserve_status.jsp";
	<%}else{ %>
		alert("예약에 실패했습니다.");
		location.href="reserveform.jsp";
	<%}%>
</script>
</body>
</html>