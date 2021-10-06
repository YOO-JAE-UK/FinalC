<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Find Id/Pw</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/login.css"
	type="text/css" rel="stylesheet">
	
<script>
<% String num = request.getParameter("num");%>
var i1=<%=num%>;
	//alert(i1+"i의 값");
	var mailresult="${mailresult}"
	var result = "${result}";
	if (result == 'joinSuccess') {
		alert("회원가입을 축하합니다.")
	} else if (result == '0') {
		alert("비밀번호가 일치하지 않습니다.")
	} else if (result == '-1') {
		alert("아이디가 존재하지 않습니다.")
	}  else if (result == 'emailSuccess'){
		alert("회원가입 이메일이 전송되었습니다. 확인해주세요.")
	} else if(mailresult=='0'){
		alert("메일 링크를 클릭하여 메일 인증을 해주세요.")
		
	}

	$(function() {
		$(".join").click(function() {
			location.href = "${pageContext.request.contextPath}/member/join";   //controller주소
		});
	})
</script>
<style>

</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


<form name="loginform" action="${pageContext.request.contextPath }/member/loginProcess"
	method="post">
<h3 class="loginfont">L O G I N</h3>
	<div class="input_wrp">
	<div class="idbtn">
	  <div class="stitle">ID</div>
	    <input type='text' id="id" name="id" placeholder="Enter id" required
	       <c:if test="${!empty saveid}">
		          value="${saveid }"
		   </c:if>        	 
	     >
	</div>
	<div class="passbtn">
	   <div class="stitle">PW</div>	
	     <input type='password' id="password" name="password"
			placeholder="Enter password" required 
		 <c:if test="${!empty saveid}">
		              checked
	     </c:if>  
	     >
	</div>   
	    <input type="checkbox" name="remember" style="margin-bottom:15px"> 로그인 유지       
	</div>
	
	<div class="clearfix">
	<div class="submitbtn_wrap">
       <button type='submit' class="submitbtn">로그인</button>
	</div>
	<div class="join_wrap">
	   <button type='button' class="join">회원가입</button>
	</div>
	</div>
	<div class="naverlogin">
	   <button type="button" class="naverloginbtn" >네이버 아이디로 로그인</button>
	</div>
	<a href="${pageContext.request.contextPath}/member/findId" 
	   style="color:black" id="findtext">ID/PW찾기</a>   
</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>