<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	ReviewDao dao = ReviewDao.getInstance();
	ReviewDto dto = dao.getData(num);
	//세션에서 아이디 얻어오기
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
	<h1>QnA 게시판</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>프로필</th>
			<td><%=dto.getProfile() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th>추천수</th>
			<td><%=dto.getRecomm() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><div id="content"><%=dto.getContent() %></div></td>
		</tr>
		<tr>
			<td></td>
			<td>
			<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
			<%if(dto.getWriter().equals(id)){ %>
				<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
			<%} %>
			<%if(dto.getWriter().equals(id)||id.equals("admin")){ %>
				<a href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a>
			<%} %>
				<a href="rev_list.jsp">목록</a>
			<!-- 로그인 중인 id가 글 작성 시의 id와 다를 때에만 추천 기능을 볼 수 있도록 -->
			<%if(!dto.getWriter().equals(id)){ %>
				<a href="recommand.jsp?num=<%=dto.getNum()%>">추천</a>
			<%} %>
			</td>
		</tr>	
		<tr>
			<td></td>
			<td>
				<%if(dto.getPrevNum()!=0){ %>
					<a href="content.jsp?num=<%=dto.getPrevNum() %>">이전글</a>
				<%} %>
			</td>
			<td>
				<%if(dto.getNextNum()!=0){ %>
					<a href="content.jsp?num=<%=dto.getNextNum() %>">다음글</a>
				<%} %>
			</td>
		</tr>	
	</table>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>

<script>
	function deleteConfirm(num){
		var isDelete = confirm(num+"번 글을 삭제하시겠습니까?");
		  if(isDelete){
	            location.href="delete.jsp?num="+num;
		  }
	}
</script>

</body>
</html>