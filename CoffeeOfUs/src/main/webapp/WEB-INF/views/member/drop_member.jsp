<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/drop_member.css"
	type="text/css" rel="stylesheet">

<script>
	
</script>
<style>
</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


	<form name="drop_member" action="${pageContext.request.contextPath }/member/drop_member"
		method="get">
		<h3 class="titlefont">회원 탈퇴</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<div class="input_wrp">
				<div class="checkidbtn">
					<input type='text' id="idcheck" name="idcheck"
						placeholder="Enter Id" required>
				</div>
			</div>
			<div class="comtext">비밀번호</div>
			<div class="input_wrp">
				<div class="chackpassbtn">
					<input type='text' id="passcheck" name="passcheck"
						placeholder="Enter pass" required>
				</div>
			</div>
		</div>

	<div class="clearfix">
       <button type='reset' class="cancelbtn">← 취소</button>
	   <button type='submit' class="submitbtn">탈퇴</button>
	</div>
	
	</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>