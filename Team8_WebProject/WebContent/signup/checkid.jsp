<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String inputId = request.getParameter("inputId");
	boolean isExist = MemberDao.getInstance().isExist(inputId);
%>
{"isExist":<%=isExist%>}