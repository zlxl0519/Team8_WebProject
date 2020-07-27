<%@page import="test.notice.dto.NoticeDto"%>
<%@page import="test.notice.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
	document.title = "Amung'Notice"; 
</script>
<%
	//아이디를 읽어온다.
	String id = (String)session.getAttribute("id");
	//1. GET 방식 파라미터로 전달되는 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 글 정보를 얻어온다.
	NoticeDto dto=NoticeDao.getInstance().getData(num);
	//3. 해당글의 조회수를 1 증가 시킨다.
	NoticeDao.getInstance().addViewCount(num);
	//4. 글 정보를 응답한다.
%>   
<%--공지사항 글 자세히 보기--%>

<div class="content">
	<h2>QnA 게시판</h2>	
	<div class="table-wrap boardList bl2">
		<table>
		<colgroup>
			<col width=""/>
			<col width="100px"/>
			<col width=""/>
			<col width=""/>
			<col width=""/>
			<col width=""/>
			<col width=""/>
			<col width="150px"/>
		</colgroup>
			<tr>
				<th>글번호</th>
				<td class="center"><%=dto.getNum() %></td>
				<th>작성자</th>
				<td class="center">운영자</td>
				<th>작성일</th>
				<td class="center">
				<%
				// - 를 기준으로 문자열 추출
				String regdate = dto.getRegdate();
					    
				// split()을 이용해 '-'를 기준으로 문자열을 자른다.
				// split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
				String date[] = regdate.split("-");
				%>	
				<%=date[0] %>년
				<%=date[1] %>월
				<%=date[2] %>일	
				</td>
				<th>조회수</th>
				<td class="center"><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="7"><span class="title-select">[ <%=dto.getSel() %> ]</span><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><div id="content"><%=dto.getContent() %></div></td>
			</tr>
				
		</table>
		
	</div><!-- table-wrap -->
	
	<div class="bottom-list">
	<div class="mt20">
		<div class="left">
				<%if(dto.getPrevNum()!=0){ %>
					<a class="btn-left" href="notice_detail.jsp?num=<%=dto.getPrevNum() %>"><i class="fas fa-chevron-left"></i></a>
				<%}else{%>
					<a class="btn-left mute" href="javacript:void(0)"><i class="fas fa-chevron-left"></i></a>
				<%} %>
		</div>
		<div class="right">
				<%if(dto.getNextNum()!=0){ %>
					<a class="btn-right" href="notice_detail.jsp?num=<%=dto.getNextNum() %>"><i class="fas fa-chevron-right"></i></a>
				<%}else{%>
					<a class="btn-right mute" href="javacript:void(0)"><i class="fas fa-chevron-right"></i></a>
				<%} %>
		</div>
			

	</div><!-- mt20 -->
	<div class="center">
		<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
		
		<%try{ %>
			<%if(id.equals("admin")){ %>
				<a class="btn-a btn-out-b" href="private/notice_updateform.jsp?num=<%=dto.getNum()%>">수정</a>
			<%} %>
			<a class="btn-a" href="notice_list.jsp">목록</a>
			<%if(id.equals("admin")) {%>
				<a class="btn-a btn-gray" href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
			<%} %>
		<%}catch(Exception e){e.printStackTrace(); }%>	
		
	</div><!-- left -->
	</div><!-- bottom-list -->
</div><!-- content -->

<jsp:include page="../include/footer.jsp"></jsp:include>

<script>
	function deleteConfirm(num){
		var isDelete = confirm(num+"번 글을 삭제하시겠습니까?");
		  if(isDelete){
	            location.href="private/notice_delete.jsp?num="+num;
		  }
	}
</script>