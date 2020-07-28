<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="test.notice.dao.NoticeDao"%>
<%@page import="test.notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="./include/header.jsp"></jsp:include>

<%
	String isFiltered = (String)request.getAttribute("isFiltered");
%>
<script>
	if(isFiltered){
		alert("잘못된 접근입니다.");
	}
</script>

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
		<h6><a href="${pageContext.request.contextPath }/gallery/list.jsp">Amung의 일상 <span class="f_ye">+</span></a></h6>
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
		<h6>Amung 후기</h6>
		<ul class="review-ul">
			<li>
			<div class="review-wrap">
				<div class="review-wrap-users">
					<div class="review-profile"><img src="https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_262/%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg" /></div>
					<p class="review-users">사용자1</p>
				</div>
				<div class="review-wrap-con">
				<p>여행갈때마다 덕분에 안심 하고 갈 수 있는 것 같아요!!<br/>
				이번에도 역시나 정말정말 잘 돌봐주셔서 너무너무 감사합니다!!!<br/>
				항상 와주시는 시터님들 모두 고양이한테 애정이 가득한게 느껴져서 믿음이 가고 좋은 것 같아요<br/>
				정말 감사합니다 다음번에도 잘부탁드립니당!!!👍👍👍👍</p>
				</div>
				</div>
			</li>
			<li>
			<div class="review-wrap">
				<div class="review-wrap-users">
					<div class="review-profile"><img src="https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_262/%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg" /></div>
					<p class="review-users">사용자1</p>
				</div>
				<div class="review-wrap-con">
				<p>여행갈때마다 덕분에 안심 하고 갈 수 있는 것 같아요!!<br/>
				이번에도 역시나 정말정말 잘 돌봐주셔서 너무너무 감사합니다!!!<br/>
				항상 와주시는 시터님들 모두 고양이한테 애정이 가득한게 느껴져서 믿음이 가고 좋은 것 같아요<br/>
				정말 감사합니다 다음번에도 잘부탁드립니당!!!👍👍👍👍</p>
				</div>
				</div>
			</li>
			<li>
			<div class="review-wrap">
				<div class="review-wrap-users">
					<div class="review-profile"><img src="https://s3.ap-northeast-2.amazonaws.com/elasticbeanstalk-ap-northeast-2-176213403491/media/magazine_img/magazine_262/%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg" /></div>
					<p class="review-users">사용자1</p>
				</div>
				<div class="review-wrap-con">
				<p>여행갈때마다 덕분에 안심 하고 갈 수 있는 것 같아요!!<br/>
				이번에도 역시나 정말정말 잘 돌봐주셔서 너무너무 감사합니다!!!<br/>
				항상 와주시는 시터님들 모두 고양이한테 애정이 가득한게 느껴져서 믿음이 가고 좋은 것 같아요<br/>
				정말 감사합니다 다음번에도 잘부탁드립니당!!!👍👍👍👍</p>
				</div>
				</div>
			</li>
		</ul>
	
	</section>
	
</article>


<!-- footer -->
<jsp:include page="./include/footer.jsp"></jsp:include>