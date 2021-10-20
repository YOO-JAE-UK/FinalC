<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=2%>" />
</jsp:include>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/jquery.timepicker.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/point_store/style.css">

<style>
button {
	float: right;
	position: relative;
	top: -90px;
	right: 5px;
}

ul>li>.lin:hover {
	background-color: #8bc34a;
	color: white;
}

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

#point {
	float: left;
	border: 1px solid lightgray;
	width: 50%;
	height: 30px;
	text-align: center;
	border-radius: 5px 0 0 5px;
	color: white;
	background-color: #607d8b;
	padding-top: 3px
}

#mypoint {
	float: left;
	border: 1px solid lightgray;
	border-left: none;
	width: 50%;
	height: 30px;
	text-align: center;
	border-radius: 0 5px 5px 0;
	color: white;
	background-color: #17a2b8;
	padding-top: 3px
}

/* Sidebar links */
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

.product .text p.price {
	color: #17a2b8
}

.product .text .bottom-area a {
	background-color: #17a2b8
}

.block-27 ul li.active span {
	background-color: #17a2b8
}

.cartImg{
	float:right;
	position:relative;
	left:70px;
	top:15px;
}
#cartcount{
    position: relative;
    top:-40px;
    background: #17a2b8;
    color: white;
    border-radius: 30%;
   	width:13px;
   	text-align:center;
   	left:34px;
}
h3>a{
	position:relative;
	top:10px

}

#no_product{
   min-height:300px
}
#price{
	position:relative;
	top:15px
}
.pricing{
	padding-top:25px !important;
	padding-bottom:33px !important;
	
}
.block-27 ul li a:hover{
	background:#17a2b8 !important;
	color:white !important
}
.ftco-section{
	margin-bottom:6em;
	padding-top:2em;
	position:relative;
	top:83px;
	
}

</style>
</head>
<body>
	<input id="id" type="hidden" value='${id}'>

	<div class="row">
		<div class="col-sm-1">
			<div class="sidebar">
				<a href="${pageContext.request.contextPath}/event/attendCheck">출 석 체 크</a> <a  href="${pageContext.request.contextPath}/event/roulette">룰
					렛 포 인 트</a> <a class="active" href="#home">포 인 트 스 토 어</a>

			</div>
		</div>
		<div class="container calendar-container col-sm-8"
			style="position: relative; right: 50px">
			<div class=" point"
				style="float: left; position: relative; top: 20px; left: 13px; width: 20%">

				<div id="point">My 포인트</div>
				<div id="mypoint">0P</div>

			</div>
			
			<div id="search" style="position:relative;right:68px;height:10px">
			<input type="text" id="searchword" name="searchword" style=" 
			   position:relative;top:50px;left:250px;height:30px">
			
			<button class="btn btn-info" id="searchwordbtn" style="position:relative;top:50px;right:316px;
			width:89px;border:none;height:30px">검색</button>
			</div>
			
		

			<div class="cartImg" >
				<a href="cartListView" class="link" id="cartListView"
					title="장바구니 이동"><img
					src="../resources/img/cart.svg"
					alt="" class="image"></a>
					<div id="cartcount">
					<sup style="width:30%">0</sup>
					</div>
			</div>

			<section class="ftco-section">
				<div class="container">

					<div class="row" id="product_list">
											

					</div>
					<c:if test="${id=='admin'}">	
					<button type="button" class="btn btn-primary"
						style="font-size: 1.2rem; border-radius: 10px; position: relative; top: 1px; background-color: #17a2b8">
						상품 추가</button>
					 </c:if>	 
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul id='ul_paging'>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
		
	</div>

     <script src="../resources/js/point_store/product_list.js" charset="utf-8"></script> 
	<jsp:include page="../footer.jsp" />

	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/google-map.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/point_store/main.js"></script>
</body>



</html>