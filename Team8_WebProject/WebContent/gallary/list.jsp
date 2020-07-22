<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GalleryDto> list = GalleryDao.getInstance().getList();
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
<div class="table-wrap">
	<h2>호텔 일상</h2>
		<ul>
			<%for(GalleryDto tmp : list){%>
			<li>
				<div>
					<a href="imgInfo.jsp?num=<%=tmp.getNum()%>"><img src="${pageContext.request.contextPath }<%= tmp.getImagePath()%></a>"/>
				</div>
				<div class="caption"><%=tmp.getCaption() %></div>
			</li>
			<%} %>
		</ul>
		<a href="upload_form.jsp"><button>글쓰기</button></a>
	</div>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>