<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA_board_reply</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/qna/reply.js"></script>
 <style>
 	h1{font-size: 1.5rem; text-align: center; color: #1a92b9}
	.container{width:60%; font-size: 15px;}
	label{font-weight: bold}
	#upfile{display: none}
	
	#board_name, #board_subject, 
	#board_content, #board_pass,
	#font-size{
		font-size:15px;
	}
 </style>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

	 <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
                 
                <div class="col-xs-12 col-sm-12 col-md-12">
                	<form action="replyAction" method="post" name="boardform">
		<input type="hidden" name="QNA_RE_REF" value="${boarddata.QNA_RE_REF }">
		<input type="hidden" name="QNA_RE_LEV" value="${boarddata.QNA_RE_LEV }">
		<input type="hidden" name="QNA_RE_SEQ" value="${boarddata.QNA_RE_SEQ }">
		<div class="form-group">
			<label for="board_name">글쓴이</label>
			<input name="USER_ID" id="board_name" value="${id}" readOnly
			type="text" class="form-control"
			placeholder="Enter board_name">
		</div>
		<div class="form-group">
			<label for="board_subject">제목</label>
			<textarea name="QNA_SUBJECT" id="board_subject" rows="1" 
			 class="form-control" maxlength="100"> Re:${boarddata.QNA_SUBJECT}</textarea>
		</div>
		<div class="form-group">
			<label for="board_content">내용</label>
			<textarea name="QNA_CONTENT" id="board_content"  rows="10"
			 class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="board_pass">비밀번호</label>
			<input name="QNA_PASS" id="board_pass"
			 type="password" class="form-control">
		</div>
		
		<div class ="form-group">
			<input type=submit class="btn btn-primary" id="font-size" value="등록" >
			<input type=button class="btn btn-danger" id="font-size" value="취소"
				onClick="history.go(-1)">
		</div>
		</form>
         </div>      
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
 
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>