<%@page import="model.MembershipDTO"%>
<%@page import="model.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_pw2 = request.getParameter("user_pw2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1 + "-" + tel2 + "-" + tel3;
	String mobile1 = request.getParameter("mobile1");
	String mobile2 = request.getParameter("mobile2");
	String mobile3 = request.getParameter("mobile3");
	String mobile = mobile1+ "-" + mobile2 + "-" +mobile3;
	String email_1 = request.getParameter("email_1");
	String email_2 = request.getParameter("email_2");
	String email = email_1 + "@" + email_2;
	String zip1 = request.getParameter("zip1");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addr3 = request.getParameter("addr3");
	String address = zip1+addr1+addr2+addr3;
	
	
	MembershipDTO dto = new MembershipDTO();
	dto.setName(name);
	dto.setUser_id(user_id);
	dto.setUser_pw(user_pw);
	dto.setUser_pw2(user_pw2);
	dto.setTel(tel);
	dto.setMobile(mobile);
	dto.setEmail(email);
	dto.setAddress(address);
	
	MembershipDAO dao = new MembershipDAO(application);
	int affected = dao.joinMember(dto);
	if(affected==1){
%>
<script>
	alert("회원가입에 성공하셨습니다.");
</script>
<% 
		response.sendRedirect("../main/main.jsp");
	} else{
%>
<script>
	history.go(-1);
</script>
<% } %>


