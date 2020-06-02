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
String pw = membershipinfo.get("user_pw");
if(pw!=null){
	SMTPAuth smtp = new SMTPAuth();
	Map<String,String> emailContent = new HashMap<String,String>();
	emailContent.put("from", request.getParameter(""));
	emailContent.put("to", request.getParameter("name2"));
	emailContent.put("subject", request.getParameter("subject2"));
	emailContent.put("content", request.getParameter("user_pw"));
	
	if(request.getParameter("user_pw")!=null){
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
<body>
	<h2 align="center">회원님의 이메일로 비밀번호가 전송되었습니다.</h2> 
<%
} else {
%>
	<h2 align="center">회원정보가 없습니다.</h2> 
<% } %>
<script>
function zipClose(){
	location.href="id_pw.jsp";
	self.close();
}
</script>

	<p style="text-align:center;">
        <button onclick="zipClose();">창닫기</button>
    </p>
</body> 







