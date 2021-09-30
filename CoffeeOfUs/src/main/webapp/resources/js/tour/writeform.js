$(document).ready(function() {
	
	//submit 버튼 클릭할 때 이벤트 부분
	$("form").submit(function(){
		
		if($.trim($("input").eq(1).val()) == ""){
			alert("비밀번호를 입력하세요");
			$("input:eq(1)").focus();
			return false;
		}
		if($.trim($("input").eq(2).val()) == ""){
			alert("제목을 입력하세요");
			$("input:eq(2)").focus();
			return false;
		}
		if($.trim($("textarea").val()) == ""){
			alert("내용을 입력하세요");
			$("textarea").focus();
			return false;
		}
	})//submit end
	
	

	//지도
	
	

	/* 파일업로드 */
	
	$("#upfile").change(function() {
		console.log($(this).val()) //c:\fakepath\upload.png
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	});

		
	$(document).on("dragover drop", function(e) {
	    e.preventDefault();  // allow dropping and don't navigate to file on drop
	}).on("drop", function(e) {
		var file1=e.originalEvent.dataTransfer.files
		var file2=file1[0];
		console.log(file1)
		
		/* 섬네일 만들기  */
		if (!file2.type.match('image.*')) { //파일 타입이 image인지 확인합니다.
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		 $("input[type='file']")
	     .prop("files", file1)  // put files into element
	     $('#filevalue').text(file2.name);
		 
		//파일을 읽기 위한 객체 생성
		var reader = new FileReader();				
		
		//DataURL 형식으로 파일을 읽어옵니다. 
		//읽어온 결과는 reader객체의 result 속성에 저장됩니다.			
		reader.readAsDataURL(file2);
		
		//읽기에 성공했을 때 실행되는 이벤트 핸들러	
		reader.onload = function(e) {
			//result:읽기 결과가 저장됩니다.
			//reader.result 또는 e.target.result
		$("#cafe_image").attr('src', e.target.result);
		}//reader.onload end
	});




				
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
	$("#taste_one").click(function(){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","8%")
		$("#one1").prop("checked","checked")
	})
	$("#taste_two").click(function(){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","28%")
		$("#two1").prop("checked","checked")
	})
	$("#taste_three").click(function(){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","48%")
		$("#three1").prop("checked","checked")
	})
	$("#taste_four").click(function(){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","68%")
		$("#four1").prop("checked","checked")
	})
	$("#taste_five").click(function(){
		$("#bar1").css("background","linear-gradient(to right,gray, black)").css("width","98%")
		$("#five1").prop("checked","checked")
	})
	
	/* bar2 */
	$("#atmosphere_one").click(function(){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","8%")
		$("#one2").prop("checked","checked")
	})
	$("#atmosphere_two").click(function(){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","28%")
		$("#two2").prop("checked","checked")
	})
	$("#atmosphere_three").click(function(){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","48%")
		$("#three2").prop("checked","checked")
	})
	$("#atmosphere_four").click(function(){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","68%")
		$("#four2").prop("checked","checked")
	})
	$("#atmosphere_five").click(function(){
		$("#bar2").css("background","linear-gradient(to right,gray, black)").css("width","98%")
		$("#five2").prop("checked","checked")
	})
	
	/* bar3 */
	$("#service_one").click(function(){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","8%")
		$("#one3").prop("checked","checked")
	})
	$("#service_two").click(function(){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","28%")
		$("#two3").prop("checked","checked")
	})
	$("#service_three").click(function(){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","48%")
		$("#three3").prop("checked","checked")
	})
	$("#service_four").click(function(){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","68%")
		$("#four3").prop("checked","checked")
	})
	$("#service_five").click(function(){
		$("#bar3").css("background","linear-gradient(to right,gray, black)").css("width","98%")
		$("#five3").prop("checked","checked")
	})
	
});// ready() end

	
	