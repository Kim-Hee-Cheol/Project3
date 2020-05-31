<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<body>
<script>
	function idFind(frm){
		if(!frm.name1.value){
			alert("이름을 입력하세요");
			frm.name1.focus();
			return false;
		}
		if(frm.email1.value==""){
			alert("이메일을 입력하세요");
			frm.eamil1.focus();
			return false;
		}
	}
	
	function pwdFind(frm){
		if(!frm.user_id.value){
			alert("아이디를 입력하세요");
			frm.user_id.focus();
			return false;
		}
		if(!frm.name2.value){
			alert("이름을 입력하세요");
			frm.name2.focus();
			return false;
		}
		if(!frm.email2.value){
			alert("이메일을 입력하세요");
			frm.email2.focus();
			return false;
		}
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
						<form action="idFind.jsp" method="post" name="idfindFrm" onsubmit="return idFind(this);">
							<ul>
								<li><input type="text" name="name1" value="" class="login_input01" /></li>
								<li><input type="text" name="email1" value="" class="login_input01" /></li>
							</ul>
							<a href=""><img src="../images/member/id_btn01.gif" class="id_btn" /></a>
							<a href="./join01.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
						</form>
					</div>
					<div class="pw_box">
						<form action="pwFind.jsp" method="post" name="pwfindFrm" onsubmit="return pwdFind(this);">
							<ul>
								<li><input type="text" name="user_id" value="" class="login_input01" /></li>
								<li><input type="text" name="name2" value="" class="login_input01" /></li>
								<li><input type="text" name="email2" value="" class="login_input01" /></li>
							</ul>
							<a href=""><img src="../images/member/id_btn01.gif" class="pw_btn" /></a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	<%@ include file="../include/footer.jsp" %>

	</center>
</body>



