<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 이거추가하면 되는게안됨 안되는건 됨-->
<link rel="stylesheet" href="../resources/css/coffee_write.css">
<script src="../resources/js/coffee/coffee_write.js" charset="utf-8"></script>
<!--  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> -->
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=1%>" />
</jsp:include>


<style>

/*  */
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
	min-height: 400px;
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


/* 부트스트랩 재정의 */
.nice-select  {
	line-height: 20px !important;
}
.select_form1{
	height: 30px !important;
    width: 20px !important;
    padding-right: 30px !important;
    padding-left: 10px !important;
}
tr{
	margin-top: 20px;
}
.bean_list{
	 border: 1px solid black;
	 margin: 0 auto;
	  height: 150px;
	  width: 150px; 
	  
}
.bean_name{
	text-align: center;
    font-size: 12pt;
}
.bean_name a:link {
    color: black;
}
	

</style>
<script>
$(document).ready(function(){
	$("#bean_write").click(function(){
		location.href="Beans_write";
	})
})

</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="Test">나만의 커피 찾기</a> 
				<a href="Fword">커피 용어 찾기</a>
				<a class="active" href="Beans">원두</a>
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px;">
		
			
			
			<div style="text-align: center; margin-bottom: 30px"><h2><b><font color="#99654e">원두 리스트</font></b></h2></div>

			<hr style="border: 2px solid gray;  background: gray;">
			
						
<c:if test="${listcount > 0 }">	
	<c:set var="num" value="${listcount-(page-1)*limit}"/>	
			
			
			<div class="row">
<c:forEach var="b" items="${boardlist}" varStatus="state">	
				<div class="col-xs-6 col-sm-3" >
				
					<div class="bean_list"><a href="bean_detail?num=${b.BEAN_NUM}"><img src="../upload${b.BEAN_FILE}" width="100%" height="100%"/></a></div>
					<div class="bean_name"><a href="bean_detail?num=${b.BEAN_NUM}">${b.BEAN_NAME}</a></div>
				
				</div>
<c:if test="${state.count==4}">
		<hr style="border: 1px solid gray; width: 100%;">
</c:if>
</c:forEach>

			</div>


</c:if>
<c:if test="${listcount == 0 }">
	 등록된 글이 없습니다.
</c:if>
					
				<div style="clear: both;">
					<button style="font-size: 12pt;" id="bean_write" type="button" class="btn btn-info float-right">원두 등록하기</button> 
				</div>	
			
					
					
					
					
		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	
</body>

</html>