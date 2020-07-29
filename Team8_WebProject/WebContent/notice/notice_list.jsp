<%@page import="test.notice.dao.NoticeDao"%>
<%@page import="test.notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=10;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=3;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=NoticeDao.getInstance().getCount();
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
	// CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
	NoticeDto dto=new NoticeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB 에서 글 목록을 얻어온다.
	List<NoticeDto> list=NoticeDao.getInstance().getList(dto);
	//2. 글 목록을 응답한다.
	
	//아이디를 읽어온다.
	String id=(String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amung'Notice"; 
</script>
<%--공지사항 리스트--%>
<div class="content">
	
	<h2>공지사항</h2>
	<div class="table-wrap">
		<table>
			<colgroup>
		       <col width="100px"/>
		       <col width="50%"/>
		       <col width=""/>
		       <col width="100px"/>
		       <col width=""/>
		   	</colgroup>
			<tr>
				<th>글번호</th>
				
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
			<%for(NoticeDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					
					<td class="board_title left">
						<a href="notice_detail.jsp?num=<%=tmp.getNum() %>">
							<span>[&nbsp;&nbsp;<%=tmp.getSel() %>&nbsp;&nbsp;]</span>
							<%=tmp.getTitle() %>
						</a>
					</td>
					<td>운영자</td>
					<td><%=tmp.getViewCount() %></td>
					<td>
						<%
						// - 를 기준으로 문자열 추출
					    String regdate = tmp.getRegdate();
					    
					   // split()을 이용해 '-'를 기준으로 문자열을 자른다.
					   // split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
					   String date[] = regdate.split("-");
						%>	
						<%=date[0] %>년
						<%=date[1] %>월
						<%=date[2] %>일		
					</td>
				</tr>
			<%} %>
		</table>
	
	</div><!--table-wrap -->
	
	
	<!-- 아이디가 admin일 때만 작성 버튼이 보임. -->
	<%try{ %>
		<%if(id.equals("admin")){%>
		<div class="left mt20">
		 	<a href="private/notice_uploadform.jsp" class="btn-a">글작성</a>
	  	</div><!--left-->
	<%} %>
	<%}catch(Exception e){e.printStackTrace(); }%>
	
	<!-- 페이징 처리 버튼 -->
	<div class="page-display">
		<ul>
			<%if(startPageNum != 1){ %>
				<li class="prev">
					<a href="notice_list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
				</li>
			<%}else{ %>
				<li class="prev muted">
					<a href="javascript:">Prev</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i == pageNum){ %>
					<li class="active">
						<a href="notice_list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%}else{ %>
					<li>
						<a href="notice_list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
				<li class="next">
					<a href="notice_list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
				</li>
			<%}else{ %>
				<li class="next muted">
					<a href="javascript:">Next</a>
				</li>
			<%} %>
		</ul>
	</div><!-- page-display -->
</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>