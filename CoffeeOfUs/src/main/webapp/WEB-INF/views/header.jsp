<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8"><!-- zxx -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CoffeeOfUs</title>	

 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="../resources/js/jquery-3.6.0.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<style>
	.header__top__widget{
		height: 50px;
		padding: 5px 0px 10px;
		text-align: right;
	}
	.header__top{
		background: #313131;
	}
	.header__nav{
		background: #272727;
		padding-bottom: 10px;
	}
	.headerbtn{
		border:1px solid white;
		color: white;
	}
	.canvas__open{
		margin-top: -15px;
	}
	.cus1{
		color: white;
	}
	li{
		list-style: none;
	}

	.header__menu > ul> li{
		margin: 0 25px 0 25px;
	}
</style>

<script>
$(document).ready(function(){
	<% String num = request.getParameter("num");%>
	var num=<%=num%>;
		if(num ==1){	
			$('.coffee').addClass('active')		
		}else if(num==2){
			$('.event').addClass('active')
		}else if(num==3){
			$('.shopping').addClass('active')
		}else if(num==4){
			$('.community').addClass('active')
		}else if(num==5){
			$('.tour').addClass('active')
		}
		console.log("1");
})


</script>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu">
        <div class="offcanvas__logo">
            <a href="${pageContext.request.contextPath}/main/main"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""  width="200px" height="70px"></a><!--  -->
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__widget">
            <ul> 
                <li>CALL US: + 1 800-567-8990</li>
                <li>WRITE US: OFFICE@EXAMPLE.COM</li>
                <li>OPENING TIMES: MON - FRI: 9:00 - 19:00</li>
            </ul>
            <a href="#" class="primary-btn">JOIN US</a>
        </div>
        <nav class="header__menu">
            <ul class="mobile-menu">
                <li class="active"><a href="./index.html">커피1</a></li>
                <li><a href="./about-us.html">이벤트</a></li>
                <li><a href="./classes.html">이노코미</a></li>
                <li><a href="#">투어</a>
                    <ul class="dropdown">
                        <li><a href="./classes-details.html">Classes Details</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                        <li><a href="./pricing.html">Pricing</a></li>
                        <li><a href="./faq.html">Faq</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div class="offcanvas__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
        </div>
    </div>
    <!-- Offcanvas Menu End -->
<!-- ================================================================================= -->
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-12 col-md-12">
                        <div class="header__top__widget" >
                       	<c:if test="${!empty id}">
                       		<ul style="float: right;">
	                        	<li> <a href="#" class="cus1">${id} 님(로그아웃)</a>&nbsp;</li>
	                        	<li> <a href="#" class="cus1">내정보</a>&nbsp;</li>
	                        	
		                        	<c:if test="${id=='admin'}">
										<!-- Dropdown -->
							                <li class=" dropdown" style="float: right;"><a
											class="nav-link dropdown-toggle" href="#" id="navbardrop"
											data-toggle="dropdown"> 관리자 </a>
											<div class="dropdown-menu">
											<ul>
												<li><a class="dropdown-item" href="#">회원정보</a></li>
												<li><a class="dropdown-item" href="#">게시판</a></li>	
											</ul>
												
											</div>
											</li>
									</c:if><!-- admin이면 dropdown -->
	                        </ul>
                       	</c:if>
                       	
                       	<c:if test="${empty id}">
                             <ul style="margin-top:40px">
                              <li> <a href="${pageContext.request.contextPath}/member/login" 
                                         class="headerbtn">로그인</a></li>
                              <li> <a href="${pageContext.request.contextPath}/member/join" 
                                         class="headerbtn">회원가입</a></li>
                           	</ul>
                         </c:if>  
                        
                       
                        </div>
                    </div>
                    
                    <div class="col-lg-12 col-md-12">
                        <div style="text-align: center; height: 70px;">
                               <a href="${pageContext.request.contextPath}/main/main"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""  width="200px" height="70px"></a>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </div>
        <div class="header__nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12" style="text-align: center;">
                        <nav class="header__menu ">
                            <ul>
                                <li class="coffee"><a href="#">커피</a>
                              	  	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/coffee/Test">커피 취향테스트</a></li>
                                        <li><a href="${pageContext.request.contextPath}/coffee/Story">커피이야기</a></li>
                                        <li><a href="${pageContext.request.contextPath}/coffee/Fword">커피용어</a></li>
                                        <li><a href="${pageContext.request.contextPath}/coffee/Beans">원두</a></li>
                                        <li><a href="${pageContext.request.contextPath}/coffee/Machine">머신</a></li>
                                        <li><a href="${pageContext.request.contextPath}/coffee/Recipes">레시피</a></li>
                                    </ul>
                                </li>
                                <li class="event"><a href="#">이벤트</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/event/attendCheck">출석 체크</a></li>
                                        <li><a href="#">룰렛 포인트</a></li>
                                        <li><a href="#">포인트 스토어</a></li>
                                    </ul>
                                </li>
                                <li class="shopping"><a href="#">쇼핑검색</a>
                                	<ul class="dropdown">
                                        <li><a href="#">상품 검색</a></li>
                                    </ul>
                                </li>
                                 <li class="community"><a href="#">커뮤니티</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/board_coffee/list">커피정보게시판</a></li>
                                        <li><a href="#">출석 게시판</a></li>
                                        <li><a href="#">추천음악 게시판</a></li>
                                        <li><a href="#">투어 게시판</a></li>
                                        <li><a href="${pageContext.request.contextPath}/board_qna/list">Q & A</a></li>
                                    </ul>
                                </li>
                                <li class="tour"><a href="#">투어</a>
                                    <ul class="dropdown">
                                        <li><a href="./classes-details.html">Classes Details</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="./pricing.html">Pricing</a></li>
                                        <li><a href="./faq.html">Faq</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
					
    <!-- Counter End -->
 
    <!-- Header Section End -->
        <!-- Js Plugins -->
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   <%--  <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>  이거하면 셀렉트안됨--%>
   <%--  <script src="${pageContext.request.contextPath}/resources/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script> --%>
    

</body>

</html>