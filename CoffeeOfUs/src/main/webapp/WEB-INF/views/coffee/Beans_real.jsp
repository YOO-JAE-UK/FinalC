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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

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

  
</style>
<script>

</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="Test">나만의 커피 찾기</a> 
				<a href="#">커피 용어 찾기</a>
				<a class="active" href="#">원두</a>
				<a href="#">머신</a>
				<a href="#">레시피</a>
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px;">
			
			
			
			
			<div style="text-align: center;"><h2><b><font color="#99654e">커피 디테일</font></b></h2></div>



		
  					<div style="text-align: center; margin:0 auto;">
  						<div style="margin: 0 auto; margin-bottom: 20px; border: 2px solid black; width: 300px; height: 100px;" id="word_content">
  							<div style="width: 100%; height: 80%;">
  								<div style="float: left; width: 50%;height: 80px">hi</div>
  								<div style="float: left; width: 50%;height: 80px">hi</div>
  							</div>
  							<div style="text-align:left; margin-left:5px; width:100%; height: 20px; overflow: hidden;">
  								input이 들어갈 자리입니다.
							</div>
  						</div>
					
					</div>
						<div>
							<div style="float:left; width: 300px; height:300px; margin-left: 5%">
									<canvas id="myChart" width="300" height="300"></canvas>
							</div>
							<div style="float:left; width: 300px; height:300px; background: red; margin-left: 5%">
								<div style="width: 100%;height: 100px;border: 1px solid black;">로스팅</div>
								<div style="width: 100%;height: 200px;border: 1px solid black;">짧은설명</div>
							</div>	
						</div>
					<script>
					
					//chart.js
					var ctx = document.getElementById('myChart').getContext('2d');
					var myChart = new Chart(ctx, {
					    type: 'radar',
					    data: {
					        labels: ['향', '신맛', '단맛', '밸런스', '바디감'],
					        datasets: [{
					            label: '맛',
					            data: [5, 4, 3, 2, 1],
					           /*  backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ], */
					          /*   borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ], */
					            borderWidth: 0,
					            
					            borderColor:'rgba(162, 97, 31, 0.7)',
					            backgroundColor:'rgba(162, 97, 31, 0.7)'
					        }]
					    },
					    options: {
					    	animation:false,
					    	grid:{
					    		circular:false
					    	},
					    	legend:{
					        	display:false
					        },
					    	scale:{
					    			ticks: {
					    				display:false, //글자없애기
						        		maxTicksLimit:5,
						        		
						        	},
					    	},
					    	
					        
					        
					       
					        
					    }
					});
</script>
					
				<div style="clear: both;">
				<button type="button" class="btn btn-info float-right" data-toggle="modal" data-target="#myModal">단어 추가하기</button> 
				</div>		
		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	
</body>

</html>