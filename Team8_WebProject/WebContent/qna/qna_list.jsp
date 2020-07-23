<%@page import="java.net.URLEncoder"%>
<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
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
	
	//검색 키워드 처리
	String keyword = request.getParameter("keyword");
	if(keyword==null){
		keyword="";
	}
	
	String encodedK=URLEncoder.encode(keyword);
	String condition=request.getParameter("condition");
	
	QnaDto dto = new QnaDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<QnaDto> list = null;
	int totalRow=0;
	
	if(!keyword.equals("")){
		if(condition.equals("title_content")){
			dto.setTitle(keyword);
			dto.setContent(keyword);
	    	list=QnaDao.getInstance().getListTC(dto);
	    	totalRow=QnaDao.getInstance().getCountTC(dto);
		}else if(condition.equals("title")){
			dto.setTitle(keyword);
	    	list=QnaDao.getInstance().getListT(dto);
	    	totalRow=QnaDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){
			dto.setWriter(keyword);
	    	list=QnaDao.getInstance().getListW(dto);
	    	totalRow=QnaDao.getInstance().getCountW(dto);
		}
	}else{
		condition="";
		keyword="";
		list=QnaDao.getInstance().getList(dto);
		totalRow=QnaDao.getInstance().getCount();
	}
	
	
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
%>

<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">

		<h1>QnA 게시판</h1>
			
		<h3>문의사항이 있다면 글 남겨주세요~^^</h3>
		
		<!-- 글 목록 테이블 -->
		<table class="table">
			<thead class="thead-light">
				<tr style="text-align:center;">
					<th> 글번호 </th>
					<th> 제목 </th>
					<th> 작성자 </th>
					<th> 작성일 </th>
					<th> 조회수 </th>
				</tr>
			</thead>
			<tbody>
				<% for(QnaDto tmp:list){ %>
				<tr style="text-align:center;">
					<td><%=tmp.getNum() %></td>
					<td><a href="content.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td><%=tmp.getHit() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath}/qna/private/insertform.jsp"><button>작성하기</button></a>
		<%if(id!=null){ %>
			<a href="myqna.jsp"><button>내 글 보기</button></a>
		<%} %>
		
		
		<!-- 페이징 처리 버튼 -->
		<div class="page-display">
              <ul>
                   <%if(startPageNum !=1){ %>
                        <li class="prev"><a href="qna_list.jsp?pageNum=<%=startPageNum-1  %>">prev</a></li>
                   <%} %>
                   <%for(int i=startPageNum; i<=endPageNum; i++){ %>
                        <%if(i==pageNum){ %>
                             <li class="active"><a href="qna_list.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} else{%>
                             <li><a href="qna_list.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} %>
                   <%} %>
                   <%if(endPageNum < totalPageCount){ %>
                        <li class="next"><a href="qna_list.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
                   <%} %>
              </ul>
         </div>
          <br/>
          <br/>
         
     <!-- 검색용 폼 -->
	 <div class="search-form">
	 	<form action="qna_list.jsp" method="get">
	 		<div class="search-wrap">
	        	<select name="condition" id="condition">
	        		<option value="title_content" <%if(condition.equals("title_content")){%>selected<%} %>>제목+내용</option>
	        		<option value="title" <%if(condition.equals("title")){%>selected<%} %>>제목</option>
	        		<option value="writer" <%if(condition.equals("writer")){%>selected<%} %>>작성자</option>
	        	</select>
	        	<label for="keyword">
	        		<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어를 입력하세요." />
	        		<button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
	        	</label>
        	</div>
        </form> 
	 </div> 
		
</div>
	
<jsp:include page="../include/footer.jsp"></jsp:include>
