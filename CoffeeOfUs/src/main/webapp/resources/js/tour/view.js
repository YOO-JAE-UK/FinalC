$(document).ready(function() {
	

				/* 별점 */
				var starRating = function(){
	var $star = $(".star-input"),
	    $result = $star.find("output>b");
		
	  	$(document)
		.on("focusin", ".star-input>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star-input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star-input :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".star-input label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".star-input>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("0");
	   		 	} else {
	     	 		$result.text($checked.next().text());
	    		}
	  	});
	};

	starRating();			
	
	//bar
	if($("#one1").prop("checked")){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","8%")
	}else if($("#two1").prop("checked")){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","28%")
	}else if($("#three1").prop("checked")){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","48%")
	}else if($("#four1").prop("checked")){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","68%")
	}else if($("#five1").prop("checked")){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","98%");
	}

		
		
	/* bar2 */
	
	if($("#one2").prop("checked")){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","8%")
	}else if($("#two2").prop("checked")){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","28%")
	}else if($("#three2").prop("checked")){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","48%")
	}else if($("#four2").prop("checked")){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","68%")
	}else if($("#five2").prop("checked")){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","98%");
	}
	
	
	
	/* bar3 */
	
	if($("#one3").prop("checked")){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","8%")
	}else if($("#two3").prop("checked")){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","28%")
	}else if($("#three3").prop("checked")){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","48%")
	}else if($("#four3").prop("checked")){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","68%")
	}else if($("#five3").prop("checked")){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","98%");
	}
	
	/* 위도와 경도 구하기*/
	var LATNG =$("#location").attr("value");
	var comma = LATNG.indexOf(",");
	var end = LATNG.length -1;
	var lat = LATNG.substring(1,comma); //위도
	var lng = LATNG.substring(comma+2, end);// 경도
	
	console.log("위도경도="+LATNG);
	console.log("lat="+lat);
	console.log("lng="+lng);
	
	
});// ready() end

	
	