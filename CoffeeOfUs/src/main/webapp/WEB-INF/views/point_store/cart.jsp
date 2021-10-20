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
body {
	font-size: 15px !important
}

#quantity {
	margin-left: 47px !important;
}

.thead-primary {
	background: #17a2b8 !important
}

.table .thead-primary tr th {
	font: 15px !important;
	font-family: "Poppins", Arial, sans-serif !important;
}

#total {
	border: 1px solid rgba(0, 0, 0, 0.05);
	text-align: center;
	color: #17a2b8;
}

b {
	font-wight: 400;
	color: #607d8b
}

.payment {
	float: right;
	position: relative;
	right: 123px;
}

#pay {
	width: 100%;
	color: white !important;
	height: 40px !important;
	margin-top: 10px;
}

.productNum {
	position: relative;
	right: 75px;
	bottom: 15px
}

#submessage {
	margin-left: 80px;
	cursor: pointer;
	font-size: 1.7rem
}

.table {
	min-height: 350px !important;
	min-width: 800px !important
}

#message {
	position: relative;
	top: -167px;
	left: 400px;
	font-size: 2rem
}

button[type=button] {
	cursor: pointor
}

tbody a:hover {
	background: #17a2b8 !important
}

i {
	color: #17a2b8 !important
}

#backtolist {
	color: white !important;
	position: relative !important;
	top: 37px;
	left: 156px;
	width: 10%;
	height: 40px !important;
}

#rmain {
	font-size: 12px;
	color: gray;
	position: relative;
	bottom: 9px;
	left: 9px;
}
</style>

</head>



<body>

	<input id="id" type="hidden" value='${id }'>
	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>상 품 명</th>
									<th>포 인 트</th>
									<th>수 량</th>
									<th>합 계</th>
								</tr>
							</thead>
							<tbody>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="message"></div>
			<div id="submessage"></div>
		</div>

		<button type='button' class="btn btn-info" id="backtolist">스토어로
			가기</button>
		<div class="payment" id="payment">
			<div class="Tpoint">
				<b>총 결 제 포 인 트</b> &nbsp; <input type="text" name="total" id="total"
					value="100P" readonly>
			</div>
			<div class="cashpay">
				<button id="pay" type="button" class="btn btn-info">바 로 결
					제</button>
			</div>
		</div>

	</section>






	<script src="../resources/js/point_store/cart.js" charset="utf-8"></script>
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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>



</html>