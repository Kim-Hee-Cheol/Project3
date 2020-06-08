<%@page import="smtp.SMTPAuth"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<%
request.setCharacterEncoding("UTF-8");

SMTPAuth smtp = new SMTPAuth();

String name2 = request.getParameter("name2");
String email = request.getParameter("email2");
String user_id = request.getParameter("user_id");
String from = request.getParameter("from2");
String subject = request.getParameter("subject");
out.println(name2);
out.println(email);
out.println(user_id);
out.println(from);
out.println(subject);


MembershipDAO dao = new MembershipDAO(application);
Map<String, String> membershipinfo = dao.getPwMap(user_id);

if(membershipinfo.get("user_pw") != null){
	
	Map<String,String> emailContent = new HashMap<String,String>();
	emailContent.put("from", request.getParameter("from2"));
	emailContent.put("to", request.getParameter("email2"));
	emailContent.put("subject", request.getParameter("subject"));
	emailContent.put("content", membershipinfo.get("user_pw"));
	
		boolean emailResult = smtp.emailSending(emailContent);
		if(emailResult==true){
			out.println("<script>");
			out.println("alert('회원님 이메일로 메일이 발송되었습니다.')");
			out.println("location.href='id_pw.jsp'");
			out.println("</script>");
		}
		else{
			out.println("<script>");
			out.println("alert('이메일 발송실패')");
			out.println("</script>");
		}
		return;
	}
%>


   



