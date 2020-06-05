<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="isFlag.jsp" %>

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
					<img src="../images/space/<%=boardTitle %>.gif" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %><p>
				</div>
			<div>

<script>
function checkValidate(frm) {
	if(frm.title.value==""){
		alert("제목을 입력해주세요");//경고창 띄움
		frm.title.focus();//입력란으로 포커스 이동
		return false;//전송되지 않도록 이벤트리스너로 false반환
	}
	if(frm.content.value==""){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	}
}
</script>
			<form action="writeProc.jsp" method="post" onsubmit="return checkValidate(this);" >
				<table class="table table-bordered">
				<input type = "hidden" name="bname" value="<%=bname %>" />
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
					<tbody>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">제목</th>
							<td>
								<input type="text" name="title" class="form-control" />
							</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">내용</th>
							<td>
								<textarea rows="10" class="form-control" name="content"></textarea>
							</td>
						</tr>
<%if(bname.equals("information")){ %>
						 <tr>
							<th class="text-center" 
								style="vertical-align:middle;">첨부파일</th>
							<td>
								<input type="file" class="form-control" />
							</td>
						</tr>
<%} %>
					</tbody>
					</table>
					<div class="col text-right" style="">
						<!-- 각종 버튼 부분 -->
						<button type="button" class="btn btn-warning" onclick="location.href='lists.jsp?bname=freeboard';">리스트보기</button>
						<button type="reset" class="btn btn-dark">Reset</button>
						<button type="submit" class="btn btn-danger">전송하기</button>
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