<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/changepass.css"
	type="text/css" rel="stylesheet">

<script>
	
</script>
<style>
</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


	<form name="changepassForm" action="${pageContext.request.contextPath }/member/changepass"
		method="get">
		<h3 class="titlefont">비밀번호 변경</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<div class="input_wrp">
				<div class="changepassidbtn">
					<input type='text' id="idcheck" name="idcheck"
						placeholder="Enter Id" required>
				</div>
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
					<input type='text' id="newpass" name="newpass"
						placeholder="새 비밀번호" required>
				</div>
			</div>
			<div class="comtext">새 비밀번호 확인</div>
			<div class="input_wrp">
				<div class="changepassbtn2">
					<input type='text' id="newpasscheck" name="newpasscheck"
						placeholder="새 비밀번호 확인" required>
				</div>
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