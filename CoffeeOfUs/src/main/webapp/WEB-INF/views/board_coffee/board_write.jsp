<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE_write</title>
 <jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%=4%>"/>
	</jsp:include> 
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/coffee/writeform.js" charset="utf-8"></script>
<style>
	h1{font-size: 1.5rem; text-align: center; color: #1a92b9}
	.container{width:60%}
	label{font-weight: bold}
	#upfile{display: none}
	
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
<h2 style="text-align: center;">MVC 게시판-write 페이지</h2>
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



		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>
     <!-- footer -->
     <jsp:include page="../footer.jsp" /> 
</body>
</html>