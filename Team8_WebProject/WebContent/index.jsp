<%@page import="dao.ReviewDao"%>
<%@page import="dto.ReviewDto"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="test.notice.dao.NoticeDao"%>
<%@page import="test.notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="./include/header.jsp"></jsp:include>
<article class="main-article">
<section class="main-slide">
	<ul>
		<li>
			<div class="main-slide-content">
				<div class="slide-content-wrap">
				<h4>당신의 소중한 반려견에게</h4>
				<div class="slide-txt">
					<h3>유일한</h3>
					<h4>호텔링 경험을 선물하세요</h4>
					
				</div>

			<div class="reservation-btn"><a href="${pageContext.request.contextPath }/reservation/private/reserveform.jsp"> 예약하기 </a></div>
			</div>

			</div>
			<img src="${pageContext.request.contextPath }/include/img/main01.png"/>
		</li>
	</ul>
</section>
	<section class="main-room">
		<ul>
			<li><img src="${pageContext.request.contextPath }/include/img/main_room01.png"/></li>
			<li><img src="${pageContext.request.contextPath }/include/img/main_room02.png"/></li>
			<li><img src="${pageContext.request.contextPath }/include/img/main_room03.png"/></li>
		</ul>
	
	</section>
	<section class="main-notice">
		<div class="main-notice-wrap">
			<div class="main-notice-con">
				<h6>공지사항•새소식</h6>
				<p>어디에도 없는 프리미엄 반려견 호텔 서비스를 선사하는<br/>
					AMung의 새 소식과 공지사항을 알려드립니다.</p>
					
				<a href="${pageContext.request.contextPath }/notice/notice_list.jsp" class="notice-plus"><span>+</span>더보기</a>
			</div>
			<div class="main-notice-list">
				<ul>
				<% List<NoticeDto> list = NoticeDao.getInstance().getList2();%>
				<% for(int i=0; i<5; i++){
					NoticeDto tmp2 = list.get(i);
				%>
   					<li>
	   					<a href="${pageContext.request.contextPath }/notice/notice_detail.jsp?num=<%=tmp2.getNum() %>">
	   						<span>[ <%=tmp2.getSel() %> ]</span>
	   						<%=tmp2.getTitle() %>
	   					</a>
   					</li>
				<%}%>
					
				</ul>
			</div>
		</div>
	
	</section>
	<section class="main-gallery-wrap">
		<h6><a href="${pageContext.request.contextPath }/gallery/list.jsp">Amung의 일상 <span class="f_gr">+</span></a></h6>
		<ul class="gallery-list">
		<% List<GalleryDto> list2=GalleryDao.getInstance().getList2(); %>
			<%for(int i=0; i<3; i++){
				GalleryDto tmp = list2.get(i);
			%>
			<li>
					<a href="${pageContext.request.contextPath }/gallery/content.jsp?num=<%=tmp.getNum()%>">
						<img src="${pageContext.request.contextPath }<%= tmp.getImagePath()%>"/>
					</a>
			</li>
			<%} %>
		</ul>
	</section>
	
	
	<section class="main-review">
		<h6><a href="${pageContext.request.contextPath }/review/rev_list.jsp">Amung 후기 <span class="f_gr">+</span></a></h6>
		<ul class="review-ul">
		<% List<ReviewDto> list3=ReviewDao.getInstance().getList2(); %>
		<% for(int i=0; i<3; i++){ 
			ReviewDto tmp = list3.get(i);
		%>
		<li>
			<div class="review-wrap">
			<span class="review-date">
					<%
					// - 를 기준으로 문자열 추출
				    String regdate = tmp.getRegdate();
					String date[] = regdate.split("-");
					%>
					
					<%=date[0] %>년 
					<%=date[1] %>월
					<%=date[2] %>일 
					</span>
				<div class="review-wrap-users">
					<div class="review-profile">
					<%if(tmp.getProfile()==null || tmp.getProfile().equals("null")) {%>
						<img id="profileImage" src="${pageContext.request.contextPath}/include/img/icon_user.png"/>
					<%}else{ %>
						<img id="profileImage" src="${pageContext.request.contextPath}<%=tmp.getProfile() %>"/>
					<%} %>
					</div>
					<div class="review-users">
					<p>
					<%if(tmp.getWriter() !=null){%>
						<%=tmp.getWriter() %>
					<%}else{ %>
						익명의 리뷰어
					<%} %>
					</p>
					<span><%=tmp.getTitle() %> <br/></span>
					</div>
				</div><!-- review-wrap-users -->
				<div class="review-wrap-con mt30">
					<p><%=tmp.getContent() %>
					</p>
				</div><!-- review-wrap-con -->
				<div class="right mt20"><a class="review-btn" href="${pageContext.request.contextPath}/review/content.jsp?num=<%=tmp.getNum()%>">더보기</a></div>
			</div><!-- review-wrap -->
		</li>
	<%} %>
	</ul>
	</section>
</article>


<!-- footer -->
<jsp:include page="./include/footer.jsp"></jsp:include>