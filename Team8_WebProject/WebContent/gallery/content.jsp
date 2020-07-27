<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	GalleryDao dao = GalleryDao.getInstance();
	GalleryDto dto = dao.getData(num);
	dao.viewCount(num);
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
<div class="table-wrap boardList">
	<h2>호텔 일상</h2>
	<table>
			<tr>
				<th>글번호</th>
				<td class="center"><%=dto.getNum() %></td>
				<th>작성자</th>
				<td class="center">운영자</td>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
				<th>조회수</th>
				<td class="center"><%=dto.getHit() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="7"><%=dto.getCaption() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><div id="content"><%=dto.getContent() %></div></td>
			</tr>
				
		</table>
	
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>