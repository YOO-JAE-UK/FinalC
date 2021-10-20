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
#buy, #cart {
	border: none;
	width: 26.5%
}

#cart {
	background: red !important;
	color: white !important;
	border-radius: .25rem !important;
	height: 40px !important;
	padding-right: 17px;
}

#buy {
	float: right;
	position: relative;
	bottom: 56px;
	right: 143px;
	background: #17a2b8 !important;
	color: white !important;
	border-radius: .25rem !important;
	height: 40px !important;
}

#cquantity {
	margin-left: 50px !important;
	width: 50px !important
}

.quantity-left-minus {
	margin-left: 15px
}

.input-group {
	margin-top: 40px
}

#back {
	width: 40px;
	position: relative;
	top: 10px;
	left: 5px;
}

#perpoint {
	width: 20%;
	border: none;
	text-align: center;
	padding-right: 0px
}

#productname {
	
}

#remain {
	position: relative;
	top: 48px;
	left: 44px;
	font-size: 14px
}

#plus {
	position: relative;
	right: 1px;
}

#unitpoint {
	color: gray;
	font-size: 14px;
	position: relative;
	left: 18px;
	bottom: 1px;
}

#PayMount {
	border: none !important;
	border-radius: .25rem !important;
	position: relative;
	left: 2xp !important;
	bottom: 2px !important;
	height: 10% !important;
	background: #28a745 !important;
	text-align: center !important
}
</style>
</head>
<body>

	<img src="../resources/img/back.png" class="img-fluid" id="back"
		alt="Colorlib Template" onclick="location.href='list'">
	<form action="addtoCart" method="post">
		<c:set var="p" value="${product}" />
		<input type="hidden" name="id" id="id" value="${id}"> <input
			type="hidden" name="ccode" id="ccode" value="${p.code }"> <input
			type="hidden" name="cdescription" id="cdescription"
			value="${p.description }"> <input type="hidden"
			name="cproductname" id="cproductname" value="${p.productname }">
		<input type="hidden" name="cremain" id="cremain"
			value="${p.quantity }">
		<section class="ftco-section">
			<div class="container">
				<div class="row">

					<div class="col-lg-6 mb-5 ftco-animate">
						<a href="../upload${p.img}" class="image-popup"><img
							src="../upload${p.img}" class="img-fluid" alt="Colorlib Template">
							<input type="hidden" name="cimg" value="${p.img}"></a>
					</div>

					<div class="col-lg-6 product-details pl-md-5 ftco-animate">
						<h3>${p.productname}</h3>
						<br> <br>
						<!-- 별<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2">5.0</a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
							</p>
							<p class="text-left mr-4">
								<a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
							</p>
							<p class="text-left">
								<a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
							</p>
						</div> -->
						<p class="price">
							<span><input type="text" readonly name="cperpoint"
								value="${p.perpoint}" id="perpoint">P </span><span
								id="unitpoint">(개당 포인트)</span>
						</p>
						<br>
						<h6 Style="margin-bottom: 6px">Description</h6>
						<p>${p.description}</p>
						<div class="row mt-4">

							<div class="w-100"></div>
							<div class="input-group col-md-7 d-flex mb-5">
								<span class="input-group-btn mr-2">
									<button type="button" class="quantity-left-minus btn"
										id="minus" data-type="minus" data-field="">
										<i class="ion-ios-remove"></i>
									</button>
								</span> <input type="text" id="cquantity" name="cquantity" readonly
									class="form-control input-number" value="1" min="1" max="100">
								<span class="input-group-btn ml-2">
									<button type="button" class="quantity-right-plus btn" id="plus"
										data-type="plus" data-field="">
										<i class="ion-ios-add"></i>
									</button>

								</span>

							</div>
							<span id="remain">(남은수량:${p.quantity }개)</span>
							<div class="w-100"></div>

						</div>
						<div>
							<b style="font-size: 12px; position: relative; bottom: 18px">(결
								제 포 인 트)</b> <input type="text" readonly
								style="background: #28a745; color: white; border: none; text-align: center; position: relative; bottom: 15px; left: 2px; width: 50%; height: 40px; border-radius: .25rem; font-size: 20px;"
								id="PayAmount" value="${p.perpoint }">
						</div>
						<div class="button">
							<p>

								<button type="submit" class="btn btn-success" id="cart">장바구니
									추가</button>
							</p>
							<p>


								<button type="button" class="btn btn-info" id="buy">결제하기</button>
							</p>
						</div>
					</div>

				</div>
			</div>

		</section>
	</form>
	<script src="../resources/js/point_store/product_detail.js"
		charset="utf-8"></script>
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