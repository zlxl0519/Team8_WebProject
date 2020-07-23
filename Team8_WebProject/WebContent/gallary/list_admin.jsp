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
<div class="table-wrap">
	<h2>운영관리 | 호텔일상</h2>
		<ul>
			<%for(GalleryDto tmp : list){%>
			<li>
				<div>
					<a href="content.jsp?num=<%=tmp.getNum()%>">
						<img src="${pageContext.request.contextPath }<%= tmp.getImagePath()%>" style="width: 150px;"/>
					</a>
				</div>
				<div class="caption"><%=tmp.getCaption() %></div>
				<a href="update_form.jsp?num=<%=tmp.getNum()%>">수정</a>
				<a href="delete.jsp?num=<%=tmp.getNum() %>" >삭제</a>
			</li>
			<%} %>
		</ul>
		<a href="upload_form.jsp"><button>새 글 작성</button></a>
		
		<%-- 어드민 적용
		<%if(id.equals("admin")){ %>
			<div id="btn" style="margin-top: 40px"></div>
			<script>
				$("<a>").attr("id", "submit").attr("href", "upload_form.jsp").appendTo("#btn");
				$("<button>").text("글쓰기").appendTo("#submit");
			</script>
		<%}%>
		 --%>
	</div>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>