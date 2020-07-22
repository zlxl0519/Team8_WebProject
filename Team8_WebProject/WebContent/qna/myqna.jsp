<%@page import="java.util.List"%>
<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	QnaDao dao = QnaDao.getInstance();
	
	if(id == null){
		id = "not_login_guest";
	}
	
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
    
	QnaDto dto = new QnaDto();
    dto.setStartRowNum(startRowNum);
    dto.setEndRowNum(endRowNum);
    
	List<QnaDto> list = dao.getMine(dto, id);
	
%>

<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">

		<h1>QnA 게시판</h1>
			
		<h3><%=id %>님의 게시물 목록입니다.</h3>
		
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
		<a href="insertform.jsp"><button>작성하기</button></a>
		<a href="qna_list.jsp"><button>목록으로</button></a>
		
		<!-- 페이징 처리 버튼 -->
		<div class="page-display">
              <ul>
                   <%if(startPageNum !=1){ %>
                        <li class="prev"><a href="myqna.jsp?pageNum=<%=startPageNum-1  %>">prev</a></li>
                   <%} %>
                   <%for(int i=startPageNum; i<=endPageNum; i++){ %>
                        <%if(i==pageNum){ %>
                             <li class="active"><a href="myqna.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} else{%>
                             <li><a href="myqna.jsp?pageNum=<%=i%>"><%=i %></a></li>
                        <%} %>
                   <%} %>
                   <%if(endPageNum < totalPageCount){ %>
                        <li class="next"><a href="myqna.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
                   <%} %>
              </ul>
         </div>
          <br/>
          <br/>
         
</div>
	
<jsp:include page="../include/footer.jsp"></jsp:include>
