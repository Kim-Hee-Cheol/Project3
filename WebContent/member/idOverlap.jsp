<%@page import="model.MembershipDTO"%>
<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%-- idOverlap.jsp --%>

<%
String user_id = request.getParameter("user_id");

MembershipDTO dto = new MembershipDTO();
dto.setUser_id(user_id);

MembershipDAO dao = new MembershipDAO(application);
boolean result = dao.confirmId(user_id);

if(result==true) { 
%>
<center>
<br /><br />
<h4>이미 사용중인 ID입니다.</h4>
</center>
<%} else{ %>
<center>
<br /><br />
<h4><%=dto.getUser_id() %>는 사용하실 수 있는 ID입니다.</h4>
</center>
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


