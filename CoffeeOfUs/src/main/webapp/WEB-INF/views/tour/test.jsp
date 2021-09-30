<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tour_review</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../resources/css/tour_board_write.css">

 <style>
	#bar1{
		height: 10px;
		background: red;
		width: 10px;
	}
	.choose_name{
	float: left;
	}
	input[name=taste]{
		display: none;
	}
</style>

</head>
<body>

	<div id="bar1"></div>
	<div id="tastediv">
		<div id="taste_one" class="choose_name">매우불만</div><input type="radio" name="taste" id="one1">
		<div id="taste_two" class="choose_name">불만</div><input type="radio" name="taste" id="two1">
		<div id="taste_three" class="choose_name">보통</div><input type="radio" name="taste" id="three1">
		<div id="taste_four" class="choose_name">만족</div><input type="radio" name="taste" id="four1">
		<div id="taste_five" class="choose_name">매우맨족</div><input type="radio" name="taste" id="five1">
	</div>
  </body>	
  
  <script>
	$("#taste_one").click(function(){
		$("#bar1").css("background","black").css("width","100px")
		$("#one1").prop("checked","checked")
	})
	$("#taste_two").click(function(){
		$("#bar1").css("background","black").css("width","200px")
		$("#two1").prop("checked","checked")
	})
	$("#taste_three").click(function(){
		$("#bar1").css("background","black").css("width","300px")
		$("#three1").prop("checked","checked")
	})
	$("#taste_four").click(function(){
		$("#bar1").css("background","black").css("width","400px")
		$("#four1").prop("checked","checked")
	})
	$("#taste_five").click(function(){
		$("#bar1").css("background","black").css("width","500px")
		$("#five1").prop("checked","checked")
	})
</script>
</html>
