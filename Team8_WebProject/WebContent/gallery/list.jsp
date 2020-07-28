<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=6;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=GalleryDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	// CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB 에서 글 목록을 얻어온다.
	List<GalleryDto> list=GalleryDao.getInstance().getList(dto);
	//2. 글 목록을 응답한다.
	
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">
	<h2>호텔 일상</h2>
		<div class="left">
			<%try{ %>
				<%if(id.equals("admin")){ %>
					<div id="btn" style="margin-top: 40px"></div>
					<script>
						$("<a>").attr("id", "submit").attr("href", "${pageContext.request.contextPath }/gallery/admin/upload_form.jsp").appendTo("#btn");
						$("<button>").text("새 글 작성").appendTo("#submit");
					</script>
				<%}%>
			<%}catch(Exception e){e.printStackTrace(); }%>
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
			</li>
			<%} %>
		</ul>
		<div class="btn-down">
			<a href="javascript:void(0);" id="nextBtn"><i class="fas fa-chevron-down"></i></a>
		</div><!-- btn-down -->
		
</div>
<script>
	var currentPage = 1;
	var totalPageCount = <%= totalPageCount%>;
	
	$("#nextBtn").on("click", function(){
		
		currentPage++;
		
		$.ajax({
			url : "ajax_list.jsp",
			method : "get",
			data : {pageNum : currentPage},
			success : function(data){
				$(".gallery-list").append(data).fadeIn(1000);
			}
		})
	})
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>







