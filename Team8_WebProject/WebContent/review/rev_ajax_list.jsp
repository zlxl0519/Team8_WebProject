<%@page import="dao.ReviewDao"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT=5;
	//ajax 요청 파라미터로 전달되는 추가로 보여줄 페이지의 번호
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));

	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=ReviewDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
	          (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);


	ReviewDto dto = new ReviewDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<ReviewDto> list =  ReviewDao.getInstance().getList(dto);
	
	
%>

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
					<p><%=tmp.getWriter() %></p>
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