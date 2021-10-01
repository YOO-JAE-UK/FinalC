<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JOIN</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/join.css"   
     type="text/css" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>    
<script>
<% String num = request.getParameter("num");%>
var i1=<%=num%>;
	//alert(i1+"i의 값");
	
	
$(function() {
	   var checkid=false;
	   var checkemail=false;
	   $('form').submit(function() {
		   if(!checkid){
			   alert("사용가능한 id로 입력하세요.");
			   $("input:eq(0)").val('').focus();
			   return false;
		   }
		   if(!checkemail) {
			   alert("email 형식을 확인하세요");
			   $("input:eq(6)").focus();
			   return false;
		   }
		   if (check == 0) {
			   value = $('#filename').text();
			   html = "<input type='text' value='" + value +"' name='check'>";
			   $(this).append(html);
		   } 
		   if(!$.isNumeric($('#post1').val())){
		    	alert('우편번호는 숫자만 입력 가능합니다');
		    	return false;
		   }
	   }); //form submit end
	   
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
	   
	   
	   $("input:eq(7)").on('keyup',
			   function() {
		           $("#email_message").empty();
		           //[A-Za-Z0-9_]와 동일한 것이 \w
		           //+는 1회 이상 반복을 의미합니다. {1,}와 동일합니다
		           //\w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
		           var pattern = /^\w+@\w+[.]\w{3}$/;
		           var email = $("input:eq(7)").val();
		           if (!pattern.test(email)) {
		        	   $("#email_message").css('color', 'red')
		        	                      .html("이메일형식이 맞지 않습니다.");
		        	   checkemail=false;
		           }else{
		        	   $("#email_message").css('color', 'green')
		        	                      .html("이메일형식에 맞습니다.");
		        	   checkemail=true;
		           }
		           
		           /* $.ajax({
			        	url :"emailcheck",
			        	data : {"email" : email},
			        	success : function(resp) {
			        		if (resp == -1) { //db에 해당 email이 없는 경우
			        		    $("#email_message").css('color', 'green').html(
			        		    		"사용 가능한 이메일 입니다.");
			        		    checkid=true;
			        		} else { //db에 해당 id가 있는 경우(0)
			        		    $("#email_message").css('color', 'blue').html(
			        		    		"사용중인 이메일 입니다.");
			        		    checkid=false;
			        		}
			        	}
			        }); //ajax end 
			        아이디와 메일이 같은 경우만 메일발송 가능하게 변경하기
			        
			        */
	       }); //email keyup 이벤트 처리 끝
	       
	   $("input:eq(1)").on('keyup',
	          function() {
		         checkid=true;
		         $("#message").empty();//처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를
		         //[A-Za-Z0-9_]와 동일한 것이 \w
	             //+는 1회 이상 반복을 의미합니다. {1,}와 동일합니다
	             //\w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
	             var pattern = /^\w{5,12}$/;
		         var id = $("input:eq(1)").val();
		         if (!pattern.test(id)) {
		          	   $("#message").css('color', 'red')
		        	                .html("영문자 숫자_로 5~12자 가능합니다.");
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
	    }) //id keyup end
	    
	    //비밀번호 확인
	    $('#pw2').focusout(function(){
	   		if($('#pw2').val() != ""&&$("#pw2").val()!=$("#pw1").val()) {
	   			$("#pass2").css("visibility", "visible");
	   			$("#pass2").html("입력한 비밀번호와 일치 하지 않습니다.");
	   			
	   			pandan=false;
	   		}else{
	   			$("#pass2").css("visibility", "hidden");	
	   		}
	   		
	   		});
	     
	    $('#pw1').keyup(function(){
	    	if($("#pw2").val()!=null&&$("#pw2").val()!=''){
	    		if($("#pw1").val()==$("#pw2").val()){
	    			$("#pass2").css("visibility", "hidden");
	    		}
	    	}
	    })   
	   			
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
    
    
    

</script>
<style>
 
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


    <form name="joinfrom" id="joinform" action="${pageContext.request.contextPath }/member/joinProcess" method="post">
        <h1 class="titlefont">회원가입</h1>
        
        <div id=wap>
        <em style="color:red; float:left">*</em>
        <b id="idtext">사용자 ID</b>
        <input type="hidden" value="ID중복체크" id='idcheck' name="idcheck" ><br> 
        <input type="text" name="id" id="id" class="tx" placeholder="아이디를 입력하세요" required maxLength="12">
		<input type="hidden" value="y"id="confirmIdcheck"> 
        <span id="message" ></span>
        </div>
        
        <div id=wap>
        <em style="color:red; float:left">*</em>
        <b id="idtext">비밀번호</b>
        <input type="password" name="pass" id="pw1"
               placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" required>
        <span id=pass1 style= "color:red"></span>
        </div>
        <div id=wap>
        <em style="color:red; float:left">*</em>
        <b id="idtext">비밀번호 확인</b>
        <input type="password" name="pass"  id="pw2"
                placeholder="비밀번호를 다시 입력하세요" required>
        <span id=pass2 style= "color:red"></span>
        </div>
        
        <div id=wap>
        <em style="color:red; float:left">*</em>
        <b id="idtext">이 름</b>
        <input type="text" name="name" class="tx" placeholder="이름을 입력하세요" maxLength="5"  required>
        </div>
           
        <em style="color:red">*</em>
        <b id="nicktext">별 명</b>
        <input type="text" name="name" class="nickinput" placeholder="별명을 입력하세요"
           maxLength="15"  required><br>
        
        <em style="color:red">*</em>   
        <b id="mailtext" style="width:50%">이메일 주소</b>
        <input type="text" name="email" class="tx" id="email" placeholder="이메일을 입력하세요" 
               maxLength="30"  required>
        <span id="email_message"></span>
        
        <div class="clearfix">
        <em style="color:red">*</em>
        <b id="addtext">주소</b>
           <input type="text" size="10" maxLength="10" name="post1" class="tx" id="post1"  required> 
           <input type="button" value="우편검색" id='postcode'	onclick="execDaumPostcode()"> 
		   <input type="text" size="50" name="address" class="tx" id="address" required>
		   <div style="margin-top: -10px; width: 101%">
		 
		<em style="color:red">*</em>   
	    <label for="tel_1"><b id="teltext">연락처</b></label><br> 
	       <div id="inputtel">
	       <input type="text" placeholder="전화번호 앞2~3자리" name="tel_1" class="tx" id="tel_1" 
	                maxLength="3" style="width: 32%" required> 
	       <label for="tel_2"><b> - </b> </label> 
	       <input type="text" placeholder="중간번호 4자리" name="tel_2" class="tx"
				    id="tel_2" maxLength="4" style="width: 32%" required> 
		   <label for="tel_3"><b> - </b></label> 
		   <input type="text" placeholder="뒤번호 4자리" name="tel_3" class="tx"
		            id="tel_3" maxLength="4" style="width: 32%" required>
	       </div>
		   <span id='tel_message' style="color: red"></span><br>
	    </div>		
		
		<div id="img_wap">
		<em style="color:red">*</em>
		<b id="imgtext">프로필 사진</b>
		   <div class="imgcontainer">
			<label for="user_image" class="user_image" id="imgtext"> 
			   <input type="file" name="uploadfile" class="user_image_choice"
				      accept="image/gif, image/jpeg, image/png" >
				<img id="user_image" src="resources/image/default.png" alt="image" 
				      width="130" height="130" class="avatar">
			</label>
		   </div>
		</div>
		<br> 		
        
            <button type="reset" class="cancelbtn">← 취소</button>
            <button type="submit" class="submitbtn">등록</button>
        </div>
        
    </form>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>