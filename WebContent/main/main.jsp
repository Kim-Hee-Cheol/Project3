<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마포구립장애인 직업재활센터</title>
<style type="text/css" media="screen">
@import url("../css/common.css");
@import url("../css/main.css");
@import url("../css/sub.css");
</style>
<!-- <script src="../bootstrap-4.4.1/jquery/jquery-3.5.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
	//메인페이지를 로드할 때 현재월을 출력하는 달력 가져오기
	$('#calendar_view').load('../include/Calendar.jsp');
	
	//이전달을 콜백받음
	$('#month_prev').click(function(){
		var n_year = parseInt($('#now_year').val());
		var n_month = parseInt($('#now_month').val());
		
		if(n_month==0){
			n_year--;
			n_month=11;
		}
		else{
			n_month--;
		}
		
		$('#now_year').val(n_year);
		$('#now_month').val(n_month);
		$('#calendar_n_view').html(n_year+"년"+(n_month+1)+'월');
		$.get('../include/Calendar.jsp',
			{
				y : n_year,
				m : n_month
			},
			function(d){
				$('#calendar_view').html(d);
			}
		);
	});
	//다음달을 콜백받음
	$('#month_next').click(function(){
		var n_year = parseInt($('#now_year').val());
		var n_month = parseInt($('#now_month').val());
		
		if(n_month==11){
			n_year++;
			n_month=0;
		}
		else{
			n_month++;
		}
		$('#now_year').val(n_year);
		$('#now_month').val(n_month);
		$('#calendar_n_view').html(n_year+'년'+(n_month+1)+'월');
		$.ajax({
			url : "../include/Calendar.jsp",
			dataType : "html",
			type : "post",
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				y : n_year, m : n_month
			},
			success : function(responseData){
				$('#calendar_view').html(responseData);
			},
			error:function(errorData){
				alert("오류발생:"+errorData.status+":"
						+errorData.statusText);
			}
		});
	});
});
</script>
<%
Calendar nowDay = Calendar.getInstance();
int now_year = nowDay.get(Calendar.YEAR);
int now_month = nowDay.get(Calendar.MONTH);
%>
<input type="hidden" id="now_year" value="<%=now_year%>"/>
<!-- Calendar클래스의 월은 0~11까지 표현된다. -->
<input type="hidden" id="now_month" value="<%=now_month%>"/>
</head>
<body>
	<script>
	function loginValidate(fn){
		if(!fn.user_id.value){
			alert("아이디를 입력하세요");
			fn.user_id.focus();
			return false;
		}
		if(fn.user_pw.value==""){
			alert("패스워드를 입력하세요");
			fn.user_pw.focus();
			return false;
		}
	}
	</script>
<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp"%>
		
		<div id="main_visual">
		<a href="../product/sub01.jsp"><img src="../images/main_image_01.jpg" /></a><a href="../product/sub01_02.jsp"><img src="../images/main_image_02.jpg" /></a><a href="../product/sub01_03.jsp"><img src="../images/main_image_03.jpg" /></a><a href="../product/sub02.jsp"><img src="../images/main_image_04.jpg" /></a>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title01.gif" alt="로그인 LOGIN" /></p>
				<div class="login_box">
