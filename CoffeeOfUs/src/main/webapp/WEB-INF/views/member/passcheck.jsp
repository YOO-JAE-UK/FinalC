<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ID/PW 찾기</title>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/passcheck.css"
	type="text/css" rel="stylesheet">

<script>
	
</script>
<style>
</style>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<form name="passcheckForm" action="${pageContext.request.contextPath }/member/passcheck"
		method="get">
		<h3 class="titlefont">비밀번호 재확인</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<div class="input_wrp">
				<div class="findpassbtn">
					<input type='text' id="idcheck" name="idcheck"
						placeholder="Enter Id" required>
				</div>
			</div>
			<div class="comtext">비밀번호</div>
			<div class="input_wrp">
				<div class="findpassbtn">
					<input type='text' id="passcheck" name="passcheck"
						placeholder="Enter pass" required>
			       <div id="inform"> 회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 해주세요.</div>
				</div>
			</div>
		</div>

	<div class="clearfix">
       <button type='reset' class="cancelbtn">← 취소</button>
	   <button type='submit' class="submitbtn">확인</button>
	</div>
	
	</form>


	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>