<%@page import="test.gallery.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = GalleryDao.getInstance().delete(num);
	if(isSuccess){
		String cpath = request.getContextPath();
		response.sendRedirect(cpath+"/gallery/admin/list_admin.jsp");
	}
%>