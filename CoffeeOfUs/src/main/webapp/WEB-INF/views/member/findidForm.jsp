<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ID/PW 찾기</title>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/findid.css"
	type="text/css" rel="stylesheet">

<script>
	
</script>
<style>
</style>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<form name="findidForm" action="${pageContext.request.contextPath }/member/findId"
		method="get">
		<h3 class="titlefont">ID/PW 찾기</h3>
		<div class="input_wrp">
			<div class="comtext">이메일 주소</div>
			<div class="input_wrp">
				<div class="findemailbtn">
					<input type='text' id="findemail" name="findemail"
						placeholder="Enter Email" required>
				</div>
				<div>
					<button type="button" class="findidbtn">ID/PW 찾기</button>
				</div>
			</div>
		</div><br>

		<h3 class="titlefont2">임시 비밀번호 발급</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<input type='text' id="tempass" name="tempass" placeholder="사용자 ID"
				required>
			<div class="comtext">이메일 주소</div>
			<input type='text' id="tempass" name="tempass" placeholder="이메일 주소"
				required>
			<div>
				<button type="button" class="tempassbtn">임시 비밀번호 발급</button>
			</div>
		</div>
	</form>


	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>