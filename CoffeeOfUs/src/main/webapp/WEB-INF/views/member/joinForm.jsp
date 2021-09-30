<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JOIN</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/join.css"   
     type="text/css" rel="stylesheet">
     
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
	       }); //email keyup 이벤트 처리 끝
	       
	   $("input:eq(0)").on('keyup',
	          function() {
		         checkid=true;
		         $("#message").empty();//처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를
		         //[A-Za-Z0-9_]와 동일한 것이 \w
	             //+는 1회 이상 반복을 의미합니다. {1,}와 동일합니다
	             //\w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
	             var pattern = /^\w{5,12}$/;
		         var id = $("input:eq(0)").val();
		         if (!pattern.test(id)) {
		          	   $("#message").css('color', 'red')
		        	                .html("영문자 숫자_로 5~12자 가능합니다.");
		        	   checkid=false;
		        	   return;
	            }
		         
		        $.ajax({
		        	url :"idcheck.net",
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

</script>
<style>
 
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


    <form name="joinfrom" id="joinform" action="${pageContext.request.contextPath }/member/joinProcess" method="post">
        <h1 class="titlefont">회원가입</h1>
        
        <em style="color:red; float:left">*</em>
        <b id="idtext">사용자 ID</b>
        <input type="button" value="ID중복체크" id='idcheck' name="idcheck"><br> 
        <input type="text" name="id" class="tx" placeholder="Enter id" required maxLength="12">
		<input type="hidden" value="y"id="confirmIdcheck"> 
        <span id="message"></span>
        
        <em style="color:red; float:left">*</em>
        <b id="idtext">비밀번호</b>
        <input type="password" name="pass" 
               placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" required>
        <span id=pass1 style= "color:red"></span>
        <em style="color:red; float:left">*</em>
        <b id="idtext">비밀번호 확인</b>
        <input type="password" name="pass" placeholder="비밀번호를 다시 입력하세요" required>
        <span id=pass2 style= "color:red"></span>
        
        <em style="color:red; float:left">*</em>
        <b id="idtext">이 름</b>
        <input type="text" name="name" class="tx" placeholder="Enter name"
           maxLength="5"  required>
           
        <em style="color:red">*</em>
        <b id="nicktext">별 명</b>
        <input type="text" name="name" class="nickinput" placeholder="Enter nickname"
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
           <input type="text" size="10" maxLength="10" name="post1" class="tx" id="post1"  required> 
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
		<b id="imgtext">프로필 사진</b>
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

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>