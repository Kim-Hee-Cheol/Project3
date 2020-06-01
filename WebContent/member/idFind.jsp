<%@page import="model.MembershipDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String name1 = request.getParameter("name1");
String email1 = request.getParameter("email1");

MembershipDAO dao = new MembershipDAO(application);
Map<String, String> membershipinfo = dao.getIdMap(name1,email1);

if(membershipinfo.get("user_id")!= null) {
%>
<script>
	
</script>
<%	
} else {
%>

<% } %>

<script>
function zipClose(){
	self.close();
}
</script>

<body>
	<p style="text-align:center;">
        <button onclick="zipClose();">창닫기</button>
    </p>
</body>


