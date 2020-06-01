<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- logout.jsp --%>
<%
	session.removeAttribute("USER_ID");
	session.removeAttribute("USER_PW");
	
	session.invalidate();
	
	response.sendRedirect("../main/main.jsp");
%>