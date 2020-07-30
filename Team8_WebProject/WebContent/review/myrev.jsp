<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	ReviewDao dao = ReviewDao.getInstance();

	
	 //한 페이지에 나타낼 row 의 갯수
    final int PAGE_ROW_COUNT=10;
    //하단 디스플레이 페이지 갯수
    final int PAGE_DISPLAY_COUNT=5;
    
    //보여줄 페이지의 번호
    int pageNum=1;
    //보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와  본다.     
    String strPageNum=request.getParameter("pageNum");
    if(strPageNum != null){//페이지 번호가 파라미터로  넘어온다면
         //페이지 번호를 설정한다.
         pageNum=Integer.parseInt(strPageNum);
    }
    //보여줄 페이지 데이터의 시작 ResultSet row 번호
    int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
    //보여줄 페이지 데이터의 끝 ResultSet row 번호
    int endRowNum=pageNum*PAGE_ROW_COUNT;
    
    //전체 row 의 갯수를 읽어온다.
    int totalRow=dao.getCountMine(id);
    //전체 페이지의 갯수 구하기
    int totalPageCount=
              (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
    //시작 페이지 번호
    int startPageNum=
         1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
    //끝 페이지 번호
    int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
    //끝 페이지 번호가 잘못된 값이라면
    if(totalPageCount < endPageNum){
         endPageNum=totalPageCount; //보정해준다.
    }
    
    ReviewDto dto = new ReviewDto();
    dto.setStartRowNum(startRowNum);
    dto.setEndRowNum(endRowNum);
    
	List<ReviewDto> list = dao.getMine(dto, id);
	
%>

<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
<h3 class="review"><strong><%=id %></strong>님의 소중한 후기 <i class="fas fa-comment-dots"></i></h3>
	<div class="left mb20">
		<a href="${pageContext.request.contextPath}/review/private/insertform.jsp"><button>작성하기</button></a>
		<a href="rev_list.jsp"><button class="btn-g">목록으로</button></a>
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
				<div class="right mt20"><a class="review-btn" href="content.jsp?num=<%=tmp.getNum()%>">더보기</a></div>
			</div><!-- review-wrap -->
		</li>
	<%} %>
	</ul>
		
		<!-- 페이징 처리 버튼 -->
	<div class="page-display">
	          <ul>
	               <%if(startPageNum !=1){ %>
	                    <li class="prev"><a href="myrev.jsp?pageNum=<%=startPageNum-1  %>">prev</a></li>
	               <%} %>
	               <%for(int i=startPageNum; i<=endPageNum; i++){ %>
	                    <%if(i==pageNum){ %>
	                         <li class="active"><a href="myrev.jsp?pageNum=<%=i%>"><%=i %></a></li>
	                    <%} else{%>
	                         <li><a href="myrev.jsp?pageNum=<%=i%>"><%=i %></a></li>
	                    <%} %>
	               <%} %>
	               <%if(endPageNum < totalPageCount){ %>
	                    <li class="next"><a href="myrev.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
	               <%} %>
	          </ul>
	     </div><!-- 페이징 -->
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>