<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=2%>" />
</jsp:include>

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
<style>
body {
	font-size: 1.4rem !important;
}

.eventWrapContent_right {
	psition: relative;
	width: 100px;
	height: 20px !important;
	border-radius: 8px;
	background: #fff;
	border: 1px solid lightgray !important;
}

.eventWrapContent__right p {
	padding-top: 90px;
	padding-bottom: 10px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-size: 18px;
	line-height: 1.44;
	letter-spacing: -.54px;
	width: 90%
}

.eventWrapContent__right .checkNumber {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	position: absolute;
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%);
	font-size: 22px;
}

.checkinEvent__number__checkin {
	margin-right: 5px;
	position: relative !important;
	bottom: 20px;
	display: block;
	width: auto;
	font-size: 45px;
	font-weight: 500;
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
	top: 100px;
	text-decoration: none;
}

/* Active/current link */
.sidebar a.active {
	background-color: #607d8b;
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
.fc-left{
	width:36% !important;
}

.fc-center{
	width:15% !important;
	
}



</style>
</head>
<body>
	<input id="id" type="hidden" value='b'>

	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a class="active" href="#home">출 석 체 크</a> <a href="roulette">룰
					렛 포 인 트</a> <a href="#contact">포 인 트 스 토 어</a>

			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; right: 30px">
			<div id="calendar"
				style="max-width: 900px; margin: 40px auto; width: 100%"></div>
		</div>
		<div data-v-8e5f91ac="" class="eventWrapContent__right col-sm-2">
			<p data-v-8e5f91ac="">나의 이달 출석횟수는?</p>
			<div data-v-8e5f91ac="" class="checkNumber">
				<span data-v-8e5f91ac="" class="checkinEvent__number__checkin">0</span>번
			</div>
		</div>
	</div>

	<script src="../resources/js/event/attendCheck.js" charset="utf-8"></script>
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