<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Story</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<style>
/* 이미지를 호버했을 때커지는기능  */
 .shadow{
            width:100%;
            height:100%;
            overflow:hidden;
            border:1px solid black;
        }
        
        .shadow img{
            width:100%;
            height:75%;
        }
        
         
        .shadow img:hover{
        
            cursor:pointer;
            -webkit-transform:scale(1.1); /*  크롬 */
            -moz-transform:scale(1.1); /* FireFox */
            -o-transform:scale(1.1); /* Opera */
            transform:scale(1.1);
            transition: transform .35s;
            -o-transition: transform .35s;
            -moz-transition: transform .35s;
            -webkit-transition: transform .35s;
        }



/* 시작하기 css  */
	.start{	
	height: 100px;
    position: absolute;
    top: 45%;
    left: 50%;
    border: 1px solid black;
    transform: translate(-50%, -50%);
	}
	.start_content{
		padding-top: 38px;
		color: white !important;
		font-size: 40pt;
	}
	/* 시작하기 css end */
	.test1_1, .test3_1{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 25%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	.test1_2, .test3_2{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 50%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	.test1_3, .test3_3{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 75%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	
	.test2_1{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 40%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	.test2_2{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 60%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	.main_content{
		text-align:center;
		padding-top: 12px;
		color: white !important;
		font-size: 15pt;
	}
	
	.final{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 50%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	
	/*  */
</style>
<script>
$(document).ready(function(){
	$('.psychological_test1').hide();
	$('.psychological_test2').hide();
	$('.psychological_test3').hide();
	$('.final').hide();
	$('.start').click(function(){
		$('.start').hide();
		$('.psychological_test1').show(1000);
	})
	
	$('.test1_1, .test1_2, .test1_3').click(function(){
		var id =$(this).attr("id");
		var inputv = $('.'+id+' input').val();
		condition1 =$('#condition1').val(inputv);
		//alert("처음"+inputv);
		
		$('.psychological_test1').hide();
		$('.psychological_test2').show(1000);
	})
	$('.test2_1, .test2_2, .test2_3').click(function(){
		var id =$(this).attr("id");
		var inputv = $('.'+id+' input').val();
		condition2 =$('#condition2').val(inputv);
		//alert("중간"+inputv);
		
		$('.psychological_test2').hide();
		$('.psychological_test3').show(1000);
		
	})
	
	$('.test3_1, .test3_2, .test3_3').click(function(){
		$('.psychological_test3').hide();
		$('.final').show(1000);
		//$('.psychological_test3').show(1000);
		var id =$(this).attr("id");
		var inputv = $('.'+id+' input').val();
		condition3 =$('#condition3').val(inputv);
		//alert("끝"+inputv);
		$.ajax({
		type : "POST",
		data : {
			"cake" : $('#condition1').val(),
			"apple" : $('#condition2').val(),
			"roasting" : $('#condition3').val()
		},
		url : "coffee_test",
		dataType : "json",
		cashe : false,
		success : function(data) {
			console.log(JSON.stringify(data));
			//$("#viewcount").val(data.limit); //엄청긴글의 json을 받아온거에 limit값 고정할려고씀
			//$("table").find("font").text("글 개수 : " + data.listcount);
			output="";
			output +="<div>"+data.cake+"</div>"
			$("#test999").append(output);
			
			
		}, //success end
		error : function() {
			console.log('에러')
		}
	})//ajax end
	})
})
</script>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 1 %>"/>
	</jsp:include>



<div class="row" style="background: #b8652c; position: relative; height: 750px;">
			<div class="start"><p class="start_content">시작하기</p></div>


			<div class="psychological_test1">
				<div class="test1_1 shadow" id="test1_1"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">초콜릿, 특히 씁슬한 맛이 나는 강한 맛의 다크 초콜릿</p>
						<input type="hidden" value="chocolate" >
				</div>
				<div class="test1_2 shadow" id="test1_2"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">달달하고 씹히는 맛의 비스킷</p>
						<input type="hidden" value="biscuit">
				</div>
				<div class="test1_3 shadow" id="test1_3"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">상큼한 과일향이 나는 레몬케이크</p>
							<input type="hidden" value="lemon">
				</div>
			</div>



			<div class="psychological_test2">
				<div class="test2_1 shadow" id="test2_1"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">달콤하고 부드러운</p>
						<input type="hidden" value="red_apple" >
				</div>
				<div class="test2_2 shadow" id="test2_2"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">산미가 있고 씹히는 식감</p>
						<input type="hidden" value="green_apple" >
				</div>		
			</div>
			
			<div class="psychological_test3">
				<div class="test3_1 shadow" id="test3_1"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">부드럽고 가벼운 커피</p>
						<input type="hidden" value="1" >
				</div>
				<div class="test3_2 shadow" id="test3_2"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">중간 강도</p>
						<input type="hidden" value="2" >
				</div>
				<div class="test3_3 shadow" id="test3_3"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<p class="main_content">입안을 가득 채우며 진한 여운을 남기는 커피</p>
						<input type="hidden" value="3" >
				</div>		
			</div>

			<div class="psychological_test4">
				<div class="final shadow" id="test999"> 
						<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="chocolate cake">
						<!-- <p class="main_content">상큼한 과일향이 나는 레몬케이크</p> -->
						
				</div>
			</div>
				

<input id="condition1" type="hidden">
<input id="condition2" type="hidden">
<input id="condition3" type="hidden">

</div>	



     
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>