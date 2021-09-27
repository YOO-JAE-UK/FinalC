<%-- 21907.화 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
<link href="${pageContext.request.contextPath }/resources/css/login.css"
	type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script>
	var result = "${result}";
	if (result == 'joinSuccess') {
		alert("회원가입을 축하합니다.")
	} else if (result == '0') {
		alert("비밀번호가 일치하지 않습니다.")
	} else if (result == '-1') {
		alert("아이디가 존재하지 않습니다.")
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
<%-- <jsp:include page="../header.jsp">
--%>
<form name="loginform" action="${pageContext.request.contextPath }/member/loginProcess"
	method="post">
<h1>L O G I N</h1>
	<hr>
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
       <button type='submit' class="submitbtn">로그인</button>
	   <button type='button' class="join">회원가입</button>
	</div>
	<div class="naverlogin">
	   <button type="button" class="naverloginbtn" style="background-color:#29d131">네이버 아이디로 로그인</button>
	</div>
	<a href="" style="color:black">ID/PW찾기</a>   
</form>
</body>
</html>