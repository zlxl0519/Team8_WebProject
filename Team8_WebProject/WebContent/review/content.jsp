<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = dao.getData(num);
	//세션에서 아이디 얻어오기
	String id = (String)session.getAttribute("id");
	if(id==null){
		id="";
	}
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content center">
<h3 class="review"><strong>후기</strong>를 자세히 살펴보아요! <i class="fas fa-comment-dots"></i></h3>

<div class="content-review">
<%if(dto.getPrevNum()!=0){ %>
	<a href="content.jsp?num=<%=dto.getPrevNum() %>" class="review-arrow"><i class="fas fa-chevron-left"></i></a>
<%} %>
	<ul class="review-ul">
		<li>
			<div class="review-wrap">
			<div class="review-recommand">
			</div>
			<span class="review-date">
					<%
					// - 를 기준으로 문자열 추출
				    String regdate = dto.getRegdate();
					String date[] = regdate.split("/");
					%>
					
					<%=date[0] %>년 
					<%=date[1] %>월
					<%=date[2] %>일 
					</span>
				<div class="review-wrap-users">
					<div class="review-profile">
					<%if(dto.getProfile() != null) {%>
						<img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile() %>"/>
					<%}else{ %>
						<img id="profileImage" src="${pageContext.request.contextPath}/include/img/icon_user.png"/>
					<%} %>
					</div>
					<div class="review-users">
					<p>
					<%if(dto.getWriter() !=null){%>
						<%=dto.getWriter() %>
					<%}else{ %>
						익명의 리뷰어
					<%} %>
					</p>
					<span><%=dto.getTitle() %> <br/></span>
					</div>
				</div><!-- review-wrap-users -->
				<div class="c-review-wrap-con">
					<pre><%=dto.getContent() %></pre>
				</div><!-- review-wrap-con -->
			</div><!-- review-wrap -->
		</li>
	</ul>
<%if(dto.getNextNum()!=0){ %>
	<a href="content.jsp?num=<%=dto.getNextNum() %>" class="review-arrow"><i class="fas fa-chevron-right"></i></a>
<%} %>
</div><!-- content-review -->
	
		<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
			<div class="review-left">
			<%if(dto.getWriter().equals(id)){ %>
				<a href="private/updateform.jsp?num=<%=dto.getNum()%>" class="btn-a">수정</a>
			<%} %>
			<%if(dto.getWriter().equals(id)||id.equals("admin")){ %>
				<a href="javascript:deleteConfirm(<%=dto.getNum()%>)" class="btn-a btn-g">삭제</a>
			<%} %>
			<!-- 로그인 중인 id가 글 작성 시의 id와 다를 때에만 추천 기능을 볼 수 있도록 -->
			<%if(!dto.getWriter().equals(id)){ %>
				<a href="recommand.jsp?num=<%=dto.getNum()%>" class="btn-a btn-y">추천</a>
			<%} %>
			</div>
			<div class="center">
				<a href="rev_list.jsp" class="review-btn2"><b>+</b> 전체 후기 보기</a>
			</div>
				
</div><!-- content -->
<script>
	function deleteConfirm(num){
		var isDelete = confirm(num+"번 글을 삭제하시겠습니까?");
		  if(isDelete){
	            location.href="delete.jsp?num="+num;
		  }
	}
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>