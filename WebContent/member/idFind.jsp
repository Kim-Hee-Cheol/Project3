<%@page import="model.MembershipDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String name1 = request.getParameter("name1");
String email1 = request.getParameter("email1");
System.out.println("email:"+email1);
System.out.println("name1:"+name1);

MembershipDAO dao = new MembershipDAO(application);
Map<String, String> membershipinfo = dao.getIdMap(name1,email1);

System.out.println("result:"+membershipinfo.get("user_id"));

if(membershipinfo.get("user_id")!= null) {
%>
<script>
	alert("안녕");
</script>	
<%
}
else {
%>
<script>
alert("회원정보가 없습니다");
	history.go(-1);
</script>
<%
}
%>
