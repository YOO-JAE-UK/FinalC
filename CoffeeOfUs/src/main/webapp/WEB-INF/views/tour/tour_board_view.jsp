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
<script src="../resources/js/jquery-3.6.0.js"></script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="../resources/js/tour/view.js" charset="utf-8"></script>
<link rel="stylesheet" href="../resources/css/tour_board_view.css">

<script src="../resources/js/bootstrap.js"></script>
<link href="../resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">

 <style>
 
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
$(document).ready(function(){
	$("#board_tour_modify_btn").click(function(){
		location.href="tour_board_modifyView?num="+${boarddata.TOUR_NUM};
	});
	$("#modal_submit").on("click", function() {
		var modal_submit = $("#tour_answer").val();
		
		if(modal_submit!="삭제하겠습니다."){
			return false;
		}
	})
})


/* 위도와 경도 구하기*/
// Initialize and add the map
function initMap() {
	var LATNG =$("#location").attr("value");
	var comma = LATNG.indexOf(",");
	var end = LATNG.length -1;
	var lat = parseFloat(LATNG.substring(1,comma)); //위도
	var lng = parseFloat(LATNG.substring(comma+2, end));// 경도
  // The location of Uluru
  const uluru = { lat: lat, lng: lng };
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
			
			 <input type="hidden" id="TOUR_ADDRESS" name="TOUR_ADDRESS">
  <input type="hidden" id="location" name="TOUR_LATNG" value="${boarddata.TOUR_LATNG}">
  <div id="product-img">
    
				    <c:if test="${empty boarddata.TOUR_FILE}">
				    	<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="cafe_image" title="cafe_image" class="shoe fade-in one" id="cafe_image"/> 
					</c:if>
	
					<c:set var="cafe_image" value="${boarddata.TOUR_FILE}"/>
                    <c:if test="${!empty boarddata.TOUR_FILE}">
                    	<img src="get_img?name=${boarddata.TOUR_FILE}" alt="cafe_image"  class="shoe fade-in one">
   					</c:if>                  
	   <hr style="border: 2px solid white; margin-bottom: 5px; margin-top:5px;">
	
	<div id="map" ></div><!--  -->

    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8jkPG8yaDC-ADVVOZcVUqlP2a-dvtPZ0&callback=initMap&libraries=&v=weekly"
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
		     		<input type="radio" name="TOUR_GRADE" value="1" id="p1" ${TOUR_GRADE==1 ? checked : ""} disabled >
		     		<label for="p1">1</label>
		     		<input type="radio" name="TOUR_GRADE" value="0.5" id="p1_2" ${boarddata.TOUR_GRADE==0.5 ? "checked" : ""} disabled>
		     		<label for="p1_2">0.5</label>
		     		<input type="radio" name="TOUR_GRADE" value="2" id="p2" ${boarddata.TOUR_GRADE==2 ? "checked" : ""} disabled> 
		     		<label for="p2">2</label> 
		     		<input type="radio" name="TOUR_GRADE" value="1.5" id="p2_2" ${boarddata.TOUR_GRADE==1.5 ? "checked" : ""} disabled> 
		     		<label for="p2_2">1.5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="3" id="p3" ${boarddata.TOUR_GRADE==3 ? "checked" : ""} disabled> 
		     		<label for="p3">3</label> 
		     		<input type="radio" name="TOUR_GRADE" value="2.5" id="p3_2" ${boarddata.TOUR_GRADE==2.5 ? "checked" : ""} disabled> 
		     		<label for="p3_2">2.5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="4" id="p4" ${boarddata.TOUR_GRADE==4 ? "checked" : ""} disabled> 
		     		<label for="p4">4</label> 
		     		<input type="radio" name="TOUR_GRADE" value="3.5" id="p4_2" ${boarddata.TOUR_GRADE==3.5 ? "checked" : ""} disabled> 
		     		<label for="p4_2">3.5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="5" id="p5" ${boarddata.TOUR_GRADE==5 ? "checked" : ""} disabled> 
		     		<label for="p5">5</label> 
		     		<input type="radio" name="TOUR_GRADE" value="4.5" id="p5_2" ${boarddata.TOUR_GRADE==4.5 ? "checked" : ""} disabled> 
		     		<label for="p5_2">4.5</label> 
		     	</span> 
		     </div>

		      
		      <!-- 별끝 -->
		      </div>
    </div>
     <div>
    	<label style="margin-bottom: 0px;">카페이름 :</label><br>
     	<input class="underline" type="text" name="TOUR_NAME" value="${boarddata.TOUR_NAME}" readonly>
     </div>
     <div  style="margin-bottom: 40px;">
	     <label style="margin-bottom: 0px;">제목 :</label><br>
	     <input class="underline" type="text" name="TOUR_SUBJECT" value="${boarddata.TOUR_SUBJECT}" readonly>
     </div>
     <h4 class="clearfix">후기</h4>
   		<textarea name="TOUR_CONTENT" rows="10" style="width: 100%" readonly>${boarddata.TOUR_CONTENT}
   		</textarea>
 	
 	
<!-- progress bar -->
 	
 	<div style="margin: 20px 0 0 5px; font-size: 13pt"><b>맛</b></div>
 	<div id="bar1"></div>
	<div id="tastediv">
		<div id="taste_one" class="choose_name">매우나쁨</div><input type="radio" name="TOUR_TASTE" id="one1" value="1"  ${boarddata.TOUR_TASTE==1 ? "checked" : ""} >
		<div id="taste_two" class="choose_name">나쁨</div><input type="radio" name="TOUR_TASTE" id="two1" value="2"  ${boarddata.TOUR_TASTE==2 ? "checked" : ""} >
		<div id="taste_three" class="choose_name">보통</div><input type="radio" name="TOUR_TASTE" id="three1" value="3"  ${boarddata.TOUR_TASTE==3 ? "checked" : ""} >
		<div id="taste_four" class="choose_name">좋음</div><input type="radio" name="TOUR_TASTE" id="four1" value="4"  ${boarddata.TOUR_TASTE==4 ? "checked" : ""} >
		<div id="taste_five" class="choose_name">매우좋음</div><input type="radio" name="TOUR_TASTE" id="five1" value="5"  ${boarddata.TOUR_TASTE==5 ? "checked" : ""} >
	</div>
	
	
	<div style="margin: 0px 0 0 5px; font-size: 13pt"><b>분위기</b></div>
 	<div id="bar2"></div>
	<div id="tastediv">
		<div id="atmosphere_one" class="choose_name">매우나쁨</div><input type="radio" name="TOUR_ATMOSPHERE" id="one2" value="1"  ${boarddata.TOUR_ATMOSPHERE==1 ? "checked" : ""} disabled>
		<div id="atmosphere_two" class="choose_name">나쁨</div><input type="radio" name="TOUR_ATMOSPHERE" id="two2" value="2"  ${boarddata.TOUR_ATMOSPHERE==2 ? "checked" : ""} disabled>
		<div id="atmosphere_three" class="choose_name">보통</div><input type="radio" name="TOUR_ATMOSPHERE" id="three2" value="3" ${boarddata.TOUR_ATMOSPHERE==3 ? "checked" : ""} disabled>
		<div id="atmosphere_four" class="choose_name">좋음</div><input type="radio" name="TOUR_ATMOSPHERE" id="four2" value="4"  ${boarddata.TOUR_ATMOSPHERE==4 ? "checked" : ""} disabled>
		<div id="atmosphere_five" class="choose_name">매우좋음</div><input type="radio" name="TOUR_ATMOSPHERE" id="five2" value="5"  ${boarddata.TOUR_ATMOSPHERE==5 ? "checked" : ""} disabled>
	</div>
	
	
	<div style="margin: 0px 0 0 5px; font-size: 13pt"><b>서비스</b></div>
 	<div id="bar3"></div>
	<div id="tastediv">
		<div id="service_one" class="choose_name">매우나쁨</div><input type="radio" name="TOUR_SERVICE" id="one3" value="1"  ${boarddata.TOUR_SERVICE==1 ? "checked" : ""} disabled>
		<div id="service_two" class="choose_name">나쁨</div><input type="radio" name="TOUR_SERVICE" id="two3" value="2"  ${boarddata.TOUR_SERVICE==2 ? "checked" : ""} disabled>
		<div id="service_three" class="choose_name">보통</div><input type="radio" name="TOUR_SERVICE" id="three3" value="3"  ${boarddata.TOUR_SERVICE==3 ? "checked" : ""} disabled>
		<div id="service_four" class="choose_name">좋음</div><input type="radio" name="TOUR_SERVICE" id="four3" value="4"  ${boarddata.TOUR_SERVICE==4 ? "checked" : ""} disabled>
		<div id="service_five" class="choose_name">매우좋음</div><input type="radio" name="TOUR_SERVICE" id="five3" value="5"   ${boarddata.TOUR_SERVICE==5 ? "checked" : ""} disabled>
	</div>
 	
 	<div style="margin-top: 40px;">
 		<button style="float:left; margin-top:13px" class="btn btn-light" onclick="history.go(-1)">취소</button>
 		<button style="float:right; margin-top:13px" class="btn btn-primary" id=board_tour_modify_btn>수정</button>
 		
 		<a href="#">
			<button style="float:right; margin-top:13px; margin-right:10px;" id="board_tour_delete_btn"  class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</button>
		</a>
 		
 	</div>
 	</div><!-- 오른쪽 content 자리 -->  
			
			<div class="col-sm-2">
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	
	<%--modal 시작 --%>
			<div class="modal" id="myModal">
			 <div class="modal-dialog">
			  <div class="modal-content">
			   <%-- Modal body --%>
			   <div class="modal-body">
			   	<form name="deleteForm" action="delete" method="post" id="deleteForm">
			   	<%-- http://localhost:8088/Board/BoardDetailAcion.bo?num=22
			   		주소를 보면 num을 파라미터로 넘기고 있습니다.
			   		이 값을 가져와서 ${param.num}를 사용
			   		또는 ${boarddata.board_num} 
			   	--%>
			   	<input type="hidden" name="num" id="board_num" value="${param.num}"> <!-- name이 num이였음 -->
			   	<div class="form-group">
			   		<label for="pwd">삭제할려면 "삭제하겠습니다." 를 입력하세요</label>
			   		<input type="text"
			   			class="form-control" placeholder="Enter text"
			   			name="tour_answer" id="tour_answer">
			   	</div>
			   	<button type="submit" class="btn btn-primary" id="modal_submit">전송</button>
			   	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			   	</form>
			   </div><!-- class="modal-body" -->
			  </div><!-- class="modal-content" -->
			 </div><!-- class="modal-dialog" -->
			</div><!-- class="modal end"  <div class="modal" id="myModal">-->
	
</body>

</html>
