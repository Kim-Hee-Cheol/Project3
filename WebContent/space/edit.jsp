<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="isFlag.jsp" %>
<%@ include file="isLogin.jsp" %>

<%
//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);


//게시물을 가져와서 DTO객체로 변환
BbsDTO dto =dao.selectView(num);

dao.close();
%>


<script>
function checkValidate(frm) {
	if(frm.title.value==""){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	}
}

</script>				
<body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>
		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/space/<%=boardTitle %>.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %>&nbsp;>&nbsp;상세보기&nbsp;>&nbsp;수정하기<p>
				</div>
			<div>

<form name="editFrm" method="post" action="editProc.jsp"
					onsubmit="return checkValidate(this);"">
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<input type="hidden" name="bname" value="<%=bname %>"/>
<table class="table table-bordered">
<colgroup>
	<col width="20%"/>
	<col width="30%"/>
	<col width="20%"/>
	<col width="*"/>
</colgroup>
<tbody>
	<tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">제목</th>
		<td>
			<input type="text" class="form-control" name="title" value="<%=dto.getTitle() %>" />
		</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">내용</th>
		<td>
			<textarea rows="10" 
				class="form-control" name="content"><%=dto.getContent() %></textarea>
		</td>
	</tr>


</tbody>
</table>

<div class="col text-right" style="">
	<!-- 각종 버튼 부분 -->
	<button type="submit" class="btn btn-primary">작성완료</button>
	<button type="reset" class="btn btn-success">Reset</button>	
	<button type="button" class="btn btn-warning" 
		onclick="location.href='lists.jsp?bname=freeboard';">리스트보기</button>
</div>
</form> 

				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>