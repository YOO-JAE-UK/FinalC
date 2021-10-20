<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE_view</title>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/coffee/view3.js"></script>
<style>
body > div > table > tbody >tr:nth-child(1) {
	text-align: center
}

td:nth-child(1) {
	width: 20%
}

a {
	color: white
}

body > div > table > tbody tr:last-child {
	text-align: center;
}

.btn-primary {
	background-color: #4f97e5
}

#myModal {
	display: none
}

#comment > table > tbody > tr > td:nth-child(2){
 width:60%
}
#count{
    position: relative;
    top: -10px;
    left: -10px;
    background: orange;
    color: white;
    border-radius: 30%;
}

textarea{resize:none}

form[action=down] > input[type=submit]{
    position: relative;
    top: -20;
    left: 10px;
    border: none;
    cursor : pointer;
}

   .sidebar {
	margin: 0;
	padding: 0;
	width: 200px;
	background-color: #f1f1f1;
	height: 100%;
	overflow: auto;
	min-height: 400px;
}

/* Sidebar links */
.sidebar a {
	display: block;
	color: black;
	padding: 20px;
	position: relative;
	top: 100px;
	text-decoration: none;
	font-size: 16px;
}

/* Active/current link */
.sidebar a.active {
	background-color: #37586f;
	color: white;
}

/* Links on mouse-over */
.sidebar a:not(.active ):hover {
	background-color: #9e9e9e;
	color: white;
}

/* Page content. The value of the margin-left property should match the value of the sidebar's width property */
div.content {
	margin-left: 200px;
	padding: 1px 16px;
	height: 1000px;
}

/* On screens that are less than 700px wide, make the sidebar into a topbar */
@media screen and (max-width: 700px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		float: left;
	}
	div.content {
		margin-left: 0;
	}
}
</style>
<script>

	var result="${result}";
	if(result == 'passFail'){
		alert("비밀번호가 일치하지 않습니다.")
	}
	$(function(){
		$("form[action=delete]").submit(function() {
			if ($("#board_pass").val()==''){
				alert("비밀번호를 입력하세요");
				$("#board_pass").focus();
				return false;
			}
			
		})
	})
</script>
</head>
<body>
	


<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a class="active" href="list">커피 정보 게시판</a> 
				<a href="Fword">출석 게시판</a>
				<a href="Beans">투어게시판</a>
				<a href="Beans">Q & A</a>
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px; margin-bottom: 30px;">
			
			


 <div class="col-xs-12 col-sm-12 col-md-9">
 <h2 style="text-align: center;">Detail</h2>
                	<input type="hidden" value="${id}" id="loginid" name="loginid">

		<table class="table table-striped">
			<tr><th colspan="2">MVC 게시판-view페이지</th></tr>
			<tr>
				<td>글쓴이</td>
				<td><div>${boarddata.USER_ID}</div></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><c:out value="${boarddata.COFFEE_SUBJECT}" /></td>
			</tr>
			<tr>
				<td><div>내용	</div></td>
				<td style="padding-right:0px"><textarea class="form-control" rows="5"
					readOnly >${boarddata.COFFEE_CONTENT}</textarea></td>
			</tr>
			<c:if test="${boarddata.COFFEE_RE_LEV==0}"><%--원문글인 경우에만 첨부파일을 추가 할 수 있습니다. --%>
				<tr>
					<td>
						<div>첨부파일</div>
					</td>
					<c:if test="${!empty boarddata.COFFEE_FILE}"><%--파일첨부한 경우 --%>
						<td>
							<form method="post"	action=down>
								<img src="../resources/img/down.png" width="10px">
								<input type="hidden" value="${boarddata.COFFEE_FILE }" name=filename><!-- filename -->
								<input type="hidden" value="${boarddata.COFFEE_ORIGINAL }" name=original><!-- original -->
								<input type="submit" value="${boarddata.COFFEE_ORIGINAL }">
							</form>
						</td>
					</c:if>
					
					<c:if test="${empty boarddata.COFFEE_FILE}"><%--파일첨부하지 않은 경우 --%>
						<td></td>
					</c:if>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="2" class="center">
					<button class="btn btn-primary start">댓글</button>
					<span id="count">${count}</span>
				<c:if test="${boarddata.USER_ID == id || id=='admin' }">
					<a href="modifyView?num=${boarddata.COFFEE_NUM }">
						<button class="btn btn-warning">수정</button>
					</a>
					<%-- href의 주소를 #으로 설정합니다. --%>
					<a href="#">
						<button class="btn btn-danger" data-toggle="modal"
						data-target="#myModal">삭제</button>
					</a>
					<c:if test="${boarddata.COFFEE_RE_LEV <1 }">
					<a href="replyView?num=${boarddata.COFFEE_NUM}">
						<button class="btn btn-info">답변</button>
					</a>
					</c:if>
				</c:if>
				
				<a href="list">
					<button class="btn btn-success">목록</button>
				</a>
				</td>
			</tr>
		</table>
		<%-- 게시판 view end --%>
			
			<%--modal 시작 --%>
			<div class="modal" id="myModal">
			 <div class="modal-dialog">
			  <div class="modal-content">
			   <%-- Modal body --%>
			   <div class="modal-body">
			   	<form name="deleteForm" action="delete" method="post">
			   	<%-- http://localhost:8088/Board/BoardDetailAcion.bo?num=22
			   		주소를 보면 num을 파라미터로 넘기고 있습니다.
			   		이 값을 가져와서 ${param.num}를 사용
			   		또는 ${boarddata.board_num} 
			   	--%>
			   	<input type="hidden" name="num" id="board_num" value="${param.num}"> <!-- name이 num이였음 -->
			   	<div class="form-group">
			   		<label for="pwd">비밀번호</label>
			   		<input type="password"
			   			class="form-control" placeholder="Enter password"
			   			name="BOARD_PASS" id="board_pass">
			   	</div>
			   	<button type="submit" class="btn btn-primary">전송</button>
			   	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			   	</form>
			   </div><!-- class="modal-body" -->
			  </div><!-- class="modal-content" -->
			 </div><!-- class="modal-dialog" -->
			</div><!-- class="modal end"  <div class="modal" id="myModal">-->
			
			<div id="comment">
				<button class="btn btn-info float-left">총 50자까지 가능합니다.</button>
				<button id="write" class="btn btn-info float-right">등록</button>
				<textarea rows=3 class="form-control"
							id="content" maxlength="50"></textarea>
				<table class="table table_striped">
					<thead>
						<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
					</thead>	
					<tbody>
					
					</tbody>	
				</table>
				 <div id="message"></div>
			</div>
                </div>



		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>