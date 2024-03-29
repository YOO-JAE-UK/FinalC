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
  
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    
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
		padding: 0px 0px 40px !important;
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
		position :absolute;
		right: 70px;
		font-size: 15px;
		width:141px;
		margin-top: 20px;
	}
.cus2{
 border: 1px solid white;
 color: white;
 border-radius: 3px;
 margin-right: 10px;
 font-size: 15px;
 width: 40px;
 text-align: center;
 position : absolute;
 right: 5px;
 margin-top: 16px;
}
#manager{
 margin-top: 27px;
 font-size: 12pt;
 position: absolute;
 top: 1px;
}
	li{
		list-style: none;
	}
	.header__menu > ul> li{
		margin: 0 25px 0 25px;
	}
/* #manager_wap{
  margin: 9px -47px 0 0 !important;
} */	
	
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
                              
                             <c:choose> 
                              <c:when test="${name==''}">
                              <li> <a href="${pageContext.request.contextPath}/member/logout" 
	                        	        class="cus1" style="text-transform: lowercase !important; width:300px;">${id} 님(로그아웃)</a> </li>
                              </c:when>                             
                              <c:otherwise>                            
                              <li> <a href="${pageContext.request.contextPath}/member/logout" 
	                        	        class="cus1" style="text-transform: lowercase !important;">${name} 님(로그아웃)</a> </li>
	                           </c:otherwise>
	                          </c:choose> 
	                           <li> <a href="${pageContext.request.contextPath}/member/member_info?id=${id}" 
	                        	        class="cus2" >My</a> </li>
                              
                                 <c:if test="${id=='admin'}">
                              
                              <!-- 관리자 -->
                              <div class="manager_wap">
                              <a class="manager" href="${pageContext.request.contextPath}/member/list" id="manager"
                                 > 관리자 </a>
                              </div>
                              
                           </c:if><!-- admin이면 dropdown -->
                           </ul>
                          </c:if>
                       	
                       	<c:if test="${empty id}">
                             <ul style="margin:30px 160px 16px 0; font-size:14px;">
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
                               <a href="${pageContext.request.contextPath}/main/main">
                               <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""  width="200px" height="70px"></a>
                        
                        
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
                                        <li><a href="${pageContext.request.contextPath}/coffee/Fword">커피용어</a></li>
                                        <li><a href="${pageContext.request.contextPath}/coffee/Beans">원두</a></li>
                                    </ul>
                                </li>
                                <li class="event"><a href="#">이벤트</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/event/attendCheck">출석 체크</a></li>
                                        <li><a href="${pageContext.request.contextPath}/event/roulette">룰렛 포인트</a></li>
                                        <li><a href="${pageContext.request.contextPath}/point_store/list">포인트 스토어</a></li>
                                    </ul>
                                </li>
                                 <li class="community"><a href="#">커뮤니티</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/board_coffee/list">커피정보게시판</a></li>
                                        <li><a href="${pageContext.request.contextPath}/board_event/list">이벤트 게시판</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tour/tour_board_list">투어 게시판</a></li>
                                        <li><a href="${pageContext.request.contextPath}/board_qna/list">Q & A</a></li>
                                    </ul>
                                </li>
                                <li class="tour"><a href="#">투어</a>
                                    <ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/tour/tour_map">시 도별 지도</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tour/tour_board_list">투어 후기리스트</a></li>
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
    
  

</body>

</html>
