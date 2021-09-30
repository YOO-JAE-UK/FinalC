<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 변경</title>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/change_member_info.css"
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
})//ready
</script>
<style>
</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


	<form name="change_member_info" id="change_member_info" action="${pageContext.request.contextPath }/member/change_member_info"
		method="get">
		<h1 class="titlefont">회원정보 변경</h1>
        
        <em style="color:red">*</em>
        <b id="idtext">사용자 ID</b>
        <input type="button" value="ID중복체크" id='idcheck' name="idcheck"><br> 
        <input type="text" name="id" class="tx" placeholder="Enter id" required maxLength="12">
		<input type="hidden" value="y"id="confirmIdcheck"> 
        <span id="message"></span>
        
        <em style="color:red">*</em>
        <b id="idtext">이 름</b>
        <input type="text" name="name" class="tx" placeholder="Enter name"
           maxLength="5"  required>
           
        <em style="color:red">*</em>
        <b id="nicktext">별 명</b>
        <input type="text" name="name" class="nickinput" placeholder="Enter name"
           maxLength="15"  required><br>
        
        <em style="color:red">*</em>   
        <b id="mailtext" style="width:50%">이메일 주소</b>
        <input type="text" name="email" class="tx" id="email" style="width:33%; float:left"
                placeholder="Enter email" maxLength="30" required>@
        <input type="text" name="domain" class="tx" id="domain" style="width: 33%" maxLength= "15" required>
        <select name="domain2" id="domain2">
        <option value="">직접 입력</option>
        <option value="naver.com">naver.com</option>
        <option value="daum.net">daum.net</option>
        <option value="gmail.com">gamil.com</option>
        </select>
        <span id="email_message"></span>
        
        <div class="clearfix">
        <em style="color:red">*</em>
        <label><b id="addtext">주소</b></label>
           <input type="text" size="5" maxLength="5" name="post1" class="tx" id="post1"  required> 
           <input type="button" value="우편검색" id='postcode'	onclick="execDaumPostcode()"> 
		   <input type="text" size="50" name="address" class="tx" id="address" required>
		   <div style="margin-top: -10px; width: 101%">
		 
		<em style="color:red">*</em>   
	    <label for="tel_1"><b id="teltext">연락처</b></label><br> 
	       <input type="text" placeholder="전화번호 앞2~3자리" name="tel_1" class="tx" id="tel_1" 
	                maxLength="3" style="width: 32%" required> 
	       <label for="tel_2"><b> - </b> </label> 
	       <input type="text" placeholder="중간번호 4자리" name="tel_2" class="tx"
				    id="tel_2" maxLength="4" style="width: 32%" required> 
		   <label for="tel_3"><b> - </b></label> 
		   <input type="text" placeholder="뒤번호 4자리" name="tel_3" class="tx"
		            id="tel_3" maxLength="4" style="width: 32%" required>
		   <span id='span4' style="color: red"></span><br>
	    </div>		
		
		<em style="color:red">*</em>
		프로필 사진
		   <div class="imgcontainer">
			<label for="user_image" class="user_image" id="imgtext"> 
			   <input type="file" name="uploadfile" class="user_image_choice"
				      accept="image/gif, image/jpeg, image/png" >
				<img id="user_image" src="resources/image/default.png" alt="image" 
				      width="130" height="130" class="avatar">
			</label>
		</div>
		<br> 		
        
            <button type="reset" class="cancelbtn">← 취소</button>
            <button type="submit" class="submitbtn">등록</button>
        </div>
        
    </form>
	
	</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>