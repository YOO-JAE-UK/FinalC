<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/drop.css"
	type="text/css" rel="stylesheet">
<script src="../resources/js/member/drop.js"></script>
<script>
	
</script>
<style>
</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


	<form name="drop_member" id="drop_member" action="${pageContext.request.contextPath }/member/dropProcess"
		method="post">
		<h3 class="titlefont">회원 탈퇴</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<div class="input_wrp">
				<div class="checkidbtn">
					<input type='text' id="idcheck" name="USER_ID"
						value="${id}" readOnly>
				</div>
			</div>
			<div class="comtext">비밀번호</div>
			<div class="input_wrp">
				<div class="chackpassbtn">
					<input type='password' id="pass1" name="USER_PASS"
						placeholder="Enter pass" required>
					<span id="pass_span" style="color:blue;"></span>
				</div>
			</div>
			<div class="comtext">비밀번호 확인</div>
			<div class="input_wrp">
				<div class="chackpassbtn">
					<input type='password' id="pass2" name="USER_PASS2"
						placeholder="Enter pass again" required>
					<span id="pass_span" style="color:blue;"></span>
				</div>
			</div>
			</div>

	<div class="clearfix">
       <button type='reset' class="cancelbtn"
       			onClick="history.go(-1)">← 취소</button>
	   <button type='submit' class="submitbtn" id="submitbtn">탈퇴</button>
	</div>
	
	</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>