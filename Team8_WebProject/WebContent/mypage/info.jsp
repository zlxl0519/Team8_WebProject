<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	MemberDto dto = MemberDao.getInstance().getData(id);
%>



<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amnug: Mypage-info"; 
	
</script>
<%-- --%>
<div class="content">
<div class="sub-nav">
	<h2>MyPage</h2>
	<div class="sub-nav-gnb">
		<ul>
			<li><a href="">내 정보 보기 </a></li>
			<li><a href="">예약현황</a></li>
			<li><a href="">내 정보 수정 </a></li>
		</ul>
	</div>
</div>
	<div class="form-table-wrap mb20">
	
		<table>
			<tr>
				<th>아이디</th>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><%=dto.getPwd() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail()%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%=dto.getPhone()%></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
		</table>

	</div><!-- table-wrap -->
	<a href="update_pwdok.jsp" class="btn-default">개인정보 수정</a>
	<a href="javascript:deleteConfirm()"class="btn-default btn-gray">탈퇴</a>
</div><!-- content -->
<script>
function deleteConfirm(){
	
	var isDelete = confirm("탈퇴하시겠습니까?");
	if (isDelete) {
		location.href = "${pageContext.request.contextPath }/mypage/delete.jsp";
	}else {
		return false
	}
}
</script>

<jsp:include page="../include/footer.jsp"></jsp:include>



</body>
</html>