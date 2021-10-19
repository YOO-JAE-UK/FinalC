<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA_board_write</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/qna/writeform.js" charset="utf-8"></script>
<style>
h1 {
	font-size: 1.5rem;
	text-align: center;
	color: #1a92b9
}

.container {
	width: 60%;
	font-size:15px;
}
#user_id, #user_nickname, #board_pass, 
#board_subject, #board_content,
#font-btn {
	font-size:15px;
}

label {
	font-weight: bold
}

#upfile {
	display: none
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp">
		<jsp:param name="num" value="<%=4%>" />
	</jsp:include>
	<section class="upcoming-classes spad">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<form action="add" method="post" enctype="multipart/form-data"
						name="boardform">
				      <h4 style="text-align: center;">QNA - 글쓰기 게시판</h4><br>
						<div class="form-group">
							<label for="user_nickname">글쓴이</label> 
							
						<c:choose>
						   <c:when test="${name==''}">
							<input name="USER_NICKNAME" id="user_nickname" value="${id}" readOnly
								type="text" class="form-control" placeholder="Enter board_name">
							</c:when>
							<c:otherwise>
							<input name="USER_NICKNAME" id="user_nickname" value="${name}" readOnly
								type="text" class="form-control" placeholder="Enter board_name">
							</c:otherwise>
						</c:choose>		
						</div>
						<div class="form-group">
							<input name="USER_ID" id="user_id" value="${id}" readOnly
								type="hidden" class="form-control" placeholder="Enter board_name">
						</div>
							
						<div class="form-group">
							<label for="board_pass">비밀번호</label> 
							<input name="QNA_PASS"
								id="board_pass" type="password" class="form-control"
								placeholder="Enter board_pass">
						</div>
						<div class="form-group">
							<label for="board_subject">제목</label> 
							<input name="QNA_SUBJECT"
								id="board_subject" type="text" class="form-control"
								placeholder="Enter board_subject">
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea name="QNA_CONTENT" id="board_content" rows="10"
								class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label for="board_file">파일 첨부</label> <label for="upfile">
								<img src="../resources/img/attach.png" alt="파일첨부" width="20px">
							</label> 
								<input type="file" id="upfile" name="uploadfile"> 
								<span id="filevalue"></span>
						</div>
						<div>
							<button type="submit" class="btn btn-primary" id="font-btn">등록</button>
							<button type="reset" class="btn btn-danger" id="font-btn" onClick="history.go(-1)">취소</button>
						</div>
					</form>
				</div>
			</div>
			<!-- <div class="row"> end -->
		</div>
		<!-- container end -->
	</section>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>