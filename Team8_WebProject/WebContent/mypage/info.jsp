<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	MemberDto dto = MemberDao.getInstance().getData(id);
	MemberDto dto2 = MemberDao.getInstance().getPuppyData(id);
%>



<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amnug: Mypage-info"; 
</script>

<%--마이페이지-정보보기 mypage/info.jsp--%>
<!-- content -->
<div class="content">
	<div class="sub-nav">
		<h2>MyPage</h2>
		<div class="sub-nav-gnb">
			<ul>
				<li><a href="reserve_status.jsp">예약현황</a></li>
				<li class="active"><a href="info.jsp">내 정보 보기 </a></li>
				<li><a href="update_pwdokform.jsp">내 정보 수정 </a></li>
			</ul>
		</div><!-- sub-nav-gnb -->
	</div><!-- sub-nav -->
	<div class="form-wrap">
	
		<%-- 프로필사진  업로드 폼--%>
		<div class="form-ul-wrap mb0">
			<ul>
				<li class="profile-wrap bbn">
					<div class="profile-box">
						<div class="profile-img">
							<%if(dto.getProfile()==null){ %>
							<img id="profileImage"
								src="${pageContext.request.contextPath }/include/img/icon_user.png" />
							<%}else{ %>
							<img id="profileImage"
								src="${pageContext.request.contextPath }<%=dto.getProfile() %>" />
							<%} %>
						</div><!-- profile-img -->
					</div><!-- Profile-box -->
				</li><!-- profile-wrap -->
			</ul>
		</div><!-- form-ul-wrap -->
	
	
	
		<div class="form-ul-wrap">
			<ul>
	
				<li>
					<label for="id">아이디</label>
					<p><%=dto.getId()%></p>
				</li>
				<li>
					<label for="pwdnew">기존 비밀번호</label>
					<p><%=dto.getPwd()%></p>
				</li>
				<li>
					<label for="email">이메일</label>
					<p><%=dto.getEmail() %></p>
				</li>
				<li>
					<label for="name">성함</label>
					<p><%=dto.getName() %></p>
				</li>
				<li>
					<label for="phone">연락처</label>
					<p><%=dto.getPhone() %></p>
				</li>
				<li>
					<label for="">가입일</label>
					<p><%=dto.getRegdate() %></p>
				</li>
			</ul>
	
		</div>
		<!-- form-ul-wrap -->
	
		<div class="form-ul-wrap">
			<h2 class="mt20">반려견 정보</h2>
			<ul>
				<li>
					<label for="dname">반려견 이름</label> 
					<p><%=dto2.getDname() %></p>
				</li>
				<li>
					<label for="dage">반려견 나이</label>
					<p><%=dto2.getDage() %> 살</p>
				</li>
				<li>
					<label for="breed">반려견의 견종</label> 
						<p><%=dto2.getBreed() %></p>
					</li>
				<li>
						<label>반려견의 무게</label> 
						<p>
							<%if(dto2.getWeight().equals("0to4")){ %>
							0~4kg
							<%}else if(dto2.getWeight().equals("4to10")){ %>
							4~10kg
							<%}else if(dto2.getWeight().equals("10to25")){ %>
							10~25kg
							<%}else if(dto2.getWeight().equals("over25")){ %>
							25~kg
							<%} %>
						</p>
				</li>
				<li>
					<label>중성화 유무</label> 
						<p>
							<%if(dto2.getNeutral().equals("yes")){ %>
							 유
							<%}else if(dto2.getNeutral().equals("no")){ %>
							무
							<%}%>
						</p>
				</li>
				<li>
	
					<label>성별</label> 
					<p>
							<%if(dto2.getGender().equals("male")){ %>
							 남아
							<%}else if(dto2.getGender().equals("female")){ %>
							여아
							<%}%>
					</p>
				</li>
				<li>
					<label for="memo">기타사항</label>
					<pre><%=dto2.getMemo() %></pre>
					
				</li>
			</ul>
		</div>
		<!-- form-ul-wrap -->
	
		<a href="update_pwdokform.jsp" class="btn-default">개인정보 수정</a>
		<a href="javascript:deleteConfirm()" class="btn-default btn-gray">탈퇴</a>
	</div><!-- form-wrap -->
	

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
