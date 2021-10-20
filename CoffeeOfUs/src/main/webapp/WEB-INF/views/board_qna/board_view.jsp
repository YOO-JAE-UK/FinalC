<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA_board_view</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/qna/view3.js"></script>
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

textarea{
	resize:none;
	font-size:15px;
}

form[action=down] > input[type=submit]{
    position: relative;
    top: -20;
    left: 10px;
    border: none;
    cursor : pointer;
}
.container, #write, #font-id, #content, #board_pass{
	font-size:15px;
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
	<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

	 <section class="upcoming-classes spad">
	 
        <div class="container">
         <div class="row">
                 
                <div class="col-xs-12 col-sm-12 col-md-12">
                <c:choose>
                <c:when test="${name=='' }">
                	<input type="hidden" value="${id}" id="loginid" name="loginid">
                </c:when>
                <c:otherwise>
                	<input type="hidden" value="${name}" id="loginid" name="loginid">
                </c:otherwise>
                </c:choose>

		<table class="table table-striped" id="list_font">
			<h4 style="text-align: center;">QNA 게시글 보기</h4><br>
			<tr >
				<td>글쓴이</td>
				<c:choose>
				<c:when test="${name=='' }">
				<td><div>${boarddata.USER_ID}</div></td>
				<input name="USER_ID" id="user_id" value="${id}" readOnly
								type="hidden" class="form-control" placeholder="Enter board_name">
				</c:when>
				<c:otherwise>
				<td><div>${boarddata.USER_NICKNAME}</div></td>
				<input name="USER_ID" id="user_id" value="${name}" readOnly
								type="hidden" class="form-control" placeholder="Enter board_name">
				</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>제목</td>
				<td><c:out value="${boarddata.QNA_SUBJECT}" /></td>
			</tr>
			<tr>
				<td><div>내용	</div></td>
				<td style="padding-right:0px"><textarea class="form-control" rows="5" id="font-id"
					readOnly >${boarddata.QNA_CONTENT}</textarea></td>
			</tr>
			<c:if test="${boarddata.QNA_RE_LEV==0}"><%--원문글인 경우에만 첨부파일을 추가 할 수 있습니다. --%>
				<tr>
					<td>
						<div>첨부파일</div>
					</td>
					<c:if test="${!empty boarddata.QNA_FILE}"><%--파일첨부한 경우 --%>
						<td>
							<form method="post"	action=down>
								<img src="../resources/img/down.png" width="10px">
								<input type="hidden" value="${boarddata.QNA_FILE }" name=filename><!-- filename -->
								<input type="hidden" value="${boarddata.QNA_ORIGINAL }" name=original><!-- original -->
								<input type="submit" value="${boarddata.QNA_ORIGINAL }">
							</form>
						</td>
					</c:if>
					
					<c:if test="${empty boarddata.QNA_FILE}"><%--파일첨부하지 않은 경우 --%>
						<td></td>
					</c:if>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="2" class="center">
					<button class="btn btn-primary start" id="font-id">댓글</button>
					<span id="count">${count}</span>
				<c:if test="${boarddata.USER_ID == id || id=='admin' }">
					<a href="modifyView?num=${boarddata.QNA_NUM }">
						<button class="btn btn-warning" id="font-id">수정</button>
					</a>
					<%-- href의 주소를 #으로 설정합니다. --%>
					<a href="#">
						<button class="btn btn-danger" data-toggle="modal"
						data-target="#myModal" id="font-id">삭제</button>
					</a>
				</c:if>
					<a href="replyView?num=${boarddata.QNA_NUM}">
						<button class="btn btn-info" id="font-id">답변</button>
					</a>
				
				<a href="list">
					<button class="btn btn-success" id="font-id">목록</button>
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
			   	<button type="submit" class="btn btn-primary" id="font-id">전송</button>
			   	<button type="button" class="btn btn-danger" data-dismiss="modal" id="font-id">취소</button>
			   	</form>
			   </div><!-- class="modal-body" -->
			  </div><!-- class="modal-content" -->
			 </div><!-- class="modal-dialog" -->
			</div><!-- class="modal end"  <div class="modal" id="myModal">-->
			
			<div id="comment">
				<button class="btn btn-info float-left" id="font-id">총 50자까지 가능합니다.</button>
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
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
 
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>