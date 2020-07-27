<%@page import="test.notice.dao.NoticeDao"%>
<%@page import="test.notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//1. 폼 전송되는 파라미터 읽어오기 (글제목, 내용)
	String title = request.getParameter("title");
	String content=request.getParameter("content");
	String sel = request.getParameter("sel");
	
	//NoticeDto 객체에 제목,선택사항,내용을 담고 
	NoticeDto dto=new NoticeDto();
	dto.setTitle(title);
	dto.setSel(sel);
	dto.setContent(content);
	//2. DB 에 글 정보를 저장하고
	boolean isSuccess=NoticeDao.getInstance().insert(dto);
	//3. 응답하기 
%>
<jsp:include page="../../include/header.jsp"></jsp:include>
   
<script>
	document.title = "Amung'Notice"; 
</script>
<%-- 공지사항 업로드--%>
<%if(isSuccess){ %>
		<script>
			alert("저장하였습니다.");
			location.href="${pageContext.request.contextPath }/notice/notice_list.jsp";
		</script>
<%}else{ %>
		<script>
			alert("저장에실패하였습니다.");
			location.href="${pageContext.request.contextPath }/notice/private/notice_uploadform.jsp";
		</script>
<%} %>
<jsp:include page="../../include/footer.jsp"></jsp:include>




