<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 123 %>"/>
</jsp:include>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<script>
console.log("4");
</script>
</head>
<body>


	
<div class="container calendar-container">
	<div id="calendar" style="max-width:900px; margin:40px auto;"></div>
</div>


<script src="../resources/js/event/attendCheck.js" charset="utf-8"></script>
<jsp:include page="../footer.jsp" />
</body>
</html>