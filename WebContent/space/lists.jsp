<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="util.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="isFlag.jsp" %> 
<%
//한글깨짐처리 - 검색폼에서 입력된 한글이 전송되기 때문
request.setCharacterEncoding("UTF-8");

//web.xml에 저장된 컨텍스트 초기화 파라미터를 application객체를 통해 가져옴
String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

//DAO객체 생성 및 DB커넥션
BbsDAO dao = new BbsDAO(drv, url);


Map<String,Object> param = new HashMap<String,Object>();

//검색어 입력시 전송된 폼값을 받아 Map에 저장
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null){
	//검색어를 입력한 경우 Map에 값을 입력함.
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
}

//Board테이블에 입력된 전체레코드 갯수를 카운트하여 반환받음
int totalRecordCount = dao.getTotalRecordCount(param);

//조건에 맞는 레코드를 select하여 결과셋을 List컬렉션으로 반환받음
List<BbsDTO> bbs = dao.selectList(param);

//DB연결해제
dao.close();

%>

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
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %><p>
				</div>
				<div>

<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<form class="form-inline">	
<!-- 검색 시 필수파라미터인 bname이 전달돼야 한다. -->
	<input type="hidden" name="bname" value="<%=bname %>" />
	<div class="form-group">
		<select name="keyField" class="form-control">
			<option value="">제목</option>
			<option value="">작성자</option>
			<option value="">내용</option>
		</select>
	</div>
	
	<div class="input-group">
		<input type="text" name="keyString"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
<div class="row">
	<!-- 게시판리스트부분 -->
	<table class="table table-bordered table-hover">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>첨부</th>
				</tr>
				</thead>				
				<tbody>

				<tr>
					<td colspan="6" align="center" height="100">
						등록된 게시물이 없습니다.
					</td>
				</tr>

				</tbody>
				</table>
	
</div>
			<div class="row">
				<div class="col text-right">
				<%-- 자유게시판과 질문과 답변에서만 글쓰기버튼 보임처리 --%>
				<% if(bname.equals("freeboard") || bname.equals("photoboard") || bname.equals("information")){ %>
					<button type="button" class="btn btn-primary"
						onclick="location.href='write.jsp?bname=<%= bname %>';">글쓰기</button>
				<% } %>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					
					<ul class='pagination justify-content-center'>
						${map.pagingImg }
					</ul> 
				</div>				
			</div>	
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>