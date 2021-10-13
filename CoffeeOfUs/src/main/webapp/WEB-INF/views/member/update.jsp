<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 변경</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>   
<link href="${pageContext.request.contextPath }/resources/css/update.css"
	type="text/css" rel="stylesheet">

<script>

$(function() {
	
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
		                       .html("이메일형식이 맞지 않습니다.");
		 	checkemail=false;
		}else{
			$("#email_message").css('color', 'green')
							   .html("이메일형식에 맞습니다.");
		    checkemail=true;
		}
	}); //email keyup 이벤트 처리 끝
	
	var check=0;    
	   $('form').submit(function() {
		   if(!checkemail) {
			   alert("email 형식을 확인하세요");
			   $("input:eq(7)").focus();
			   return false;
		   }
			   
		   if (check == 0) {
			   value = $('#filename').text();
			   html = "<input type='text' value='" + value +"' name='check'>";
			   $(this).append(html);
		   }
	   }) //form submit end

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

	
	
   /* $('input[type=file]').change(function(event){
	   check++;
	   var inputfile = $(this).val().split('\\');
	   var filename=inputfile[inputfile.length - 1];
	   var pattern = /(gif|jpg|jpeg|png)$/i;  //플래그 i는 대소문자 구분 없는 검색
	   if (pattern.test(filename)) {
		   $('#filename').text(filename);  //inputfile.length - 1=2;
			   
		   var reader = new FileReader(); //파일을 읽기 위한 객체 생성  139~148 파일 미리보기 코드
	     //DataURL 형식으로 파일을 읽어옵니다.
	     //읽어온 결과는 reader객체의 result 속성에 저장됩니다.
	     //event.target.file[0] : 선택한 그림의 파일객체에서 첫번째 객체를 가져옵니다.
	        reader.readAsDataURL(event.target.files[0]);
		     
	        reader.onload = function(event) {//읽기에 성공했을 때 실행되는 이벤트 핸들러 
	           $('#user_image').html('<img width="20px" src="'
	        		                 + event.target.result + '">');
	        };
	     }else{
	    	 alert('확장자는 gif, jpg, jpeg, png가 가능합니다.');
	    	 check=0;
	     }
	 */
	
	
	
})
</script>
<style>
</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
 <c:set var="m" value="${memberinfo}"/>

	<form name="update" id="update" action="${pageContext.request.contextPath }/member/updateProcess"
		method="post" style="font-size: 15px" enctype="multipart/form-data">
		<input type="hidden" name="USER_FILE" value="${m.USER_FILE}">    
		<h1 class="titlefont">회원정보 변경</h1>
        
        <em style="color:red" id="emem">*</em>
        <b id="idtext">사용자 ID</b>
        <input type="text" name="USER_ID" class="tx" value="${m.USER_ID}" readOnly>
		<input type="hidden" value="y"id="confirmIdcheck"> 
        <span id="message"></span>
        
        <em style="color:red" id="emem">*</em>
        <b id="idtext">이 름</b>
        <input type="text" name="USER_NAME" class="tx" placeholder="Enter name" value="${m.USER_NAME}"
           maxLength="5"  required>
           
        <em style="color:red" >*</em>
        <b id="nicktext">별 명</b>
        <input type="text" name="USER_NICKNAME" class="nickinput" placeholder="Enter name" value="${m.USER_NICKNAME}"
           maxLength="15"  required><br>
        
        <em style="color:red">*</em>   
        <b id="mailtext" style="width:50%">이메일 주소</b>
        <input type="text" name="USER_EMAIL" class="tx" id="email"  value="${m.USER_EMAIL}"
                placeholder="Enter email" maxLength="30" required>
        <span id="email_message"></span>
        
        <div class="clearfix">
        <div id="add_wap">
        <em style="color:red">*</em>
        <b id="addtext">주소</b>
           <input type="text" size="10" maxLength="10" name="USER_ADDRESS_POST" class="tx" id="post1" 
                    value="${m.USER_ADDRESS_POST}" required> 
           <input type="button" value="우편검색" id='postcode'	onclick="execDaumPostcode()"> 
		   <input type="text" size="50" name="USER_ADDRESS" class="tx" id="address" value="${m.USER_ADDRESS}" required>
		   <div style="margin-top: -10px; width: 101%"> </div>
		 </div>
		 
		 <div id="tel_wap">
		<em style="color:red">*</em>   
	    <label for="tel_1"><b id="teltext">연락처</b></label><br> 
	       <input type="text"  name="USER_PHONE" class="tx" id="tel_1" 
	                maxLength="14" value="${m.USER_PHONE}" required> 
	    </div>		
		
		<div id="img_wap">
		<em style="color:red">*</em>
		<b id="imgtext">프로필 사진</b>
		   <div class="imgcontainer"  style="background-color:white !important">
			<label for="user_image" class="user_image" id="imgtext"> 
			   <input type="file" name="uploadfile" class="user_image_choice"
				      accept="image/gif, image/jpeg, image/png" >
				<img id="user_image" src="get_img?name=${m.USER_FILE}" alt="image" 
				      width="130" height="130" class="avatar" >
			</label>
		   </div>
		</div>
		<br> 		
        
            <button type="reset" class="cancelbtn"
                    onClick="history.go(-1)">← 취소</button>
            <button type="submit" class="submitbtn">수정</button>
            <!-- 글쓰기list.js 참고하기 location -->
        </div>
        
    </form>
	


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>