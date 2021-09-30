<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회 원 정 보</title>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath }/resources/css/member_info.css"
	type="text/css" rel="stylesheet">

<script> 

$(function() {
	$(".change_member_info").click(function() {
		location.href = "${pageContext.request.contextPath}/member/change_member_info";   //controller주소
	});
})
$(function() {
	$(".change_pass").click(function() {
		location.href = "${pageContext.request.contextPath}/member/changepass";   //controller주소
	});
})

</script>
<style>

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

 <c:set var="m" value="${memberinfo}"/>
	<form name="member_info" action="${pageContext.request.contextPath }/member/member_info"
		method="get">
		<h3 class="titlefont">회원 정보</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			   <div class="show">${m.USER_ID}</div><%-- Member.java클래스의 getUSER_ID()메서드 호출 --%>
			<div class="comtext">별 명</div>
			   <div class="show">${m.USER_NICKNAME}</div>
			<div class="comtext">이메일 주소</div>
			   <div class="show">${m.USER_EMAIL}</div>
			<div class="comtext">주 소</div>
			   <div class="showsujo">${m.USER_ADDRESS}</div>
			<div class="comtext">연 락 처</div>
			   <div class="show">${m.USER_PHONE}</div>
			<div class="comtext">프로필 사진</div>
			   <div class="showimg">${m.USER_IMG}</div>
		</div>
			
			
			

	<div class="clearfix">
       <button type='reset' class="cancelbtn">← 취소</button>
	   <button type='button' class="change_member_info">회원정보 변경</button>
	   <button type='button' class="change_pass">비밀번호 변경</button>
	   <button type='submit' class="submitbtn">탈퇴</button>
	</div>
	
	</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>