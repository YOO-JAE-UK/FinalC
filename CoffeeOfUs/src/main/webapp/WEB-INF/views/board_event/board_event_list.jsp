<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=4%>" />
</jsp:include>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board_event_list.css"
	type="text/css">

<style>
body {
	font-size: 1.4rem !important;
}

.sidebar {
	margin: 0;
	padding: 0;
	width: 200px;
	background-color: #f1f1f1;
	height: 100%;
	overflow: auto;
}

/* Sidebar links */
.sidebar a {
	display: block;
	color: #607d8b;
	padding: 20px;
	position: relative;
	top: 70px;
	text-decoration: none;
}

/* Active/current link */
.sidebar a.active {
	background-color: #607d8b;
	color: white;
}

/* Links on mouse-over */
.sidebar a:not (.active ):hover {
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

/* On screens that are less than 400px, display the bar vertically, instead of horizontally */
@media screen and (max-width: 400px) {
	.sidebar a {
		text-align: center;
		float: none;
	}
}

body>div>table>tbody>tr:nth-child(1) {
	text-align: center
}

td:nth-child(1) {
	width: 20%
}

.comment_info_button:active {
	color: #979797 !important
}

body>div>table>tbody>tr:nth-child(5)>td:nth-child(2)>a {
	color: black
}

body>div>table>tbody tr:last-child {
	text-align: center;
}

.btn-primary {
	background-color: #4f97e5
}

.CommentWriter {
	display: none
}

#comment>table>tbody>tr>td:nth-child(2) {
	width: 60%
}

#count {
	position: relative;
	background: orange;
	color: white;
	border-radius: 30%;
}
</style>
</head>
<body>

	<input id="id" type="hidden" value='${id }'>

	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="attendCheck">커 피 정 보 게 시 판</a> <a class="active"
					href="#news">출 석 게시판</a> <a href="#contact">추 천 음 악 게 시 판</a><a
					href="#contact">투 어 게 시 판</a> <a href="#contact">Q & A</a>

			</div>
		</div>

		<div class="container calendar-container col-sm-5"
			style="position: relative; right: 30px; height: 60%; margin-top: 30px">

			<div id="comment">
				<button class="btn btn-warning float-left"
					style="border: none; width: 25%">총 50자까지 가능합니다.</button>

			<c:if test="${id}">
				<button class="btn btn-info"
					style="border: none; margin-left: 86px; width: 30%">${id}님
					환영홥니다.</button>
			</c:if>
				<button id="write" class="btn btn-warning float-right"
					style="border: none; width: 10%">등록</button>
				<textarea rows=3 class="form-control" placeholder="내용을 입력하세요..."
					id="content" maxLength="50"></textarea>

			</div>


			<div class="CommentBox">


				<div class="comment_option">
					<h3 class="comment_title">
						게시글<sup id="count"></sup>
					</h3>
					<div class="comment_tab">
						<ul class="comment_tab_list">
						</ul>

					</div>
				</div>
				<ul class="comment_list">
				</ul>
				<div class="CommentWriter">
					<div class="comment_inbox">
						<b class="comment_inbox_name">${id}</b> <span
							class="comment_inbox_count">0/50</span>

						<textarea placeholder="댓글을 남겨보세요" rows='1'
							class="comment_inbox_text" maxlength="50"></textarea>


					</div>
					<div class="register_box">
						<div class="button btn_cancel">취소</div>
						<div class="button btn_register">등록</div>
					</div>

				</div>


			</div>

			<div class="center-block">
				<ul class="pagination justify-content-center">

				</ul>
			</div>
		</div>
		<div class="col-sm-2 point"
			style="float: left; position: relative; top: 20px; right: 50px"></div>


	</div>


	<jsp:include page="../footer.jsp" />
</body>
<script src="../resources/js/event/board_event.js" charset="utf-8"></script>



</html>