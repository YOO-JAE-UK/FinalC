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

.bean_content{
display:flex;
	width: 100%;
	justify-content: center;
}
.bean_name{
		display: table-cell;
		vertical-align: middle;
		font-size: 12pt;
		font-weight: bold;
}
@media only screen and (min-width: 1200px) {
	.container {
		max-width: 800px !important;
	}
}
.bean_roasting1{
	width: 18%;
    display: inline-block;
    text-align: center;
}   
  
.bean_roasting2{
	width: 30%;
    display: inline-block;
    text-align: center;
} 
  
.bar{
	position:relative;
	width: 100%;
    height: 20px;
    text-align: left;
    background: linear-gradient(to right, #a97b48, #532507);
    padding-top: 3px;
    border-radius: 25px;
    margin-top: 65px;
    margin-bottom: 5px;
}

    
}

.bar_gauge{
	position: absolute;
	width: 20px;
	height: 100%;
	border-radius:100%;
	background: #f04444;
	top:0;
	left: 10%;
}

.bar_gauge{
	width: 20px;
    height: 20px;
    background: white;
    top: 0;
    margin-left: 8%;
    margin-top: -3px;
    border: 4px solid #f04444;
    border-radius: 100%;
}
</style>
<script>
$(document).ready(function(){
	var bar_gauge = ${boarddata.BEAN_ROASTING}
	if(bar_gauge ==0.5 || bar_gauge ==1){
		$(".bar_gauge").css("margin-left","8%");
	}else if(bar_gauge ==1.5){
		$(".bar_gauge").css("margin-left","18%");
	}else if(bar_gauge ==2){
		$(".bar_gauge").css("margin-left","27%");
	}else if(bar_gauge ==2.5){
		$(".bar_gauge").css("margin-left","37%");
	}else if(bar_gauge ==3){
		$(".bar_gauge").css("margin-left","47%");
	}else if(bar_gauge ==3.5){
		$(".bar_gauge").css("margin-left","56%");
	}else if(bar_gauge ==4){
		$(".bar_gauge").css("margin-left","66%");
	}else if(bar_gauge ==4.5){
		$(".bar_gauge").css("margin-left","75%");
	}else if(bar_gauge ==5){
		$(".bar_gauge").css("margin-left","85%");
	}
	
	$("#modify_btn").click(function(){
		location.href="Beans_modify?num="+${boarddata.BEAN_NUM}
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
				<a href="#">머신</a>
				<a href="#">레시피</a>
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px; margin-bottom: 30px; border: 1px solid black">
			
			
			
			
			<div style="text-align: center;"><h2><b><font color="#99654e">원두 정보</font></b></h2></div>



		
  					<div style="text-align: center; margin:0 auto;">
  						<div style="margin: 0 auto; margin-bottom: 20px; border: 2px solid black; width: 300px; height: 100px;" id="word_content">
  							<div style="width: 100%; height: 80%;">
  								<div style="float: left; width: 50%%;height: 96px">
  									 <img src="../upload${boarddata.BEAN_FILE}" width="148px" height="96px">
  								</div>
  								<div style="float: left; width: 50%;height: 96px; display: table;">
  									<div class="bean_name">${boarddata.BEAN_NAME}</div>
  								</div>
  							</div>
  						</div>
					
					</div>
						<div class="bean_content">
							<div style="float:left; width: 300px; height:300px; margin-left: 5%">
									<canvas id="myChart" width="300" height="300"></canvas>
							</div>
							
							<div style="float:left; width: 300px; height:300px; margin-left: 5%">
								<div style="width: 100%;height: 130px;border: 1px solid black; text-align: center;">
								
				<div style="float: right">
		      <!--별  -->
			      <div class="star-input"> 
			      <img src="../resources/img/coffee_roasting.png">
			      	<span class="input" style="display: none;"> 
			     		<input type="radio" name="BEAN_ROASTING" value="1" id="p1" ${boarddata.BEAN_ROASTING==1 ? "checked":""} disabled>
			     		<label for="p1">1</label>
			     		<input type="radio" name="BEAN_ROASTING" value="0.5" id="p1_2" ${boarddata.BEAN_ROASTING==0.5 ? "checked":""} disabled>
			     		<label for="p1_2">0.5</label>
			     		<input type="radio" name="BEAN_ROASTING" value="2" id="p2" ${boarddata.BEAN_ROASTING==2 ? "checked":""} disabled> 
			     		<label for="p2">2</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="1.5" id="p2_2" ${boarddata.BEAN_ROASTING==1.5 ? "checked":""} disabled> 
			     		<label for="p2_2">1.5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="3" id="p3" ${boarddata.BEAN_ROASTING==3 ? "checked":""} disabled> 
			     		<label for="p3">3</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="2.5" id="p3_2" ${boarddata.BEAN_ROASTING==2.5 ? "checked":""} disabled> 
			     		<label for="p3_2">2.5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="4" id="p4" ${boarddata.BEAN_ROASTING==4 ? "checked":""} disabled> 
			     		<label for="p4">4</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="3.5" id="p4_2" ${boarddata.BEAN_ROASTING==3.5 ? "checked":""} disabled> 
			     		<label for="p4_2">3.5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="5" id="p5" ${boarddata.BEAN_ROASTING==5 ? "checked":""} disabled> 
			     		<label for="p5">5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="4.5" id="p5_2" ${boarddata.BEAN_ROASTING==4.5 ? "checked":""} disabled> 
			     		<label for="p5_2">4.5</label> 
			     	</span> 
			     </div>
		      <!-- 별끝 -->
		      </div>
		      		<div class="bar">
						<div class="bar_gauge"> </div>
					</div>
		      		
		      	
				<div style="float: left; text-align: center;width: 100%;font-size: 10pt;">
					<span class="bean_roasting1">미디엄</span>
					<span class="bean_roasting1">하이</span>
					<span class="bean_roasting1">시티</span>
					<span class="bean_roasting1">풀시티</span>
					<span class="bean_roasting1">프렌치</span>
				</div>
				<div style="float: left; text-align: center;width: 100%; font-size: 10pt;" >
					<span class="bean_roasting2" style="padding-left: 20px">라이트</span>
					<span class="bean_roasting2">미디엄</span>
					<span class="bean_roasting2" style="padding-right: 20px">다크</span>
				</div>
				
								</div><!-- 로스팅 end -->
								
								<!-- <div style="width: 100%;height: 30px; text-align: left; background:red ;padding-top: 3px;border-radius: 5px;"><h4>이름</h4></div> -->
								<div style="display:inline-block; width: 100%;height: 30px; text-align: left; background: white; padding-top: 3px;"> <h4>특징</h4></div>
								<textarea style="width: 100%;height: 110px;border: 1px solid black;" placeholder="내용을 입력하세요" name="BEAN_CONTENT" readonly="readonly">${boarddata.BEAN_CONTENT}</textarea>
							</div>	
						</div>
						
						
				<div style="clear: both;">
					<button type="button" id="modify_btn" class="btn btn-info float-right">수정</button> 
				</div>		
		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>
						
						
					<script>
					
					//chart.js
					var aroma 	= ${boarddata.BEAN_AROMA}
					var sour	=${boarddata.BEAN_SOUR}
					var sweet	=${boarddata.BEAN_SWEET}
					var balance	=${boarddata.BEAN_BALANCE}
					var body	=${boarddata.BEAN_BODY}
					
					var ctx = document.getElementById('myChart').getContext('2d');
					var myChart = new Chart(ctx, {
					    type: 'radar',
					    data: {
					        labels: ['바디감', '단맛', '밸런스', '향', '신맛'],
					        datasets: [{
					            label: '맛',
					            data: [body, sweet, balance,aroma, sour ],
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
					    				min:0,
					    				max:5,
					    				display:false, //글자없애기
						        		maxTicksLimit:10
						        	},
					    	},
					    	
					        
					        
					       
					        
					    }
					});
</script>
					


	<jsp:include page="../footer.jsp" />
	
</body>

</html>