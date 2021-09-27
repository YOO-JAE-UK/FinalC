<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE_modify</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/coffee/reply.js"></script>
 <style>
 	h1{font-size: 1.5rem; text-align: center; color: #1a92b9}
	.container{width:60%}
	label{font-weight: bold}
	#upfile{display: none}
 </style>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

<h2 style="text-align: center;">Reply</h2>
	 <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
                 <div class="col-xs-12 col-sm-12 col-md-3">
                	<ul>
                		<li>커피 정보게시판</li>
                		<li>출석 게시판</li>
                		<li>추천 음악게시판</li>
                		<li>투어 게시판</li>
                		<li>Q & A</li>
                	</ul>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                	<form action="replyAction" method="post" name="boardform">
		<input type="hidden" name="COFFEE_RE_REF" value="${boarddata.COFFEE_RE_REF }">
		<input type="hidden" name="COFFEE_RE_LEV" value="${boarddata.COFFEE_RE_LEV }">
		<input type="hidden" name="COFFEE_RE_SEQ" value="${boarddata.COFFEE_RE_SEQ }">
		<div class="form-group">
			<label for="board_name">글쓴이</label>
			<input name="USER_ID" id="board_name" value="${id}" readOnly
			type="text" class="form-control"
			placeholder="Enter board_name">
		</div>
		<div class="form-group">
			<label for="board_subject">제목</label>
			<textarea name="COFFEE_SUBJECT" id="board_subject" rows="1" 
			 class="form-control" maxlength="100"> Re:${boarddata.COFFEE_SUBJECT}</textarea>
		</div>
		<div class="form-group">
			<label for="board_content">내용</label>
			<textarea name="COFFEE_CONTENT" id="board_content"  rows="10"
			 class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="board_pass">비밀번호</label>
			<input name="COFFEE_PASS" id="board_pass"
			 type="password" class="form-control">
		</div>
		
		<div class ="form-group">
			<input type=submit class="btn btn-primary" value="등록">
			<input type=button class="btn btn-danger" value="취소"
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