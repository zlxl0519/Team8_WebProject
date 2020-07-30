<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//로그인 된 아이디 읽어오기.(로그인 하지 않으면  null이다.)
		String id = (String)session.getAttribute("id");
		
		//한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT=5;
		//하단 디스플레이 페이지 갯수
		//final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와  본다.     
		//String strPageNum=request.getParameter("pageNum");
		//if(strPageNum != null){//페이지 번호가 파라미터로  넘어온다면
		     //페이지 번호를 설정한다.
		     //pageNum=Integer.parseInt(strPageNum);
		//}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=ReviewDao.getInstance().getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
		          (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

		
		//startRowNum과 endRowNum을 ReviewDto 객체에 담고
		ReviewDto dto = new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<ReviewDto> list =  ReviewDao.getInstance().getList(dto);
		
		
%>

<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content center">
	<h3 class="review"><strong>실시간</strong> 에이멍 후기 <i class="fas fa-comment-dots"></i></h3>
	<div class="left mb20">
		<a href="${pageContext.request.contextPath}/review/private/insertform.jsp"><button>작성하기</button></a>
	<%if(id!=null){ %>
		<a href="myrev.jsp"><button class="btn-g">내 글 보기</button></a>
	<%} %>
	</div>

	<ul class="review-ul">
	<% for(ReviewDto tmp:list){ %>
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
						<img id="profileImage" src="${pageContext.request.contextPath}<%=tmp.getProfile() %>"/>
					<%}else{ %>
						<img id="profileImage" src="${pageContext.request.contextPath}/include/img/icon_user.png"/>
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
				<div class="right mt20"><a class="review-btn" href="content.jsp?num=<%=tmp.getNum()%>">더보기</a></div>
			</div><!-- review-wrap -->
		</li>
	<%} %>
	</ul>

<script>
	//페이지가 처음 로딩될때 1page 를 보여준다고 가정
	var currentPage=1;
	//전체 페이지의 수를 javascript 변수에 담아준다.
	var totalPageCount=<%=totalPageCount%>;
	
	//웹브라우저에 scoll 이벤트가 일어 났을때 실행할 함수 등록 
	$(window).on("scroll", function(){
		if(currentPage == totalPageCount){//만일 마지막 페이지 이면 
			return; //함수를 여기서 종료한다. 
		}
		//위쪽으로 스크롤된 길이 구하기
		var scrollTop=$(window).scrollTop();
		//window 의 높이
		var windowHeight=$(window).height();
		//document(문서)의 높이
		var documentHeight=$(document).height();
		//바닥까지 스크롤 되었는지 여부
		var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
		if(isBottom){//만일 바닥까지 스크롤 했다면...
			currentPage++; //페이지를 1 증가 시키고 
			//해당 페이지의 내용을 ajax  요청을 해서 받아온다. 
			$.ajax({
				url:"rev_ajax_list.jsp",
				method:"get",
				data:{pageNum:currentPage},
				success:function(data){
					console.log(data);
					//data 가 html 마크업 형태의 문자열 
					$(".review-ul").append(data); 
				}
			});
		}
	});	
</script>
          
</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>