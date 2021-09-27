<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE_write</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/coffee/writeform.js" charset="utf-8"></script>
<style>
	h1{font-size: 1.5rem; text-align: center; color: #1a92b9}
	.container{width:60%}
	label{font-weight: bold}
	#upfile{display: none}
</style>
</head>
<body>
 <jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%=4%>"/>
	</jsp:include> 
<h2 style="text-align: center;">MVC 게시판-write 페이지</h2>
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
                 <div class="col-xs-12 col-sm-12 col-md-12">
                	<form action="add" method="post" enctype="multipart/form-data" name="boardform">
		<div class="form-group">
			<label for="user_nickname">글쓴이</label>
			<input name="USER_NICKNAME" id="user_nickname" value="관리자" readOnly
			type="text" class="form-control"
			placeholder="Enter board_name"><!-- ${id} -->
		</div>
		<div class="form-group">
			<label for="board_pass">비밀번호</label>
			<input name="COFFEE_PASS" id="board_pass" type="password"
			 class="form-control" placeholder="Enter board_pass">
		</div>
		<div class="form-group">
			<label for="board_subject">제목</label>
			<input name="COFFEE_SUBJECT" id="board_subject" type="text"
			 class="form-control" placeholder="Enter board_subject">
		</div>
		<div class="form-group">
			<label for="board_content">내용</label>
			<textarea name="COFFEE_CONTENT" id="board_content" 
			rows="10" class="form-control"></textarea>
		</div>
		<div class="form-group">
			<label for="board_file">파일 첨부</label>
			<label for="upfile">
				<img src="../resources/img/attach.png" alt="파일첨부" width="20px">
			</label>
			<input  type="file" id="upfile" name="uploadfile">
			 <span id="filevalue"></span>
		</div>
		<div>
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-danger">취소</button>
		</div>
		</form>
                </div>

 </div>
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
     <!-- footer -->
     <jsp:include page="../footer.jsp" /> 
</body>
</html>