<% if(session.getAttribute("USER_ID")==null){ %>
				<form action="../member/loginProcess.jsp" method="post" name="loginFrm" onsubmit="return loginValidate(this);">	
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="45px" />
							<col width="120px" />
							<col width="55px" />
						</colgroup>
						<tr>
							<th><img src="../images/login_tit01.gif" alt="아이디" /></th>
							<td><input type="text" name="user_id" value="" class="login_input" tabindex="1" /></td>
							<td rowspan="2"><input type="image" src="../images/login_btn01.gif" alt="로그인" tabindex="3" /></td>
						</tr>
						<tr>
							<th><img src="../images/login_tit02.gif" alt="패스워드"  /></th>
							<td><input type="password" name="user_pw" value="" class="login_input" tabindex="2"/></td>
						</tr>
					</table>
					</form>
					<p>
						<input type="checkbox" name="" value="" tabindex="4"/><img src="../images/login_tit03.gif" alt="저장"  />
						<a href="../member/id_pw.jsp"><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>
						<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" alt="회원가입" /></a>
					</p>
					 
					<!-- 로그인 후 -->
<% } else { %>
					<p style="padding:10px 0px 10px 10px"><span style="font-weight:bold; color:#333;"><%=session.getAttribute("USER_NAME") %> 회원님,</span> 반갑습니다.<br /> 환영합니다^^*</p>
					<p style="text-align:right; padding-right:10px;">
						<a href=""><img src="../images/login_btn04.gif" /></a>
						<a href="../member/logout.jsp"><img src="../images/login_btn05.gif" /></a>
					</p>
<% } %>				 
				</div>
			</div>
			<div class="main_con_center">
				<p class="main_title"><img src="../images/main_title02.gif" alt="공지사항 NOTICE" /><a href="../space/lists.jsp?bname=notice"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
					<li><p><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></p></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
				</ul>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title03.gif" alt="자유게시판 FREE BOARD" /><a href="../space/lists.jsp?bname=freeboard"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
					<li><p><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></p></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
				</ul>
			</div>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title"><img src="../images/main_title04.gif" alt="월간일정 CALENDAR" /></p>
				<img src="../images/main_tel.gif" />
			</div>
			<div class="main_con_center">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title05.gif" alt="월간일정 CALENDAR" /></p>
				<div class="cal_top">
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="13px;" />
							<col width="*" />
							<col width="13px;" />
						</colgroup>
						<tr>
							<!-- 이전달 보기 -->
							<td><img src="../images/cal_a01.gif" style="margin-top:3px; cursor:pointer;" id="month_prev"
										/></td>
							<!-- 년/월 표시 -->
							<td style="font-weight:bold; font-size:24px;" id="calendar_n_view">
								2020년 06월
							</td>
							<!-- 다음달 보기 -->
							<td><img src="../images/cal_a02.gif" style="margin-top:3px; cursor:pointer;" id="month_next"
										/></td>
						</tr>
					</table>
				</div>
				<div class="cal_bottom" id="calendar_view">
					<!-- 실제 달력이 출력되는 영역 -->
					<!-- <table cellpadding="0" cellspacing="0" border="0" class="calendar">
						<colgroup>
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="*" />
						</colgroup>
						<tr>
							<th><img src="../images/day01.gif" alt="S" /></th>
							<th><img src="../images/day02.gif" alt="M" /></th>
							<th><img src="../images/day03.gif" alt="T" /></th>
							<th><img src="../images/day04.gif" alt="W" /></th>
							<th><img src="../images/day05.gif" alt="T" /></th>
							<th><img src="../images/day06.gif" alt="F" /></th>
							<th><img src="../images/day07.gif" alt="S" /></th>
						</tr>
						<tr>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">1</a></td>
							<td><a href="">2</a></td>
							<td><a href="">3</a></td>
						</tr>
						<tr>
							<td><a href="">4</a></td>
							<td><a href="">5</a></td>
							<td><a href="">6</a></td>
							<td><a href="">7</a></td>
							<td><a href="">8</a></td>
							<td><a href="">9</a></td>
							<td><a href="">10</a></td>
						</tr>
						<tr>
							<td><a href="">11</a></td>
							<td><a href="">12</a></td>
							<td><a href="">13</a></td>
							<td><a href="">14</a></td>
							<td><a href="">15</a></td>
							<td><a href="">16</a></td>
							<td><a href="">17</a></td>
						</tr>
						<tr>
							<td><a href="">18</a></td>
							<td><a href="">19</a></td>
							<td><a href="">20</a></td>
							<td><a href="">21</a></td>
							<td><a href="">22</a></td>
							<td><a href="">23</a></td>
							<td><a href="">24</a></td>
						</tr>
						<tr>
							<td><a href="">25</a></td>
							<td><a href="">26</a></td>
							<td><a href="">27</a></td>
							<td><a href="">28</a></td>
							<td><a href="">29</a></td>
							<td><a href="">30</a></td>
							<td><a href="">31</a></td>
						</tr>
						<tr>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
							<td><a href="">&nbsp;</a></td>
						</tr>
					</table> -->
				</div>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title06.gif" alt="사진게시판 PHOTO BOARD" /><a href="../space/lists.jsp?bname=photoboard"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_photo_list">
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<%@ include file="../include/quick.jsp"%>
	</div>

	<%@ include file="../include/footer.jsp"%>
	
</center>
</body>
</html>