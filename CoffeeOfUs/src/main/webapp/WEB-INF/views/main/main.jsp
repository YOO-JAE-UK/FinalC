<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Story</title>

<jsp:include page="../header.jsp"></jsp:include>

<script>
<% String num = request.getParameter("num");%>
	var i1=<%=num%>;
		//alert(i1+"i의 값");
		
$(function(){
  $('.carousel-item').eq(0).addClass('active');
  var total = $('.carousel-item').length;
  var current = 0;
  $('#moveRight').on('click', function(){
    var next=current;
    current= current+1;
    setSlide(next, current);
  });
  $('#moveLeft').on('click', function(){
    var prev=current;
    current = current- 1;
    setSlide(prev, current);
  });
  function setSlide(prev, next){
    var slide= current;
    if(next>total-1){
     slide=0;
      current=0;
    }
    if(next<0){
      slide=total - 1;
      current=total - 1;
    }
           $('.carousel-item').eq(prev).removeClass('active');
           $('.carousel-item').eq(slide).addClass('active');
      setTimeout(function(){

      },800);
    

    
    console.log('current '+current);
    console.log('prev '+prev);
  }
});


function ajax(CRAWLER_NUM){
	//num가지고와서 데이터뽑기
	output="";
	$.ajax({
		type : "GET",
		data : {"CRAWLER_NUM" : CRAWLER_NUM},
		url : "detail_ajax",
		dataType : "json",
		cashe : false,
		success : function(data) {
		//	alert(JSON.stringify(data))
			output="";
			$("#main_img").empty();
			output+="<img class='main_img' src='"+data.crawler.crawler_IMAGE+"''>"
			$("#main_img").append(output);
			
			output="";
			$("#main_content").empty();
			output+="<div class='main_subject' >"+data.crawler.crawler_COVER_SUBJECT+"</div><br><br>"
			output+="<div class='main_summary'>"+data.crawler.crawler_SUMMARY+"</div>"
			output+='<a href="'+data.crawler.crawler_LINK+'" style="margin-top: 20px; float: right;background: #000000 !important; width: 80px !important;" class="btn btn-primary">자세히 </a>'
			$("#main_content").append(output);
			
				
			
		}, //success end
		error : function() {
			console.log('에러')
		}
	})//ajax end
}//function ajax end


$(document).ready(function(){
	$(".center_img1").click(function(){
		location.href="../coffee/Test";
	})
	$(".center_img2").click(function(){
		location.href="../event/attend_check";
	})
	$(".center_img3").click(function(){
		location.href="../tour/tour_map";
	})
})

</script>
<style>
.main_img{
	width: 100%;
	height: 100%;
}
.main_subject{
	font-size: 20pt;
	font-weight: bold;
	text-align: left;
}
.main_summary{
font-size: 12pt;
	text-align: left;
}


	@import url('https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i');

@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i');


* {
  box-sizing: border-box;
}

html, body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    display: flex;
    display: -webkit-flex;
    justify-content: center;
  -webkit-justify-content: center;
    align-items: center;
  -webkit-align-items: center;
}

body {
    background-color: #eaeaea;
}

.carousel {
    width: 100%;
    height: 100%;
    display: flex;
    max-width: 900px;
    max-height: 550px;   
    overflow: hidden;
  position: relative;
}

.carousel-item {
  visibility:visible;
    display: flex;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: flex-end;
      -webkit-align-items: center;
    -webkit-justify-content: flex-end;
    position: relative;
    background-color: #fff;
    flex-shrink: 0;
   -webkit-flex-shrink: 0;
    position: absolute;
    z-index: 0;
  transition: 0.6s all linear;
}

.carousel-item__info {
  height: 100%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  
    display: -webkit-flex;
  -webkit-justify-content: center;
  -webkit-flex-direction: column;
  
  order: 1;
  left: 0;
  margin: auto;
  padding: 0 40px;
  width: 40%;

}

.carousel-item__image {
    width: 60%;
    height: 100%;
    order: 2;
    align-self: flex-end;
    flex-basis: 60%;
  
      -webkit-order: 2;
    -webkit-align-self: flex-end;
    -webkit-flex-basis: 60%;
  
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
   position:relative;
  transform: translateX(100%);
  transition: 0.6s all ease-in-out;
}

.carousel-item__subtitle {
    font-family: 'Open Sans', sans-serif;
    letter-spacing: 3px;
    font-size: 10px;
    text-transform: uppercase;
    margin: 0;
    color: #7E7E7E;    
    font-weight: 700;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.4s all ease-in-out;
}

