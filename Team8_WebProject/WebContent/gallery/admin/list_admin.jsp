<%@page import="java.net.URLEncoder"%>
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
	
	//검색 키워드에 관련된 처리============================
	String keyword=request.getParameter("keyword"); //검색 키워드
	if(keyword==null){//전달된 키워드가 없다면 
		keyword=""; //빈 문자열을 넣어준다. 
	}
	//인코딩된 키워드를 미리 만들어 둔다. 
	String encodedK=URLEncoder.encode(keyword);
	
	//dao, dto 생성해서 데이터 set ============================
	//검색 키워드와 startRowNum, endRowNum 을 담을 FileDto 객체 생성
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//select 된 결과를 담을 List
	List<GalleryDto> list=null;
	//전체 row 의 갯수를 담을 변수 
	int totalRow=0;
	
	
	if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
		dto.setCaption(keyword);
		list = GalleryDao.getInstance().getListT(dto);
		totalRow = GalleryDao.getInstance().getCountT(dto);
	}else{//검색 키워드가 없으면 전체 목록을 얻어온다.
		list = GalleryDao.getInstance().getList(dto);
		//전체 row 의 갯수를 읽어온다.	
		totalRow =GalleryDao.getInstance().getCount();
	}
	
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
%>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="content">
	<h2>운영관리 | 호텔일상</h2>	
	<!-- ===============================검색창================================= -->
	
	<%-- 검색창 --%>
	<div class="right">
	
	
	<div class="search-form search-sm">
		<form action="list_admin.jsp" method="get" style="margin-right : 40px">
		<label for="keyword">
				<input value="<%=keyword %>" type="text" name="keyword" placeholder="제목 검색" id="search"/>
				<button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
		</label>
		</form>
	</div>
	<div class="leftf mt30">
		<a href="upload_form.jsp"><button>새 글 작성</button></a>
	</div>
	</div><!-- right -->
	
	<!-- ===================================================================== -->
	
		<ul class="gallery-list">
			<%for(GalleryDto tmp : list){%>
			<li>
				<div class="gallery-img">
					<a href="content.jsp?num=<%=tmp.getNum()%>">
						<img src="${pageContext.request.contextPath }<%= tmp.getImagePath() %>"/>
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
			<a href="#" id="nextBtn"><i class="fas fa-chevron-down"></i></a>
		</div><!-- btn-down -->
</div><!-- content -->
<script>

	var currentPage = 1;
	var totalPageCount = <%= totalPageCount%>;
	
	$("#nextBtn").on("click", function(){
		
		currentPage++;
		
		<%if(keyword.equals("")){ %>
			$.ajax({
				url : "ajax_list_admin.jsp",
				method : "get",
				data : {pageNum : currentPage},
				success : function(data){
					$(".gallery-list").append(data).fadeIn(1000);
				}
			});	
		<%}else{%>
			$.ajax({
				url : "ajax_list_admin.jsp",
				method : "get",
				data : {pageNum : currentPage, keyword:"<%=keyword%>"},
				success : function(data){
					$(".gallery-list").append(data).fadeIn(1000);
				}
			});
		<%}%>
	})
</script>
<jsp:include page="../../include/footer.jsp"></jsp:include>