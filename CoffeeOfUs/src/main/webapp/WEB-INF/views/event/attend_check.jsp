<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 2 %>"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<style>
.eventWrapContent_right{
psition:relative;
width:100px;
height:20px !important;
border-radius:8px;
background:#fff;
border:1px solid lightgray !important;
}
.eventWrapContent__right p {
    padding-top:90px;
    padding-bottom:30px;
    border-bottom: 1px solid #ddd;
    text-align: center;
    font-size: 18px;
    line-height: 1.44;
    letter-spacing: -.54px;
}
.eventWrapContent__right .checkNumber {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    position: absolute;
    padding-top: 20px;
    left: 50%;
    -webkit-transform: translateX(-50%);
    transform: translateX(-50%);
    font-size: 22px;
}

</style>
</head>
<body>
<input id="id" type="hidden" value="a">

<div class="row">
<div class="col-sm-3">
</div>	
<div class="container calendar-container col-sm-7">
	<div id="calendar" style="max-width:900px; margin:40px auto;"></div>
</div>
<div data-v-8e5f91ac="" class="eventWrapContent__right col-sm-2" >
 	<p data-v-8e5f91ac="">나의 출석횟수는?</p>
   <div data-v-8e5f91ac="" class="checkNumber">
   		<span data-v-8e5f91ac="" class="checkinEvent__number__checkin">0</span>번 
   	</div>
</div>
</div>

<script src="../resources/js/event/attendCheck.js" charset="utf-8"></script>
<jsp:include page="../footer.jsp" />
</body>
</html>