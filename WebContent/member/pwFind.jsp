<%@page import="smtp.SMTPAuth"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<%
request.setCharacterEncoding("UTF-8");
String name2 = request.getParameter("name2");
String email2 = request.getParameter("email2");
String user_id = request.getParameter("user_id");

MembershipDAO dao = new MembershipDAO(application);
Map<String, String> membershipinfo = dao.getPwMap(user_id,name2,email2);

SMTPAuth smtp = new SMTPAuth();
Map<String,String> emailContent = new HashMap<String,String>();
emailContent.put("from", request.getParameter("from"));
emailContent.put("to", request.getParameter("to"));
emailContent.put("subject", request.getParameter("subject"));
emailContent.put("content", request.getParameter("content"));

if(request.getParameter("content")!=null){
	boolean emailResult = smtp.emailSending(emailContent);
	if(emailResult==true){
		out.print("메일발송성공");
	}
	else{
		out.print("메일발송실패");
	}
	return;
}
%>   







