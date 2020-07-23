<%@page import="dto.QnaDto"%>
<%@page import="dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	QnaDto dto = dao.getData(num);
	
	String writer = dto.getWriter();
	String id = (String)session.getAttribute("id");
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"잘못된 접근입니다!");
		return;
	}
	
	QnaDao.getInstance().delete(num);

	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/qna/qna_list.jsp");

%>