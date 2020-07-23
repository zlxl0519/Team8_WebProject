<%@page import="dao.QnaDao"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = dao.getData(num);
	dao.viewCount(num);
	//세션에서 아이디 얻어오기
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
	<h2>QnA 게시판</h2>	
	<div class="table-wrap boardList bl2">
	
		<table>
			<tr>
				<th>글번호</th>
				<td class="center"><%=dto.getNum() %></td>
				<th>작성자</th>
				<td class="center"><%=dto.getWriter() %></td>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
				<th>조회수</th>
				<td class="center"><%=dto.getHit() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="7"><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><div id="content"><%=dto.getContent() %></div></td>
			</tr>
				
		</table>
		
	</div><!-- table-wrap -->
	<div>
	
	
	<div class="right">
			<%if(dto.getPrevNum()!=0){ %>
					<a class="btn-left" href="content.jsp?num=<%=dto.getPrevNum() %>"><i class="fas fa-chevron-left"></i></a>
			<%} %>
			<%if(dto.getNextNum()!=0){ %>
					<a class="btn-right" href="content.jsp?num=<%=dto.getNextNum() %>"><i class="fas fa-chevron-right"></i></a>
			<%} %>
	</div>
	<div class="mt20 left">
		<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
		<a class="btn-a" href="qna_list.jsp">목록</a>
		<%if(dto.getWriter().equals(id)){ %>
			<a class="btn-a btn-b" href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
		<%} %>
		<%if(dto.getWriter().equals(id)||id.equals("admin")){ %>
			<a class="btn-a btn-gray" href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
		<%} %>
	
	</div>
</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>

<script>
	function deleteConfirm(num){
		var isDelete = confirm(num+"번 글을 삭제하시겠습니까?");
		  if(isDelete){
	            location.href="delete.jsp?num="+num;
		  }
	}
</script>