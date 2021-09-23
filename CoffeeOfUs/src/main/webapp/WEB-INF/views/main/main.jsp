<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Story</title>
 <!-- Css Styles -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<script src="../resources/js/jquery-3.6.0.js"></script>


<script>
<% String num = request.getParameter("num");%>
	var i1=<%=num%>;
		//alert(i1+"i의 값");
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<!-- include안에 파람 -->
 <!-- main content -->
<h1 style="text-align: center;">메인입니다.</h1>
	 <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
                 <div class="col-xs-12 col-sm-12 col-md-3">
                	hi~
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6">
                	hi~
                </div>
                <div class="col-xs-12 col-sm-12 col-md-3">
                	hi~
                </div>
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
<jsp:include page="../footer.jsp"></jsp:include>
 
</body>
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.nice-select.min.js"></script>
    <script src="../resources/js/jquery.barfiller.js"></script>
    <script src="../resources/js/jquery.slicknav.js"></script>
    <script src="../resources/js/owl.carousel.min.js"></script>
    <script src="../resources/js/main.js"></script>
</html>