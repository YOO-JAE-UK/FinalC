$(function() { 
	   var checkid=false;
	   var checkemail=false;
	   var checknick=false;
	   $('form').submit(function() {
		   if(!checkid){
			   alert("사용가능한 아이디로 입력하세요.");
			   $("input:eq(0)").val('').focus();
			   return false;
		   }
		   if(!checknick) {
			   alert("별명을 입력하세요.");
			   $("input:eq(4)").val('').focus();
			   return false;
		   }
		   if(!checkemail) {
			   alert("이메일 형식을 확인하세요.");
			   $("input:eq(5)").focus();
			   return false;
		   }
		   if (check == 0) {
			   value = $('#filename').text();
			   html = "<input type='text' value='" + value +"' name='check'>";
			   $(this).append(html);
		   } 
		   if(!$.isNumeric($('#post1').val())){
		    	alert('우편번호는 숫자만 입력 가능합니다.');
		    	return false;
		   }
	   }); //form submit end
	   
	   //nickname 유효성 검사
	   $("input:eq(4)").on('keyup',
	          function() {
		   		checknick=true;
		         $("#nickname_message").empty();
						
				var kor_pattern = /^[가-힣\s]{2,6}$/;
		         var nick = $("input:eq(4)").val();
		         if (!kor_pattern.test(nick)) {
		          	   $("#nickname_message").css('color', 'red')
		        	                .html("닉네임은 한글로 2~6자 입력해주세요.");
		        	   checknick=false;
		        	   return;
	            }
				
		         //닉네임
	  			 $.ajax({
       				url :"nicknamecheck",
       				data : {"nickname" : nickname},
       				success : function(resp) {
       					if (resp == -1) { //db에 해당 nickname이 없는 경우
       		    		$("#nickname_message").css('color', 'green').html(
       		    				"사용 가능한 닉네임 입니다.");
       		   			 checknick=true;
       					} else { //db에 해당 nickname이 있는 경우(0)
       		    		$("#nickname_message").css('color', 'red').html(
       		    				"사용중인 닉네임 입니다.");
       		   			 checknick=false;
       					}
       				}
      			 }); //nickname ajax end 
	  	 }); //keyup end
	   
	   //mail 도메인
	   $('#domain2').change(function(){
			 if($('#domain2').val()==''){
				 $('#domain').val('').focus();
				 $('#domain').prop('readOnly',false);
			 } else{
				 $('#domain').val($('#domain2').val());
				 $('#domain').prop('readOnly',true);
			 }
		  });
	   
	   //이메일 유효성검사
 	   $("input:eq(5)").on('keyup',
			   function() {
		           $("#email_message").empty();
		           //[A-Za-Z0-9_]와 동일한 것이 \w
		           //+는 1회 이상 반복을 의미합니다. {1,}와 동일합니다
		           //\w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
		           var pattern = /^\w+@\w+[.]\w{3}$/;
		           var email = $("input:eq(5)").val();
		           if (!pattern.test(email)) {
		        	   $("#email_message").css('color', 'red')
		        	                      .html("이메일형식이 맞지 않습니다. / ");
		        	   checkemail=false;
		           }else{
		        	   $("#email_message").css('color', 'green')
		        	                      .html("이메일형식에 맞습니다. / ");
		        	   checkemail=true;
		           }
		           
		            $.ajax({
			        	url :"emailcheck",
			        	data : {"email" : email},
			        	success : function(resp) {
			        		if (resp == -1) { //db에 해당 email이 없는 경우
			        		    $("#email_checkmessage").css('color', 'green').html(
			        		    		"사용 가능한 이메일 입니다.");
			        		    checkemail=true;
			        		} else { //db에 해당 id가 있는 경우(0)
			        		    $("#email_checkmessage").css('color', 'red').html(
			        		    		"사용중인 이메일 입니다.");
			        		    checkemail=false;
			        		}
			        	}
			        }); //ajax end 
	       }); //email keyup 이벤트 처리 끝
	       
	   //아이디 유효성검사    
	   $("input:eq(0)").on('keyup',
	          function() {
		         checkid=true;
		         $("#message").empty();//처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를
		         //[A-Za-Z0-9_]와 동일한 것이 \w
	             //+는 1회 이상 반복을 의미합니다. {1,}와 동일합니다
	             //\w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
	             var pattern = /^\w{5,14}$/;
		         var id = $("input:eq(0)").val();
		         if (!pattern.test(id)) {
		          	   $("#message").css('color', 'red')
		        	                .html("영문자 숫자_로 5~14자 가능합니다.");
		        	   checkid=false;
		        	   return;
	            }
		         
		        $.ajax({
		        	url :"idcheck",
		        	data : {"id" : id},
		        	success : function(resp) {
		        		if (resp == -1) { //db에 해당 id가 없는 경우
		        		    $("#message").css('color', 'green').html(
		        		    		"사용 가능한 아이디 입니다.");
		        		    checkid=true;
		        		} else { //db에 해당 id가 있는 경우(0)
		        		    $("#message").css('color', 'blue').html(
		        		    		"사용중인 아이디 입니다.");
		        		    checkid=false;
		        		}
		        	}
		        }); //ajax end
	    }); //id keyup end
	    
	    //비밀번호 확인
	    $('#pw2').focusout(function(){
	   		if($('#pw2').val() != ""&&$("#pw2").val()!=$("#pw1").val()) {
	   			$("#pass2").css("visibility", "visible");
	   			$("#pass2").html("입력한 비밀번호와 일치 하지 않습니다.");
	   			
	   			pandan=false;
	   		}else{
	   			$("#pass2").css("visibility", "visible");	
	   			$("#pass2").css("color", "green").html("입력한 비밀번호와 일치합니다.");
	   		}
	   		});
	     
	    $('#pw1').keyup(function(){
	    	if($("#pw2").val()!=null&&$("#pw2").val()!=''){
	    		if($("#pw1").val()==$("#pw2").val()){
	    			$("#pass2").css("visibility", "hidden");
	    		}
	    	}
	    });   
	   			
	   	$('#pw1').focusout(function(){
				var pattern=/^[A-za-z0-9]{8,15}$/;
		        var pass=$.trim($('#pw1').val());
				pandan=pattern.test(pass);
				if(!pandan){
					$('#pass1').html('영문자, 숫자로 구성된 8~15 자리를 입력해주세요');
					$('#pass1').css('visibility','visible');
				}else {
					$('#pass1').css('visibility','hidden');
					}
			});
		    $('#pw1').focus(function(){
				 if($.trim($("#id").val())==''){	
					$('#pass1').html('이름을 입력하세요')
					$('#id').focus();
					$('#pass1').css('visibility','visible');
					$('#pass1').css('color','red');
				 }else 
					 $('#pass1').css('visibility','hidden');
		        });	 
	   			 
	   	//연락처
	   	$('#tel_1').focusout(function(){
		    	pattern=/^[0][0-7]{2,3}$/
		    	pandan= pattern.test( $('#tel_1').val());
		    	if(!pandan){
		    		$("#tel_message").css("visibility","visible"); 
		    		$("#tel_message").html("전화번호 앞 자리 첫번째는 0부터 시작하고 2~3자리 입니다");
		    		 $('#tel_1').focus();
		        }else{
		        	$("#tel_message").css("visibility","hidden");
		        }
		    })	
		    $('#tel_2').focusout(function(){
		    	 pattern=/^[0-9]{4}$/ 
		    	pandan= pattern.test( $('#tel_2').val());
		    	if(!pandan){
		    		$("#tel_message").css("visibility","visible"); 
		    		$("#tel_message").html("전화번호  가운데 숫자 4자리 입력해주세요");
		    		 $('#tel_2').focus();
		        }else{
		        	$("#tel_message").css("visibility","hidden");
		        }
		    })	
		     $('#tel_3').focusout(function(){
		    	 pattern=/^[0-9]{4}$/ 
		    	pandan= pattern.test( $('#tel_3').val());
		    	if(!pandan){
		    		$("#tel_message").css("visibility","visible"); 
		    		$("#tel_message").html("전화번호 뒷 자리 숫자 4자리 입력해주세요");
		    		 $('#tel_3').focus();
		        }else{
		        	$("#tel_message").css("visibility","hidden");
		        }
		    })	
	    
	    //파일 불러오기, 미리보기
	    $('input[type=file]').on('change', preview);
		function preview(e) {
			// 선택한 그림의 File 객체를 취득
			//File객체 리스트에서 첫번째 File객체를 가져옵니다.
			var file = e.target.files[0];
			
			//file.type : 파일의 형식 (MIME타입 - 예) text/html)
			if (!file.type.match('image.*')) { //파일 타입이 image인지 확인합니다.
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			//파일을 읽기 위한 객체 생성
			var reader = new FileReader();				
			
			//DataURL 형식으로 파일을 읽어옵니다. 
			//읽어온 결과는 reader객체의 result 속성에 저장됩니다.			
			reader.readAsDataURL(file);
			
			//읽기에 성공했을 때 실행되는 이벤트 핸들러	
			reader.onload = function(e) {
				//result:읽기 결과가 저장됩니다.
				//reader.result 또는 e.target.result
			$("#user_image").attr('src', e.target.result);
			}//reader.onload end
		}
	    
}) //ready
    
//주소
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post1').value = data.zonecode;
            document.getElementById("address").value = fullRoadAddr;

            
        }
    }).open();
}    