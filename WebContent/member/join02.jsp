<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

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
	<form name="frm" action="joinProcess.jsp" onsubmit="return isValidate(frm);">
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
						<td><input type="text" name="user_id" id="id"  value="" class="join_input" />&nbsp;<a onclick="id_check_person(frm);" style="cursor:hand;"><img src="../images/btn_idcheck.gif" alt="중복확인"/></a>&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="user_pw" id="pwd1" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="user_pw2" id="pwd2" value="" class="join_input" /><span id="msg"></span></td>
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
							<input type="text" id="email_1" name="email_1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
							<input type="text" id="email_2" name="email_2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly />
							<select name="last_email_check2" class="pass" id="last_email_check2" >
								<option selected="" value="">선택해주세요</option>
								<option value="direct" >직접입력</option>
								<option value="hanmail.net" >hanmail.net</option>
								<option value="google.com">google.com</option>
								<option value="nate.com" >nate.com</option>
								<option value="naver.com" >naver.com</option>
							</select>
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" id="postcode" name="zip1"  class="join_input" style="width:100px;" readonly />
						<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" name="addr1" value="주소"  class="join_input" onfocus="addFocus(1,this);" onblur="addFocus(2,this);" style="width:550px; margin-top:5px;" /><br>
						<input type="text" id="detailAddress" name="addr2" value="상세주소"  class="join_input" onfocus="detailaddFocus(1,this);" onblur="detailaddFocus(2,this);" style="width:550px; margin-top:5px;" />
						<input type="text" id="extraAddress" name="addr3" value="참고항목"  class="join_input" onfocus="refFocus(1,this);" onblur="refFocus(2,this);" style="width:550px; margin-top:5px;" />
						</td>
					</tr>
				</table>
				<p style="text-align:center; margin-bottom:20px">
				
				<input type ="image" src="../images/btn01.gif" />&nbsp;&nbsp;
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
function addFocus(flag,obj){
    if(flag==1){//포커스를 얻었을 때
        if(obj.value=="주소"){
            obj.value = "";
        }
    }
    else if(flag==2){//포커스를 잃었을 때
        if(obj.value==""){
            obj.value="주소";
        }
    }
}

function detailaddFocus(flag,obj){
    if(flag==1){//포커스를 얻었을 때
        if(obj.value=="상세주소"){
            obj.value = "";
        }
    }
    else if(flag==2){//포커스를 잃었을 때
        if(obj.value==""){
            obj.value="상세주소";
        }
    }
}

function refFocus(flag,obj){
    if(flag==1){//포커스를 얻었을 때
        if(obj.value=="참고항목"){
            obj.value = "";
        }
    }
    else if(flag==2){//포커스를 잃었을 때
        if(obj.value==""){
            obj.value="참고항목";
        }
    }
}

function id_check_person(frm){
	var s_width = window.screen.width;
    var s_height = window.screen.height;
    var leftVar = (s_width/2) - (500/2);
    var topVar = (s_height/2) - (300/2);
	

    var UserId = document.frm.user_id;
    if(UserId.value.length<4 && UserId.value.length>12) {
    	alert("아이디는 4자 이상 12자 이내의 영문/숫자/특수문자 조합으로 입력해주세용");
		return false;
    }
    if(!UserId.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
        alert("아이디는 4자 이상 12자 이내의 영문/숫자/특수문자 조합으로 입력해주세용");
		return false;
	}
    else{
        //중복확창을 띄울 때 입력한 아이디를 파라미터로 전달한다.
        window.open("idOverlap.jsp?user_id="+frm.user_id.value,
                "idover", "width=500, height=300, left=" + leftVar + ", top =" + topVar);
    }
	
	
}

function isValidate(frm){
	if(frm.name.value==""){
		alert('이름을 입력하세요');
		frm.name.focus();
		return false;
	}
	
	if(frm.user_id.value==""){
        alert('아이디를 입력하세요');
        frm.id.focus();
        return false;
    }
	
    if(frm.user_pw.value=="" || frm.user_pw2.value==""){
        alert('패스워드를 입력하세요');
        return false;
    }
    
	if (frm.user_pw.value != frm.user_pw2.value) {
		alert("입력한 두 개의 비밀번호가 서로  일치하지 않습니다.");
		return false;
	}
   
    if(frm.tel1.value=="" || frm.tel2.value=="" || frm.tel3.value==""){
    	alert("전화번호를 입력하세요");
    	return false;
    }
    
    if(frm.mobile1.value=="" || frm.mobile2.value=="" || frm.mobile3.value==""){
    	alert("핸드폰번호를 입력하세요");
    	return false;
    }
    
    
    if(frm.email_1.value=="" || frm.email_2.value==""){
    	alert("이메일을 입력하세요");
    	return false;
    }
    
    if(frm.zip1.value=="" || frm.addr1.value=="" || frm.addr2.value=="" || frm.addr3.value==""){
    	alert("우편번호를 입력하세요");
    	return false;
    }
    
    //비밀번호 유효성 검사
    var UserPassword = document.frm.user_pw;
    if(UserPassword.value.length<4 && UserPassword.value.length>12) {
    	alert("비밀번호는 4자 이상 12자 이내의 영문/숫자/특수문자 조합으로 입력해주세용");
		return false;
    }
    if(!UserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
        alert("비밀번호는 4자 이상 12자 이내의 영문/숫자/특수문자 조합으로 입력해주세용");
        return false;
    }
}
</script>
