<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<script>
$(function(){
    $('#pwd1').keyup(function(){
        
        $('#pwd2').val("");
        
        $('#msg').text("");
    });

   
    $('#pwd2').keyup(function(){
        
        var compareStr1= $('#pwd1').val();
        var compareStr2= $('#pwd2').val();

        if(compareStr1==compareStr2){
           
            $('#msg').html('<b style="color:red;">암호가 일치합니다.</b>');
        }
        else{
            //암호 일치하지 않으면 검은색
            $('#msg').html('<b>암호가 틀립니다.</b>').css('color','black');
        }
    });
	
   
    $('#last_email_check2').change(function(){
        var text = $('#last_email_check2 option:selected').text(); 
        var value = $('#last_email_check2 option:selected').val();
        if(value==""){
            $('#email_2').attr('readonly',true);
            $('#email_2').val('');
        }
        else if(value=='direct'){
            $('#email_2').attr('readonly',false);
            $('#email_2').val('');
        }
        else{
            $('#email_2').attr('readonly',true);
            $('#email_2').val(value);
        }
    });
});
</script>
<body>

	<form name="frm" onsubmit="return isValidate(this);">
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
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>

				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="id"  value="" class="join_input" />&nbsp;<a onclick="id_check_person(frm);" style="cursor:hand;"><img src="../images/btn_idcheck.gif" alt="중복확인"/></a>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass" id="pwd1" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" id="pwd2" value="" class="join_input" /><span id="msg"></span></td>
					</tr>

					

					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
	<input type="text" id="email_1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
	<input type="text" id="email_2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
	<select name="last_email_check2" class="pass" id="last_email_check2" >
		<option selected="" value="">선택해주세요</option>
		<option value="direct" >직접입력</option>
		<option value="hanmail.net" >hanmail.net</option>
		<option value="google.com">google.com</option>
		<option value="nate.com" >nate.com</option>
		<option value="naver.com" >naver.com</option>
		<option value="paran.com" >paran.com</option>
	</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zip1" value=""  class="join_input" style="width:100px;" />
						<a href="javascript:;" title="새 창으로 열림" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>

				<p style="text-align:center; margin-bottom:20px">
				<a href="javascript:frm.submit();"><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;
				<a href="join01.jsp"><img src="../images/btn02.gif" /></a></p>
				
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</center>
	</form>
 </body>
<script>
function id_check_person(frm){
	
	if(frm.id.value==""){
        alert("아이디를 입력 후 중복확인을 누르세요");
        frm.id.focus();
    }
    else{
    	
    }
}

var isValidate = function(frm){
	if(frm.id.value==''){
        alert('아이디를 입력하세요');
        frm.id.focus();
        return false;
    }
	var idcheck = /^[a-zA-Z0-9]{4,12}$/;
	if(!idcheck.test(id)) {
		alert("4자이상 12자이내의 영문/숫자만 입력하세요");
		frm.id.focus();
	}
	
    if(!frm.pass.value || !frm.pass2.value){
        alert('패스워드를 입력하세요');
        return false;
    }
	
  
    
    var passcheck = /^[a-zA-Z0-9]{4,12}$/;
	if(!passcheck.test(id)) {
		alert("4자이상 12자이내의 영문/숫자만 입력하세요");
		frm.pass.focus();
	}
    
    if(!frm.tel1.value || !frm.tel2.value || !frm.tel3.value){
    	alert("전화번호를 입력하세요");
    	return false;
    }
    if(!frm.mobile1.value || !frm.mobile2.value || !frm.mobile3.value){
    	alert("핸드폰번호를 입력하세요");
    	return false;
    }
    
    if(!frm.email_1.value || !frm.email_2.value){
    	alert("이메일을 입력하세요");
    	return false;
    }
    if(frm.zip1.value=="" || frm.addr1.value=="" || frm.addr2.value==""){
    	alert("우편번호를 입력하세요");
    }

}


</script>
