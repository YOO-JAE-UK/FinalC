<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tour_review</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<!-- <script src="../resources/js/coffee/list.js" charset="utf-8"></script> -->
<link rel="stylesheet" href="../resources/css/review.css">
 <style>

</style>
<script>
/* 위도와 경도 구하기 */
var lat =37.51873 //위도
var lang = 126.79036 //경도

/* 지도부분 */
//Initialize and add the map
function initMap() {
  // The location of Uluru
  const uluru = { lat: lat, lng: lang };
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15,
    center: uluru,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: uluru,
    map: map,
  });
}
</script>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

<!-- <h2 style="text-align: center;">Beans입니다.</h2> -->
	 <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
                 <div class="col-xs-12 col-sm-12 col-md-3">
                	<ul>
                		<li>커피 정보게시판</li>
                		<li>출석 게시판</li>
                		<li>추천 음악게시판</li>
                		<li>투어 게시판</li>
                		<li>Q & A</li>
                	</ul>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9" style="background: #e8e8e8; border-radius: 15px">
                	
                	<section style="height: 800px">
  
  <div id="product-img">
   <%--  <img src="${pageContext.request.contextPath}/resources/img/attach.png" alt="Nike" title="Nike" class="nike-logo"/> --%>
    
    <img src="${pageContext.request.contextPath}/resources/img/car.jpg" alt="cafe_image" title="cafe_image" class="shoe fade-in one"/>
    <div id="map" class="shoe1">	</div>
					
				    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->				    
  </div>
  
  <div id="product-info" class="clearfix-auto">
    <div id="product-spec" class="wrapper">
		    <div style="float: left;" >
		      <h2 style="width: 130px;"><span>강원도</span></h2>
		    </div>
		    <div style="float: right">
		      <span class="review-rating">
		          <span class="user-review ninety"></span>
		      </span>
		      </div>
    </div>
     <div style="margin-bottom: 40px;"><h2>C&F cafe</h2></div>
 </div>
    
    <h4 class="clearfix">후기</h4>
    <p>With a highly breathable  upper and casual silouette, the Nike Roshe Run is  definately a perfect model for summer. For Spring /Summer 2013 a fresh Mint Green colorway's version of this 'yet classic' pair is now available to order.</p>
    
    <div id="product-options" class="clearfix-auto">
        <div id="color" class="wrapper">
           <h4 class="">맛</h4>
           <div>
              <input type="radio" name="radio" id="radio1" class="radio" checked/>
              <label for="radio1">신맛</label>
           </div>

            <div>
              <input type="radio" name="radio" id="radio2" class="radio"/>
              <label for="radio2">쓴맛</label>
            </div>

            <div>	
              <input type="radio" name="radio" id="radio3" class="radio"/>
              <label for="radio3">&nbsp;</label>
            </div>

            <div>	
              <input type="radio" name="radio" id="radio4" class="radio"/>
              <label for="radio4">&nbsp;</label>
            </div>

            <div>	
              <input type="radio" name="radio" id="radio5" class="radio"/>
              <label for="radio5">&nbsp;</label>
            </div>
        </div>
		<!-- 리스트 뷰단 -->
 		
  		</div>

</section>
                	
                </div>
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
 
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8jkPG8yaDC-ADVVOZcVUqlP2a-dvtPZ0&callback=initMap&v=weekly" async ></script>
</body>
</html>