.carousel-item__title {
    margin: 15px 0 0 0;
    font-family: 'Playfair Display', serif;
    font-size: 44px;
    line-height: 45px;
    letter-spacing: 3px;
    font-weight: 700;
    color: #2C2C2C;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
}

.carousel-item__description {
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
    margin-top: 35px;
    font-family: 'Open Sans', sans-serif;
    font-size: 13px;
    color: #7e7e7e;
    line-height: 22px;
    margin-bottom: 35px;
}

.carousel-item--1 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/991012/pexels-photo-991012.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');
}


.carousel-item--2 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/921294/pexels-photo-921294.png?auto=compress&cs=tinysrgb&h=750&w=1260');
}

.carousel-item--3 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/92733/pexels-photo-92733.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260');
}

.carousel-item--4 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/1008732/pexels-photo-1008732.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260');
}

.carousel-item--5 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/1029614/pexels-photo-1029614.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');
}




.carousel-item__container{

}

.carousel-item__btn {
    width: 35%;
    color: #2C2C2C;
    font-family: 'Open Sans', sans-serif;
    letter-spacing: 3px;
    font-size: 11px;
    text-transform: uppercase;
    margin: 0;
    width: 35%;
    font-weight: 700;
  text-decoration: none;
      transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
}

.carousel__nav {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: #fff;
  bottom: 0;
}

.carousel__icon {
    display: inline-block;
    vertical-align: middle;
    width: 16px;
  fill: #5d5d5d;
}

.carousel__arrow {
    cursor: pointer;
    display: inline-block;
    padding: 11px 15px;
    position: relative;
}

.carousel__arrow:nth-child(1):after {
    content:'';
    right: -3px;
    position: absolute;
    width: 1px;
    background-color: #b0b0b0;
    height: 14px;
    top: 50%;
    margin-top: -7px;
}

.active{
   z-index: 1;
  display: flex;
  visibility:visible;
}

.active .carousel-item__subtitle, .active .carousel-item__title, .active .carousel-item__description,.active .carousel-item__btn{
    transform: translateY(0);
    opacity: 1;
  transition: 0.6s all ease-in-out;
    visibility: visible;
}



.active .carousel-item__image{ 
transition: 0.6s all ease-in-out;
transform: translateX(0);
}
	
	/* 커스텀 */
.carouselflex{
	display: flex !important;
}
	
	
.center_img1{
    width: 130px;
    margin-left: 10px;
    margin-top: 5px;
}
.center_img2{
    width: 130px;
    margin-left: 10px;
    margin-top: 5px;
}
.center_img3{
    width: 105px;
    margin-top: 20px;
}
</style>
</head>
<body style="display: block;">

<!-- include안에 파람 -->
 <!-- main content -->
	 <div class="carousel" style="margin: 0 auto;  min-width :1300px !important; ">
  <div class="carousel__nav">
   <span id="moveLeft" class="carousel__arrow">
        <svg class="carousel__icon" width="24" height="24" viewBox="0 0 24 24">
    <path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
</svg>
    </span>
    <span id="moveRight" class="carousel__arrow" >
      <svg class="carousel__icon"  width="24" height="24" viewBox="0 0 24 24">
  <path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
</svg>    
    </span>
  </div>
  <div class="carousel-item carousel-item--1 carouselflex" >
    <div class="carousel-item__image"></div>
    <div class="carousel-item__info">
      <div class="carousel-item__container">
      <h2 class="carousel-item__subtitle">The grand moment </h2>
      <h1 class="carousel-item__title">Le tour</h1>
      <p class="carousel-item__description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
      <a href="#" class="carousel-item__btn">Explore the tour</a>
        </div>
    </div>
  </div>
  <div class="carousel-item carousel-item--2 carouselflex">
    <div class="carousel-item__image"></div>
    <div class="carousel-item__info">
      <div class="carousel-item__container">
      <h2 class="carousel-item__subtitle">The big window </h2>
      <h1 class="carousel-item__title">Minimal window</h1>
      <p class="carousel-item__description">Clear Glass Window With Brown and White Wooden Frame iste natus error sit voluptatem accusantium doloremque laudantium.</p>
      <a href="#" class="carousel-item__btn">Read the article</a>
        </div>
    </div>
  </div>
    <div class="carousel-item carousel-item--3 carouselflex">
    <div class="carousel-item__image"></div>
    <div class="carousel-item__info">
      <div class="carousel-item__container">
      <h2 class="carousel-item__subtitle">Tropical palms </h2>
      <h1 class="carousel-item__title">Palms</h1>
      <p class="carousel-item__description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
      <a href="#" class="carousel-item__btn">Explore the palms</a>
        </div>
    </div>
  </div>
  
   <div class="carousel-item carousel-item--4 carouselflex">
    <div class="carousel-item__image"></div>
    <div class="carousel-item__info">
      <div class="carousel-item__container">
      <h2 class="carousel-item__subtitle">Beach </h2>
      <h1 class="carousel-item__title">The beach </h1>
      <p class="carousel-item__description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
      <a href="#" class="carousel-item__btn">Explore the beach</a>
        </div>
    </div>
  </div>
  
 <div class="carousel-item carousel-item--5 carouselflex">
    <div class="carousel-item__image"></div>
    <div class="carousel-item__info">
      <div class="carousel-item__container">
      <h2 class="carousel-item__subtitle">The white building </h2>
      <h1 class="carousel-item__title">White building</h1>
      <p class="carousel-item__description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
      <a href="#" class="carousel-item__btn">Read the article</a>
        </div>
    </div>
  </div>
  
