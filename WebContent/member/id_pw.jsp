<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<body>
<script>
function idFind(){
	
    var name1 = document.getElementById("name1");
    var email1 = document.getElementById("email1");
    
    var s_width = window.screen.width;
    var s_height = window.screen.height;
    var leftVar = (s_width/2) - (500/2);
    var topVar = (s_height/2) - (300/2);
    
	if(name1.value==""){
		alert("이름을 입력하세요");
		name1.focus();
		return false;
	}
	if(email1.value==""){
		alert("이메일을 입력하세요");
		email1.focus();
		return false;
	}
	window.open("idFind.jsp?name1="+ name1.value+"&email1="+ email1.value, "",  
			"width=500, height=300, left=" + leftVar + ", top =" + topVar);
	
}

function pwdFind(){
	
	var user_id = document.getElementById("user_id");
    var name2 = document.getElementById("name2");
    var email2 = document.getElementById("email2");
    
    var s_width = window.screen.width;
    var s_height = window.screen.height;
    var leftVar = (s_width/2) - (500/2);
    var topVar = (s_height/2) - (300/2);
    
	if(user_id.value==""){
		alert("아이디를 입력하세요");
		user_id.focus();
		return false;
	}
	if(name2.value==""){
		alert("이름을 입력하세요");
		name2.focus();
		return false;
	}
	if(email2.value==""){
		alert("이메일을 입력하세요");
		email2.focus();
		return false;
	}
	window.open("pwFind.jsp?user_id="+user_id.value+"&name2="+ name2.value+"&email2="+ email2.value, "",
			"width=600, height=300, left=" + leftVar + ", top =" + topVar);
}
</script> 
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>
		<img src="../images/member/sub_image.jpg" id="main_visual" />
		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				
				<div class="idpw_box">
					<div class="id_box">
						<ul>
							<li><input type="text" id="name1" name="name1" value="" class="login_input01" /></li>
							<li><input type="text" id="email1" name="email1" value="" class="login_input01" /></li>
						</ul>
						<input type="image" src="../images/member/id_btn01.gif" class="id_btn" onclick="idFind();" />
 						
						<a href="./join01.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					
					<div class="pw_box">
						<ul>
							<li><input type="text" id="user_id" name="user_id" value="" class="login_input01" /></li>
							<li><input type="text" id="name2" name="name2" value="" class="login_input01" /></li>
							<li><input type="text" id="email2" name="email2" value="" class="login_input01" /></li>
							<li><input type="hidden"  name="to" value="" class="login_input01" /></li>
							<li><input type="hidden"  name="subject2" value="비밀번호를 확인하세요" class="login_input01" /></li>
							
						</ul>
						<input type="image" src="../images/member/id_btn01.gif" class="pw_btn" onclick="pwdFind();"/>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	<%@ include file="../include/footer.jsp" %>
	</center>
</body>



