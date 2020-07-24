<%@page import="test.notice.dao.NoticeDao"%>
<%@page import="test.notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 수정할 글 정보를 파라미터에서 추출한다.
	int num=Integer.parseInt(request.getParameter("num"));
 	String title=request.getParameter("title");
 	String content=request.getParameter("content");
 	//2. DB 에 수정반영하고
 	NoticeDto dto=new NoticeDto();
 	dto.setNum(num);
 	dto.setTitle(title);
 	dto.setContent(content);
 	boolean isSuccess=NoticeDao.getInstance().update(dto);
 	//3. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/private/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("글을 수정했습니다.");
			location.href="${pageContext.request.contextPath }/notice/notice_detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<script>
			alert("글을 수정하지 못했습니다.");
			location.href="${pageContext.request.contextPath }/notice/updateform.jsp?num=<%=num %>";
		</script>
	<%} %>
</body>
</html>



