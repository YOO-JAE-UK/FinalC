<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JOIN</title>
<!-- Css Styles -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">
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
		    
	   }); //submit
	   
	   $("input:eq(6)").on('keyup',
			   function() {
		           $("#email_message").empty();
		           //[A-Za-Z0-9_]와 동일한 것이 \w
		           //+는 1회 이상 반복을 의미합니다. {1,}와 동일합니다
		           //\w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
		           var pattern = /^\w+@\w+[.]\w{3}$/;
		           var email = $("input:eq(6)").val();
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
    }) //ready

</script>
<style>
 
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


    <form name="joinfrom" action="${pageContext.request.contextPath }/member/joinProcess" method="post">
        <h1 class="title">회원가입</h1>
        
        <b>사용자 ID</b>
        <input type="button" class="idcheck" value="ID중복체크" id='idcheck' name="idcheck"><br> 
        <input type="text" name="id" placeholder="Enter id" required maxLength="12">
		<input type="hidden" value="y"id="confirmIdcheck"> 
        <span id="message"></span>
        
        <b>비밀번호</b>
        <input type="password" name="pass" 
               placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" required>
        <span id=pass1 style= "color:red"></span>
        <b>비밀번호 확인</b>
        <input type="password" name="pass" placeholder="비밀번호를 다시 입력하세요" required>
        <span id=pass2 style= "color:red"></span>
        
        <b>이름</b>
        <input type="text" name="name" placeholder="Enter name"
           maxLength="5"  required>
        
        <b>별명</b>
        <input type="text" name="name" placeholder="Enter name"
           maxLength="15"  required>
           
        <b>이메일 주소</b>
        <input type="text" name="email" id="email" placeholder="Enter email" maxLength="30" required>@
        <input type="text" name="domain" id="domain" maxLength= "15" required>
        <select name="sel">
        <option value="">직접 입력</option>
        <option value="naver.com">naver.com</option>
        <option value="daum.net">daum.net</option>
        <option value="gmail.com">gamil.com</option>
        </select>
        <span id="email_message"></span>
        <div class="clearfix">
        
        <label><b>우편번호</b></label><br> 
           <input type="text" size="5" maxLength="5" name="post1" id="post1" required> 
           <input type="button" class="postcode" value="우편검색" id='postcode'	onclick="execDaumPostcode()"> 
        <label><b>주소</b></label><br>
		   <input type="text" size="50" name="address" id="address" required>
		   <div style="margin-top: -10px; width: 101%">
		   
	    <label for="tel_1"><b>전화번호</b></label><br> 
	       <input type="text" placeholder="전화번호 앞2~3자리" name="tel_1" id="tel_1" 
	                maxLength="3" style="width: 32%" required> 
	       <label for="tel_2"><b> - </b> </label> 
	       <input type="text" placeholder="중간번호 4자리" name="tel_2"
				    id="tel_2" maxLength="4" style="width: 32%" required> 
		   <label for="tel_3"><b> - </b></label> 
		   <input type="text" placeholder="뒤번호 4자리" name="tel_3" 
		            id="tel_3" maxLength="4" style="width: 32%" required>
		   <span id='span4' style="color: red"></span><br>
	    </div>		
				
        
            <button type="submit" class="submitbtn">회원가입</button>
            <button type="reset" class="cancelbtn">다시작성</button>
        </div>
        
    </form>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../resources/js/popper.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.nice-select.min.js"></script>
    <script src="../resources/js/jquery.barfiller.js"></script>
    <script src="../resources/js/jquery.slicknav.js"></script>
    <script src="../resources/js/owl.carousel.min.js"></script>
    <script src="../resources/js/main.js"></script>
</html>