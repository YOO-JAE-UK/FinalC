<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/member/changepass.js" charset="utf-8"></script>

<link href="${pageContext.request.contextPath }/resources/css/changepass.css"
	type="text/css" rel="stylesheet">

<script>
	
</script>
<style>
</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

	<c:set var="m" value="${memberinfo}"/>
	<form name="changepassForm" id="changepassForm" action="${pageContext.request.contextPath }/member/changepassProcess"
		method="POST">
		<h3 class="titlefont">비밀번호 변경</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<div class="input_wrp">
				<input class="changepassidbtn" id="id" name="id" value=${id} readOnly>
			</div>
			
			<div class="comtext">현재 비밀번호</div>
			<div class="input_wrp">
				<div class="changepassbtn">
					<input type='text' id="curpass" name="curpass"
						placeholder="현재 비밀번호" required>
				</div>
			</div>
			<div class="comtext">새 비밀번호</div>
			<div class="input_wrp">
				<div class="changepassbtn2">
					<input type='password' id="newpass" name="newpass"
						placeholder="새 비밀번호" required></div>
						<span id=pass1 style= "color:red"></span>
			</div>
			<div class="comtext">새 비밀번호 확인</div>
			<div class="input_wrp">
				<div class="changepassbtn2">
					<input type='password' id="newpasscheck" name="newpasscheck"
						placeholder="새 비밀번호 확인" required></div>
						<span id=pass2 style= "color:red"></span>
			</div>
		</div>

	<div class="clearfix">
       <button type='reset' class="cancelbtn"
       			onClick="history.go(-1)">← 취소</button>
	   <button type='submit' class="submitbtn">등록</button>
	</div>
	
	</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>