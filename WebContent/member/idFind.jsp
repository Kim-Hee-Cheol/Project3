<%@page import="model.MembershipDTO"%>
<%@page import="model.MembershipDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String name1 = request.getParameter("name1");
String email1 = request.getParameter("email1");

MembershipDAO dao = new MembershipDAO(application);
Map<String, String> membershipinfo = dao.getIdMap(name1, email1);
String id = membershipinfo.get("user_id");
if(id!= null) {
	System.out.println(id);
%>
<body>
	<h2>아이디는 : <%=id %></h2> 
<%
} else {
%>
	<h2>회원정보가 없습니다.</h2> 
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


