<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/qna/qna_list.jsp");
	
	QnaDto dto = QnaDao.getInstance().getData(num);
	String id = dto.getId();
	String sId = (String)session.getAttribute("id");
	if(!id.equals(sId)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"잘못된 접근입니다!");
		return;
	}
%>