<%@page import="test.notice.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		//1. 파라미터로 전달되는 삭제할 파일의 번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
    	//2.DB에서 삭제한다.
    	boolean isSuccess = NoticeDao.getInstance().delete(num);
    	
    %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe/private/delete.jsp</title>
</head>
<body>
	<script>
	<%
	if(isSuccess){%>
		alert("삭제되었습니다.");
		location.href="${pageContext.request.contextPath }/notice/notice_list.jsp";
		<%}else{%>
		alert("삭제실패하였습니다.");
		location.href="${pageContext.request.contextPath }/notice/notice_detail.jsp?num=<%=num %>";
		<%}%>
	
	
</script>
</body>
</html>