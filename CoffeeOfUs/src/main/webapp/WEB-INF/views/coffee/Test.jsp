<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Story</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
        
        .shadow1{
            width:100%;
            height:100%;
            overflow:hidden;
            border:1px solid black;
        }
        
        .shadow1 img{
          width: 50%;
   		 height: 180px;
   		 margin-top: 10px;
   		 margin-bottom: 10px;
        }
        
         
        .shadow1 img:hover{
        
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
    border: 1px solid #9500001c;
    transform: translate(-50%, -50%);
	}
	.start_content{
		padding-top: 38px;
		color: #730000 !important;
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
		padding-top: 23px;
		color: #730000 !important;
		font-size: 15pt;
		background: burlywood;
		padding-bottom: 26px;
	}
	/*
	.final{
		height: 300px;
		width: 250px;
	    position: absolute;
	    top: 45%;
	    left: 50%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	}
	*/
	.final1{
		height: 620px;
		width: 400px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    border: 1px solid black;
	    transform: translate(-50%, -50%);
	    background: white;
	    text-align: center;
	}
	/*  */

.a1:link{
	color:black;
}
.a1:hover {
	color:black !important;
}
</style>
<script>
var title="";
var description="";
var imageUrl="";
$(document).ready(function(){
	$('.psychological_test1').hide();
	$('.psychological_test2').hide();
	$('.psychological_test3').hide();
	$('.final1').hide();
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
		$('.final1').show(1000);
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
			title= data.board.bean_NAME;
			description=data.board.bean_CONTENT;
			imageUrl='';//안됨
			
			aroma 	= data.board.bean_AROMA
			sour	=data.board.bean_SOUR
			sweet	=data.board.bean_SWEET
			balance	=data.board.bean_BALANCE
			body	=data.board.bean_BODY
			console.log(JSON.stringify(data));
			//$("#viewcount").val(data.limit); //엄청긴글의 json을 받아온거에 limit값 고정할려고씀
			//$("table").find("font").text("글 개수 : " + data.listcount);
			output="";
			output +='<div><h3><a href="bean_detail?num='+data.board.bean_NUM+'">'+data.board.bean_NAME+'</a></h3></div>'
			output +='<a class="a1" href="bean_detail?num='+data.board.bean_NUM+'"> <img src="../upload'+data.board.bean_FILE+'" alt="chocolate cake"></a>'
			output +='<div style=" width: 250px; height:250px; margin-left: 5%">'
			output +='	<canvas id="myChart" width="250px" height="250px" style="margin-left: 60px;"></canvas>'
			output +='</div>'
			output +='<div style="FONT-SIZE: 10pt;width: 70%; margin: 0 auto; height: 80px;">'+data.board.bean_CONTENT+'</div>'
			$("#test999").append(output);
			
			//차트
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
								//차트 end
			
				
		}, //success end
		error : function() {
			console.log('에러')
		}
	})//ajax end
	})

	
	
})// end

Kakao.init('c150df286e8f1db089d3af114343b5d7');
function sendLinkKakao(){
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: title,
        description: description,
        imageUrl: 'https://blogger.googleusercontent.com/img/a/AVvXsEhO6ZXZLBYkxOYggiPvoWCnt8jl5dfcWotEaFoSKIidTht6D8XpfoKTrm6fGRlyhhRuUPWDMcm8TEflsia1qSl-uIkIAVzHAOT2S6bWxyhOr5Er0nVGw-cWKvAJoZkAW9Hzzsxm_eytWcBSxceMxL2TTLNTSjfwAP3PUXOghNQKfmRPvd0gr6Lcyx0F=w945-h600-p-k-no-nu',
        link: {
          mobileWebUrl: 'http://localhost:8088/myhome/coffee/Test',
          webUrl: 'http://localhost:8088/myhome/coffee/Test'
        }
      },
      buttons: [       
        {
          title: '링크 열기',
          link: {
            mobileWebUrl: 'http://localhost:8088/myhome/coffee/Test',
            webUrl: 'http://localhost:8088/myhome/coffee/Test'
          }
        }
      ]
    }); 
    
}


</script>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 1 %>"/>
	</jsp:include>



<div class="row" style="background: #f7f7f7; position: relative; height: 750px;">
			<div class="start"><p class="start_content">시작하기</p></div>


			<div class="psychological_test1">
				<div class="test1_1 shadow" id="test1_1"> 
						<img src="${pageContext.request.contextPath}/resources/img/chocolate_cake.jpg" alt="chocolate cake">
						<p class="main_content">초콜릿, 특히 씁슬한 맛이 나는 강한 맛의 다크 초콜릿</p>
						<input type="hidden" value="chocolate" >
				</div>
				<div class="test1_2 shadow" id="test1_2"> 
						<img src="${pageContext.request.contextPath}/resources/img/biscuit-cake.jpg" alt="chocolate cake">
						<p class="main_content">달달하고 씹히는 맛의 비스킷</p>
						<input type="hidden" value="biscuit">
				</div>
				<div class="test1_3 shadow" id="test1_3"> 
						<img src="${pageContext.request.contextPath}/resources/img/lemon_cake.jpg" alt="chocolate cake">
						<p class="main_content">상큼한 과일향이 나는 레몬케이크</p>
							<input type="hidden" value="lemon">
				</div>
			</div>



			<div class="psychological_test2">
				<div class="test2_1 shadow" id="test2_1"> 
						<img src="${pageContext.request.contextPath}/resources/img/apple_red.jpg" alt="chocolate cake">
						<p class="main_content">달콤하고 부드러운</p>
						<input type="hidden" value="red_apple" >
				</div>
				<div class="test2_2 shadow" id="test2_2"> 
						<img src="${pageContext.request.contextPath}/resources/img/apple_green.jpg" alt="chocolate cake">
						<p class="main_content">산미가 있고 씹히는 식감</p>
						<input type="hidden" value="green_apple" >
				</div>		
			</div>
			
			<div class="psychological_test3">
				<div class="test3_1 shadow" id="test3_1"> 
						<img src="${pageContext.request.contextPath}/resources/img/light_bean.jpg" alt="chocolate cake">
						<p class="main_content">부드럽고 가벼운 커피</p>
						<input type="hidden" value="1" >
				</div>
				<div class="test3_2 shadow" id="test3_2"> 
						<img src="${pageContext.request.contextPath}/resources/img/medium_coffee.jpg" alt="chocolate cake">
						<p class="main_content">중간 강도</p>
						<input type="hidden" value="2" >
				</div>
				<div class="test3_3 shadow" id="test3_3"> 
						<img src="${pageContext.request.contextPath}/resources/img/dark_bean.jpg" alt="chocolate cake">
						<p class="main_content">입안을 가득 채우며 진한 여운을 남기는 커피</p>
						<input type="hidden" value="3" >
				</div>		
			</div>

			<div class="psychological_test4">
				<div class="final1 shadow1" id="test999"> 
						
						<!-- <p class="main_content">상큼한 과일향이 나는 레몬케이크</p> -->
						<span class="sociallink ml-1">
					    <a class="a1" href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유">
					        <img src="//k.kakaocdn.net/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg" width=36 alt="Kakaotalk"
							style="width: 30px; height: 30px; margin-left: 87% ">
					    </a>
					</span>
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