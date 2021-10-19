<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=1%>" />
</jsp:include>

<!-- <script src="../resources/js/jquery-3.6.0.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 이거추가하면 되는게안됨 안되는건 됨-->
<link rel="stylesheet" href="../resources/css/coffee_write.css">
<script src="../resources/js/coffee/coffee_write.js" charset="utf-8"></script>
<!--  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> -->
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



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
</style>
<script>

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
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px;">
			
			
			
			
			<div style="text-align: center;"><h2><b><font color="#99654e">커피 등록하기</font></b></h2></div>



<form action="bean_add" method="post" enctype="multipart/form-data">		
  					<div style="text-align: center; margin:0 auto;">
  						<div style="margin: 0 auto; margin-bottom: 20px; border: 2px solid black; width: 300px; height: 100px;" id="word_content">
  							<div style="width: 100%; height: 80%;">
  								<div style="float: left; width: 50%;height: 80px">
  								
  								<img style="height: 100%;
  								" src="${pageContext.request.contextPath}/resources/img/coffee_bean.jpg" alt="bean_image" title="bean_image" class="shoe fade-in one" id="cafe_image"/> 
								   <div id="image_container"></div>
								  
								   
  								
  								
  								
  								
  								
  								</div>
  								<div style="float: left; width: 50%;height: 80px">
									 <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
								</div>
  							</div>
  							<div style="text-align:left; width:100%; height: 20px; overflow: hidden;">
  								
								
								
								<div  style="text-align: left; color: white; font-size:12pt; background: #484848">
								  	 <label style="color:white; margin-bottom: 0; margin-left: 5px;">파일 첨부</label>
										<label style="margin-bottom:0" for="upfile">
											<img style="margin-bottom: 5px;" src="../resources/img/attach.png" alt="파일첨부" width="20px">
										</label>
										<input type="file" id="upfile" name="uploadfile" multiple="multiple" accept="image/*">
										 <span id="filevalue"></span>
								   </div>
								
								


							</div>
  						</div><!-- 189번 엔드 -->
					</div>
					<div>
						<div style="margin-left:15%">
							<div style="float:left; width: 300px; height:300px; margin-left: 5%">
							
						
								
								<table>
									<thead>
										<tr>
											<th colspan="2" style="text-align: center; width: 300px"><h4>테이스트</h4> </th>
										</tr>
									</thead>
									<tbody>
									<tr><td colspan="2" style="height: 20px;"></td><tr>
										<tr>
											<td style="width: 58%; text-align: center; ">바디감</td>
											<td style=" width: 40% !important; text-align: right !important;">
												<select class="form-control select_form1" name="BEAN_BODY">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</td>
										</tr>
									<tr><td colspan="2" style="height: 20px;"></td><tr>
										<tr>
											<td style="width: 58%; text-align: center; ">단맛</td>
											<td style=" width: 40% !important; text-align: right !important;">
												<select class="form-control select_form1" name=BEAN_SWEET>
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</td>
										</tr>
									<tr><td colspan="2" style="height: 20px;"></td><tr>
										<tr>
											<td style="width: 58%; text-align: center; ">밸런스</td>
											<td style=" width: 40% !important; text-align: right !important;">
												<select class="form-control select_form1" name="BEAN_BALANCE">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</td>
										</tr>
									<tr><td colspan="2" style="height: 20px;"></td><tr>
										<tr>
											<td style="width: 58%; text-align: center; ">향</td>
											<td style=" width: 40% !important; text-align: right !important;">
												<select class="form-control select_form1" name="BEAN_AROMA">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</td>
										</tr>
										<tr><td colspan="2" style="height: 20px;"></td><tr>
										<tr>
											<td style="width: 58%; text-align: center; ">신맛</td>
											<td style=" width: 40% !important; text-align: right !important;">
												<select class="form-control select_form1" name="BEAN_SOUR">
												  <option>1</option>
												  <option>2</option>
												  <option>3</option>
												  <option>4</option>
												  <option>5</option>
												</select>
											</td>
										</tr>
										
										
										
									</tbody>
								</table>
								
							
							</div>
							<div style="float:left; width: 300px; height:300px; margin-left: 5%">
								<div style="width: 100%;height: 100px;border: 1px solid black; text-align: center;">
								
				<div style="float: right">
		      <!--별  -->
			      <div class="star-input"> 
			      <!-- <p class="score"><b>0</b>점</p>  -->
			      	<span class="input"> 
			     		<input type="radio" name="BEAN_ROASTING" value="1" id="p1">
			     		<label for="p1">1</label>
			     		<input type="radio" name="BEAN_ROASTING" value="0.5" id="p1_2">
			     		<label for="p1_2">0.5</label>
			     		<input type="radio" name="BEAN_ROASTING" value="2" id="p2"> 
			     		<label for="p2">2</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="1.5" id="p2_2"> 
			     		<label for="p2_2">1.5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="3" id="p3"> 
			     		<label for="p3">3</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="2.5" id="p3_2"> 
			     		<label for="p3_2">2.5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="4" id="p4"> 
			     		<label for="p4">4</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="3.5" id="p4_2"> 
			     		<label for="p4_2">3.5</label> 
			     		<input type="radio" name="BEAN_ROASTING" value="5" id="p5"> 
			     		<label for="p5">5</label> 
	<!-- 9 -->		     		<input type="radio" name="BEAN_ROASTING" value="4.5" id="p5_2"> 
			     		<label for="p5_2">4.5</label> 
			     	</span> 
			     </div>
		      <!-- 별끝 -->
		      </div>
				<div style="float: left; text-align: center;width: 100%">로스팅 단계를 선택해주세요</div>
								</div><!-- 로스팅 end -->
								<div style="width: 100%;height: 30px; text-align: left; background: white; padding-top: 3px;"> <h4>커피이름</h4></div>
								<input style="width: 100%;height: 30px;" placeholder="커피이름을 입력하세요." name="BEAN_NAME">
								<div style="width: 100%;height: 30px; text-align: left; background: white; padding-top: 3px;"> <h4>특징</h4></div>
								<textarea style="width: 100%;height: 110px;border: 1px solid black;" placeholder="내용을 입력하세요" name="BEAN_CONTENT"></textarea>
							</div>	
						</div>
					</div>
					
					<div style="clear: both;">
				<button style="font-size: 12pt;" id="bean_write" type="submit" class="btn btn-info float-right">등록완료</button> 
				</div>	
</form>						
					
					
					
					
		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	
</body>

</html>