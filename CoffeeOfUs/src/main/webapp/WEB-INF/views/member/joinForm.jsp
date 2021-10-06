<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JOIN</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>    
<script src="../resources/js/join.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath }/resources/css/join.css"   
     type="text/css" rel="stylesheet">
<script>
<% String num = request.getParameter("num");%>
var i1=<%=num%>;
	//alert(i1+"i의 값");


</script>
<style>
 
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

    <form name="joinfrom" id="joinform" action="${pageContext.request.contextPath }/member/joinProcess" method="post">
        <h1 class="titlefont">회원가입</h1>
        
        <div id="wap">
        <em style="color:red; float:left">*</em>
        <label for="user_id" ><b id="idtext">사용자 ID</b></label>
        <input type="text" class="form-control" name="USER_ID" id="id" 
                placeholder="아이디를 입력하세요" required maxLength="14">
		<div class="check_font" id="id_check"></div> 
        <span id="message" ></span>
        </div>
        
        <div id="wap">
        <em style="color:red; float:left">*</em>
        <b id="idtext">비밀번호</b>
        <input type="password" name="USER_PASS" id="pw1"
               placeholder="비밀번호를 입력하세요(문자,숫자,특수문자로 구성된 8~15자리입니다)" required>
        <span id=pass1 style= "color:red"></span>
        </div>
        <div id="wap">
        <em style="color:red; float:left">*</em>
        <b id="idtext">비밀번호 확인</b>
        <input type="password" name="pass"  id="pw2"
                placeholder="비밀번호를 다시 입력하세요" required>
        <span id=pass2 style= "color:red"></span>
        </div>
        
        <div id="wap">
        <em style="color:red; float:left">*</em>
        <b id="idtext">이 름</b>
        <input type="text" name="USER_NAME" class="tx" placeholder="이름을 입력하세요" maxLength="5"  required>
        </div>
           
        <em style="color:red">*</em>
        <b id="nicktext">닉네임</b>
        <input type="text" name="USER_NICKNAME" class="nickinput" placeholder="닉네임을 입력하세요"
           maxLength="15"  required><br>
        <span id="nickname_message"></span>
        
        <div id="email_wap">
        <em style="color:red">*</em>   
        <b id="mailtext" style="width:50%">이메일 주소</b>
        <input type="text" name="USER_EMAIL" class="tx" id="email" placeholder="이메일을 입력하세요" 
               maxLength="30"  required>
        <span id="email_message"></span>
        <span id="email_checkmessage"></span>
        </div>
        
        <div class="clearfix">
        <em style="color:red">*</em>
        <b id="addtext">주소</b>
           <input type="text" size="10" maxLength="10" name="USER_ADDRESS_POST" class="tx" id="post1"  required> 
           <input type="button" value="우편검색" id='postcode'	onclick="execDaumPostcode()"> 
		   <input type="text" size="50" name="USER_ADDRESS" class="tx" id="address" required>
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
			   <input type="file" name="USER_IMG" class="user_image_choice"
				      accept="image/gif, image/jpeg, image/png" >
				<img id="user_image" src="resources/image/default.png" alt="image" 
				      width="130" height="130" class="avatar">
			</label>
		   </div>
		</div>
		<br> 		
        
            <button type="reset" class="cancelbtn"
                    onClick="history.go(-1)">← 취소</button>
            <button type="submit" class="submitbtn">등록</button>
        </div>
        
    </form>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>