</div>  	
         
                 
           
                	
                	
<div style="height: 700px; text-align: center;">

 <div class="col-xs-12 col-sm-12 col-md-1">
 	
 </div>
 
 
 
 
  <div class="col-xs-12 col-sm-12 col-md-10" style="">
 	<div style="width: 100%; height: 200px; margin-top: 30px;margin-bottom: 20px;">
 		<div style=" width: 33%; height: 180px; float:left; padding-top: 15px;"><div style="border-radius: 50%; border:1px solid #e5e5e5;width: 150px; height: 150px; margin: 0 auto"><img class="center_img1" src="../resources/img/coffee.png"></div></div>
 		<div style=" width: 34%; height: 180px; float:left; padding-top: 15px;"><div style="border-radius: 50%; border:1px solid #e5e5e5;width: 150px; height: 150px; margin: 0 auto"><img class="center_img2" src="../resources/img/calendar.png"></div></div>
 		<div style=" width: 33%; height: 180px; float:left; padding-top: 15px;"><div style="border-radius: 50%; border:1px solid #e5e5e5;width: 150px; height: 150px; margin: 0 auto"><img class="center_img3" src="../resources/img/itinerary.png"></div></div>
 	</div>
 	<div style="width: 100%; height: 450px;">
 	
 		<div style=" width: 34%; height: 400px; float:left; margin-top: 20px;" id="main_img"><img class='main_img' src='${boardlist.get(0).CRAWLER_IMAGE }'></div>
 		<div style=" width: 33%; height: 400px; float:left; margin-top: 20px; padding: 30px;background: #f9f9f9;" id="main_content">
 			<div class='main_subject' >${boardlist.get(0).CRAWLER_COVER_SUBJECT }</div><br><br>
 			<div class='main_summary'>${boardlist.get(0).CRAWLER_SUMMARY }
 			</div>
 		<a href="${boardlist.get(0).CRAWLER_LINK}" style="margin-top: 20px; float: right;background: #000000 !important; width: 80px !important;" class="btn btn-primary">자세히 </a>
 		</div>
 		<div style=" width: 33%; height: 400px;float:left; padding: 10px; ">
 		
 		
 		<h3 style="padding-bottom: 10px; ">최신뉴스</h3>
 			<table>
 				<thead>
 					<tr style="font-size: 13pt;">
 						<th style="padding-bottom: 10px;">제목</th><th>날짜</th>
 					</tr>
 				</thead>

 				<tbody>
<c:forEach var="b" items="${boardlist}">
 					<tr>
 						<td style="padding: 5px;font-size: 10pt; text-align: left"><span onclick="javascript:ajax(${b.CRAWLER_NUM})">${b.CRAWLER_COVER_SUBJECT}</span></td>
 						<td style="padding: 5px;font-size: 9pt; text-align: left">${b.CRAWLER_DATE.substring(2)}</td>
 					</tr>
 					
</c:forEach>
 				</tbody>
 			</table>
 		
 		</div>

 	</div>
 </div>
 <!-- 
 	
  -->
 
 
 
  <div class="col-xs-12 col-sm-12 col-md-1">
 	
 </div>   
</div>           	
   	
                	
           

                	
        
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
                	
            
                
       
       
<jsp:include page="../footer.jsp"></jsp:include>
 
</body>
</html>