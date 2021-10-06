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
	src="http://script.gmkt.kr/_Net/js/core/promotion/event/jQueryRotate.2.2.js"></script>

<style>
body {
	font-size: 1.4rem !important;
}

#wrapper {
	position: relative;
	overflow: hidden;
	width: 560px;
	height: 576px;
	background: #badafe url(../resources/img/roulette_bg.png) 0 4px;
}

#wrapper .pin {
	position: absolute;
	top: 2px;
	left: 230px;
	z-index: 9999;
	background-size: 100px !important;
	width: 100%; height : 100%;
	background: url(../resources/img/pin.png) no-repeat;
	height: 100%;
}

#wrapper .button_start {
	overflow: hidden;
	display: block;
	position: absolute;
	top: 231px;
	left: 226px;
	z-index: 9999;
	width: 20%;
	height: 20%;
	font-size: 150px;
	color: transparent;
	zoom: 1;
}

#wrapper .roulette {
	padding: 40px 0 0 32px;
}

#wrapper.corver_rullet .corver_rullet_img {
	display: block;
}

#wrapper .corver_rullet_img {
	position: absolute;
	top: 231px;
	left: 226px;
	z-index: 30;
}

.buttonGroup[data-v-326a8cd1] {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-pack: distribute;
	justify-content: space-around;
}

#wrapper .roulette ul {
	position: absolute;
	left: -999em;
	top: -999em;
}

.sidebar {
	margin: 0;
	padding: 0;
	width: 200px;
	background-color: #f1f1f1;
	height: 100%;
	overflow: auto;
}
#point{
    float: left;border:1px solid lightgray;
    width:50%;height:50px;
	padding-top:13px;
	text-align:center;
	border-radius:5px 0 0 5px;
	color:gray;
}
#mypoint{
	float: left;border:1px solid lightgray;
	border-left:none;width:50%;
	padding-top:13px;
	height:50px;
	text-align:center;
	border-radius:0 5px 5px 0;
	color:gray;
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
</style>
</head>
<body>
	<input id="id" type="hidden" value='a'>

	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="attendCheck">출 석 체 크</a> <a class="active" href="#news">룰
					렛 게 임</a> <a href="#contact">포 인 트 스 토 어</a>

			</div>
		</div>
		<div class="container calendar-container col-sm-5"
			style="position: relative; right: 30px">
			
			<div id="wrapper" class="corver_rullet">
				
				<!-- WPR-3090 -->
				<div class="pin"></div>
				<a href="javascript:void(0);" onclick="rotation();"
					class="button_start">룰렛 돌리고 출석체크하고 START!</a>
				<!-- //WPR-3090 -->

				<div class="roulette">
					<img alt="플러스존 출석체크 혜택 목록" title="하단 내용 참조" id="roulette_base"
						src="../resources/img/base.png" style="transform: rotate(247deg);">
					<!-- D: 관리자 등록 이미지 -->
					<img class="corver_rullet_img" width=20% height=20%
						src="../resources/img/start.png" alt="">
					<!-- D: 커버 이미지 -->

				</div>
			</div>
			
		</div>
		<div class="col-sm-3 point" style="float: left;position:relative;top:20px;right:50px">
		   	
			<div id="point" >현재 포인트</div>
			<div id="mypoint" >0&nbsp;P</div>
		   							
		</div>

	</div>


	<jsp:include page="../footer.jsp" />
</body>
<script
	src="http://script.gmkt.kr/_Net/js/core/promotion/event/jQueryRotate.2.2.js"></script>
s


</html>