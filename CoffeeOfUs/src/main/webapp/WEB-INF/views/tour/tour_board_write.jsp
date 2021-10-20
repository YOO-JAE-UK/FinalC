<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tour_review</title>

<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=5%>" />
</jsp:include>
<!-- <script src="../resources/js/jquery-3.6.0.js"></script> -->
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="../resources/js/tour/writeform.js" charset="utf-8"></script>
<link rel="stylesheet" href="../resources/css/tour_board_write.css">

<script src="../resources/js/bootstrap.js"></script>
<link href="../resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">

 <style>
 video {
    max-width: 100%;
  }
  .card {
    transition: transform 0.2s ease;
    box-shadow: 0 4px 6px 0 rgba(22, 22, 26, 0.18);
    border-radius: 0;
    border: 0;
    margin-bottom: 1.5em;
  }
  .card:hover {
    transform: scale(1.1);
  }
  .nav-sidebar{
  	padding-top: 30px;
  }
  

.btn{
	margin-bottom: 30px;
    margin-top: 30px;
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
	color: black;
	padding: 20px;
	position: relative;
	top: 100px;
	text-decoration: none;
	font-size: 16px;
}

/* Active/current link */
.sidebar a.active {
	background-color: #37586f;
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
.over{
	overflow: hidden
}
 
</style>
<script>
//This example adds a search box to a map, using the Google Place Autocomplete
//feature. People can enter geographical searches. The search box will return a
//pick list containing a mix of places and predicted search terms.
//This example requires the Places library. Include the libraries=places
//parameter when you first load the API. For example:
//<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
function initAutocomplete() {
const map = new google.maps.Map(document.getElementById("map"), {
center: { lat: 37.55341, lng: 126.97103 },
zoom: 11,
mapTypeId: "roadmap",
});

//Create the search box and link it to the UI element.
const input = document.getElementById("pac-input");
const searchBox = new google.maps.places.SearchBox(input);

//map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); 주석처리해야 검색창이동가능
//Bias the SearchBox results towards current map's viewport.
map.addListener("bounds_changed", () => {
searchBox.setBounds(map.getBounds());
});

let markers = [];

//Listen for the event fired when the user selects a prediction and retrieve
//more details for that place.
searchBox.addListener("places_changed", () => {
const places = searchBox.getPlaces();

if (places.length == 0) {
 return;
}

// Clear out the old markers.
markers.forEach((marker) => {
 marker.setMap(null);
});
markers = [];

// For each place, get the icon, name and location.
const bounds = new google.maps.LatLngBounds();

places.forEach((place) => {
 if (!place.geometry || !place.geometry.location) {
   console.log("Returned place contains no geometry");
   return;
 }

 const icon = {
   url: place.icon,
   size: new google.maps.Size(71, 71),
   origin: new google.maps.Point(0, 0),
   anchor: new google.maps.Point(17, 34),
   scaledSize: new google.maps.Size(25, 25),
 };

 // Create a marker for each place.
 markers.push(
   new google.maps.Marker({
  	 
     map,
     icon,
     title: place.name,
     position: place.geometry.location,
   })
 );
 if (place.geometry.viewport) {
   // Only geocodes have viewport.
   bounds.union(place.geometry.viewport);
 } else {
   bounds.extend(place.geometry.location);
 }
var start =place.formatted_address.indexOf(" ")+1; //띄워쓰기포함된 4가 리턴됨(도당고등학교 검색시)
var end =place.formatted_address.indexOf(" ",start); //8리턴

 $("#do").text(place.formatted_address.substring(start, end));
 $("#TOUR_ADDRESS").attr("value",place.formatted_address);
$("#location").attr("value",place.geometry.location); //(37.5186305, 126.7903892)  결과값()포함

});
map.fitBounds(bounds);

});
}
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="tour_map">시 도 별지도</a> 
				<a class="active"  href="tour_board_list">투어 후기 리스트</a>

			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px;">
			
				
			<form action="add_admin" method="post" enctype="multipart/form-data">
  <input type="hidden" name="USER_ID" value="${id}">
  <input type="hidden" name="USER_NICKNAME" value="${name}">
  <input type="hidden" id="TOUR_ADDRESS" name="TOUR_ADDRESS">
  <input type="hidden" id="location" name="TOUR_LATNG">
  <div id="product-img">
   <%--  <img src="${pageContext.request.contextPath}/resources/img/attach.png" alt="Nike" title="Nike" class="nike-logo"/> --%>
    
     <img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="cafe_image" title="cafe_image" class="shoe fade-in one" id="cafe_image"/> 
	   <div id="image_container"></div>
	   <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
	   <div  style="text-align: left; color: white; font-size:12pt; background: #484848">
	  	 <label style="color:white; margin-top:10px; margin-bottom: 0; margin-left: 5px;">파일 첨부</label>
			<label style="margin-bottom:0" for="upfile">
				<img style="margin-bottom: 5px;" src="../resources/img/attach.png" alt="파일첨부" width="20px">
			</label>
			<input type="file" id="upfile" name="uploadfile" multiple="multiple" accept="image/*">
			 <span id="filevalue"></span>
	   </div>
	   
	   
	   
	   <hr style="border: 2px solid white; margin-bottom: 5px; margin-top:5px;">
	   <div>
	<!-- 6 -->   <input id="pac-input" class="controls" type="text" placeholder="Search Place" /><!-- 여기에 NAME안쓴이유: 변경될수도 있기때문 -->
	   </div>
	<div id="map" ></div><!--  -->
 <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8jkPG8yaDC-ADVVOZcVUqlP2a-dvtPZ0&callback=initAutocomplete&libraries=places&v=weekly"
      async
    ></script> 
  </div>
  <div id="product-info" class="clearfix-auto">
    <div id="product-spec" class="wrapper">
		    <div style="float: left">
		      <h2 style="width: 150px; margin-top: 7px;"><span id="do">시 도</span></h2>
		    </div>
		    <div style="float: right">
		      <!--별  -->
		      
		      <div class="star-input"> 
		      <!-- <p class="score"><b>0</b>점</p>  -->
		      	<span class="input"> 
		     		<input type="radio" name="TOUR_GRADE" value="1" id="p1">
		     		<label for="p1">1</label>
		     		<input type="radio" name="TOUR_GRADE" value="0.5" id="p1_2">
		     		<label for="p1_2">0.5</label>
		     		<input type="radio" name="TOUR_GRADE" value="2" id="p2"> 
		     		<label for="p2">2</label> 
		     		<input type="radio" name="TOUR_GRADE" value="1.5" id="p2_2"> 
		     		<label for="p2_2">1.5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="3" id="p3"> 
		     		<label for="p3">3</label> 
		     		<input type="radio" name="TOUR_GRADE" value="2.5" id="p3_2"> 
		     		<label for="p3_2">2.5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="4" id="p4"> 
		     		<label for="p4">4</label> 
		     		<input type="radio" name="TOUR_GRADE" value="3.5" id="p4_2"> 
		     		<label for="p4_2">3.5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="5" id="p5"> 
		     		<label for="p5">5</label> 
	<!-- 16 -->	     		<input type="radio" name="TOUR_GRADE" value="4.5" id="p5_2"> 
		     		<label for="p5_2">4.5</label> 
		     	</span> 
		     </div>

		      
		      <!-- 별끝 -->
		      </div>
    </div>
     <div>
    	<label style="margin-bottom: 0px;">카페이름 :</label><br>
     	<input class="underline" type="text" name="TOUR_NAME" placeholder="Enter Cafename">
     </div>
     <div  style="margin-bottom: 40px;">
	     <label style="margin-bottom: 0px;">제목 :</label><br>
	     <input class="underline" type="text" name="TOUR_SUBJECT" placeholder="Enter Subject">
     </div>
     <h4 class="clearfix">후기</h4>
   		<textarea name="TOUR_CONTENT" rows="15" style="width: 100%"></textarea>
 	
 	
<!-- progress bar -->
 	
 	<div style="margin: 20px 0 0 5px; font-size: 13pt"><b>맛</b></div>
 	<div id="bar1"></div>
	<div id="tastediv">
		<div id="taste_one" class="choose_name">매우나쁨</div><input type="radio" name="TOUR_TASTE" id="one1" value="1">
		<div id="taste_two" class="choose_name">나쁨</div><input type="radio" name="TOUR_TASTE" id="two1" value="2">
		<div id="taste_three" class="choose_name">보통</div><input type="radio" name="TOUR_TASTE" id="three1" value="3" checked>
		<div id="taste_four" class="choose_name">좋음</div><input type="radio" name="TOUR_TASTE" id="four1" value="4">
		<div id="taste_five" class="choose_name">매우좋음</div><input type="radio" name="TOUR_TASTE" id="five1" value="5">
	</div>
	
	
	<div style="margin: 0px 0 0 5px; font-size: 13pt"><b>분위기</b></div>
 	<div id="bar2"></div>
	<div id="tastediv">
		<div id="atmosphere_one" class="choose_name">매우나쁨</div><input type="radio" name="TOUR_ATMOSPHERE" id="one2" value="1">
		<div id="atmosphere_two" class="choose_name">나쁨</div><input type="radio" name="TOUR_ATMOSPHERE" id="two2" value="2">
		<div id="atmosphere_three" class="choose_name">보통</div><input type="radio" name="TOUR_ATMOSPHERE" id="three2" value="3" checked>
		<div id="atmosphere_four" class="choose_name">좋음</div><input type="radio" name="TOUR_ATMOSPHERE" id="four2" value="4">
		<div id="atmosphere_five" class="choose_name">매우좋음</div><input type="radio" name="TOUR_ATMOSPHERE" id="five2" value="5">
	</div>
	
	
	<div style="margin: 0px 0 0 5px; font-size: 13pt"><b>서비스</b></div>
 	<div id="bar3"></div>
	<div id="tastediv">
		<div id="service_one" class="choose_name">매우나쁨</div><input type="radio" name="TOUR_SERVICE" id="one3" value="1">
		<div id="service_two" class="choose_name">나쁨</div><input type="radio" name="TOUR_SERVICE" id="two3" value="2">
		<div id="service_three" class="choose_name">보통</div><input type="radio" name="TOUR_SERVICE" id="three3" value="3" checked>
		<div id="service_four" class="choose_name">좋음</div><input type="radio" name="TOUR_SERVICE" id="four3" value="4">
		<div id="service_five" class="choose_name">매우좋음</div><input type="radio" name="TOUR_SERVICE" id="five3" value="5">
	</div>
 	
 	<div style="margin-top: 40px;">
 		<button style="float:left; margin-top:25px" class="btn btn-light">취소</button>
 		<button type="submit" style="float:right; margin-top:25px" class="btn btn-primary">작성완료</button>
 	</div>
 	</div><!-- 오른쪽 content 자리 -->
</form>              	
			
			
			<div class="col-sm-2">
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
<script>

</script>
</html>
