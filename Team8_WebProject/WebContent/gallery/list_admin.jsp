<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GalleryDto> list = GalleryDao.getInstance().getList();
	String id = (String)session.getAttribute("id");
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
	<h2>운영관리 | 호텔일상</h2>
	<div class="left">
		<a href="upload_form.jsp"><button>새 글 작성</button></a>
	</div>
	
		<ul class="gallery-list">
			<%for(GalleryDto tmp : list){%>
			<li>
				<div class="gallery-img">
					<a href="content.jsp?num=<%=tmp.getNum()%>">
						<img src="${pageContext.request.contextPath }<%= tmp.getImagePath()%>"/>
					</a>
				</div>
				<div class="caption"><p><%=tmp.getCaption() %></p></div>
				<div class="gallery-btn">
					<div>
						<a href="update_form.jsp?num=<%=tmp.getNum()%>" class="btn-default">수정</a>
						<a href="delete.jsp?num=<%=tmp.getNum() %>" class="btn-default btn-gray">삭제</a>
					</div>
				</div>
				
			</li>
			<%} %>
		</ul>
		
		<div class="btn-down">
			<a href="#"><i class="fas fa-chevron-down"></i></a>
		</div><!-- btn-down -->
		<%-- 어드민 적용
		<%if(id.equals("admin")){ %>
			<div id="btn" style="margin-top: 40px"></div>
			<script>
				$("<a>").attr("id", "submit").attr("href", "upload_form.jsp").appendTo("#btn");
				$("<button>").text("글쓰기").appendTo("#submit");
			</script>
		<%}%>
		 --%>
</div><!-- content -->
<jsp:include page="../include/footer.jsp"></jsp:include>