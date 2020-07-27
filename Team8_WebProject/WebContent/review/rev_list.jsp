<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#profileImage{
		width: 75px;
		height: 75px;
		border: 1px solid;
		border-radius: 50%;
	}
</style>
<%
		//로그인 된 아이디 읽어오기.(로그인 하지 않으면  null이다.)
		String id = (String)session.getAttribute("id");
		
		//한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT=5;
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
		int totalRow=ReviewDao.getInstance().getCount();
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
		
		//startRowNum과 endRowNum을 FileDto 객체에 담고
		ReviewDto dto = new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<ReviewDto> list =  ReviewDao.getInstance().getList(dto);

%>

<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">

		<h1>QnA 게시판</h1>
			
		<h3>문의사항이 있다면 글 남겨주세요~^^</h3>
		
		<!-- 글 목록 테이블 -->
		<table class="table">
			<% for(ReviewDto tmp:list){ %>
				<tr>
					<th> 제목 </th>
					<td><%=tmp.getTitle() %></td>
				</tr>	
				<tr>
					<th><img id="profileImage" src="${pageContext.request.contextPath}<%=tmp.getProfile() %>"/></th>
					<td><%=tmp.getWriter() %></td>
				</tr>
				<tr>
					<th></th>
					<td><%=tmp.getContent() %></td>
					<td><a href="content.jsp?num=<%=tmp.getNum()%>"><button>더보기</button></a></td>
				</tr>
				<tr>
					<th> 작성일 </th>
					<td><%=tmp.getRegdate() %></td>
				</tr>
				<tr>
					<th> 추천수 </th>
					<td><%=tmp.getRecomm() %></td>
				</tr>
				<%} %>
		</table>
		<a href="${pageContext.request.contextPath}/review/private/insertform.jsp"><button>작성하기</button></a>
		<%if(id!=null){ %>
			<a href="myrev.jsp"><button>내 글 보기</button></a>
		<%} %>
		
		
		<!-- 페이징 처리 버튼 -->
		<div class="page-display">
              <ul>
                   <%if(startPageNum !=1){ %>
                        <li class="prev"><a href="rev_list.jsp?pageNum=<%=startPageNum-1  %>">Prev</a></li>
                   <%} %>
                   <%for(int i=startPageNum; i<=endPageNum; i++){ %>
                        <%if(i==pageNum){ %>
                             <li class="active"><a href="rev_list.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} else{%>
                             <li><a href="rev_list.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} %>
                   <%} %>
                   <%if(endPageNum < totalPageCount){ %>
                        <li class="next"><a href="rev_list.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
                   <%} %>
              </ul>
          </div>
          <br/>
          <br/>
         

</div>
	
<jsp:include page="../include/footer.jsp"></jsp:include>
