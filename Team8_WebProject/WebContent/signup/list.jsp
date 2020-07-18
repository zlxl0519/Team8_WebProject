<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	List<MemberDto> list = MemberDao.getInstance().getList();
%>
	<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "회원목록 "; 
</script>
<%--회원 목록 페이지 입니다.--%>
	<div class="content">
	<h2>회원 목록</h2>
	<div class="table-wrap">
	
	
	<table >
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">연락처</th>
				<th scope="col">가입일</th>
				<th scope="col">반려견 이름</th>
				<th scope="col">반려견 나이</th>
				<th scope="col">반려견 견종</th>
				<th scope="col">반려견 무게</th>
				<th scope="col">반려견 성별</th>
				<th scope="col">중성화 유무</th>
				<th scope="col">기타사항</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp : list){ %>
			<tr>
				<td><%=tmp.getId() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getEmail() %></td>
				<td><%=tmp.getPhone() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><%=tmp.getDname() %></td>
				<td><%=tmp.getDage() %></td>
				<td><%=tmp.getBreed() %></td>
				<td><%=tmp.getWeight() %></td>
				<td><%=tmp.getGender() %></td>
				<td><%=tmp.getNeutral() %></td>
				<td><%=tmp.getMemo() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	</div><!-- table-wrap -->
	</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>