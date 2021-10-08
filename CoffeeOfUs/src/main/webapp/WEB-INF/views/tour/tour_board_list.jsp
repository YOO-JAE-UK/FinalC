<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/tour/list.js" charset="utf-8"></script>

   <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=5%>" />
</jsp:include>
<script> 
var result="${message}";
if(result == 'deleteFail'){
	alert("삭제 실패!");
}else if(result == 'deleteSuccess'){
	alert("삭제 성공!");
}

</script>

<style>
 video {
    max-width: 100%;
  }
  .card {
    transition: transform 0.2s ease;
    box-shadow: 0 4px 6px 0 rgba(22, 22, 26, 0.18);
    border-radius: 0;
    border: 0;
    margin-bottom: 1.5em;
  }
  .card:hover {
    transform: scale(1.1);
  }
  .nav-sidebar{
  	padding-top: 30px;
  }
  

.btn{
	margin-bottom: 30px;
    margin-top: 30px;
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
	color: black;
	padding: 20px;
	position: relative;
	top: 100px;
	text-decoration: none;
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

/* On screens that are less than 400px, display the bar vertically, instead of horizontally */
@media screen and (max-width: 400px) {
	.sidebar a {
		text-align: center;
		float: none;
	}
}
.over{
	overflow: hidden
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="tour_map">시 도 별지도</a> 
				<a class="active"  href="tour_board_list">투어 후기 리스트</a>

			</div>
		</div>
		<div class="container calendar-container col-sm-7" id="ajax_content"
			style="position: relative; left: -5%; margin-top:30px;">
			
				<!-- 이부분이 작성될 부분입니다.@@ -->
				
		</div><!-- <div class="container calendar-container col-sm-7" -->
		
	</div>

	<jsp:include page="../footer.jsp" />
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script
	src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<script src="https://cdn.bootcss.com/fullcalendar/3.9.0/locale-all.js"></script>
<script src="https://cdn.bootcss.com/fullcalendar/3.9.0/gcal.js"></script>
</html>