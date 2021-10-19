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
	$(".update").click(function() {
		location.href = "${pageContext.request.contextPath}/member/update?id=${id}";   //controller주소
	});
})
$(function() {
	$(".change_pass").click(function() {
		location.href = "${pageContext.request.contextPath}/member/changepass?id=${id}";   //controller주소
	});
})
$(function() {
	$(".dropbtn").click(function() {
		location.href = "${pageContext.request.contextPath}/member/drop";   //controller주소
	});
})

</script>
<style>

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

 <c:set var="m" value="${memberinfo}"/>
	<form name="member_info" id="member_info" action="${pageContext.request.contextPath }/member/member_info"
		method="get">
		<h3 class="titlefont">회원 정보</h3>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<c:choose>
			<c:when test="${name=='' }">
			<div class="infotext">${m.USER_ID}</div>
			</c:when>
			<c:otherwise>
			<div class="infotext">${m.USER_NAME}</div>
			</c:otherwise>
			</c:choose>
			   <div class="showinfo"></div><%-- Member.java클래스의 getUSER_ID()메서드 호출 --%>
			<div class="comtext">별 명</div>
			<div class="infotext">${m.USER_NICKNAME}</div>
			   <div class="showinfo"></div>
			<div class="comtext">이메일 주소</div>
			<div class="infotext">${m.USER_EMAIL}</div>
			   <div class="showinfo"></div>
			<div class="comtext">주 소</div>
			<div class="infotext">${m.USER_ADDRESS}</div>
			   <div class="showinfojuso"></div>
			<div class="comtext">연 락 처</div>
			<div class="infotext">${m.USER_PHONE}</div>
			   <div class="showinfo"></div>
			<div class="comtext">프로필 사진</div>
			<img src="../upload${m.USER_FILE}" alt="user_image"  class="user_image">
			
			   <div class="showinfoimg"></div>
		</div>
			
			
			

	<div class="clearfix">
       <button type='reset' class="cancelbtn" onClick="history.go(-1)">← 취소</button>
	   <button type='button' class="update">회원정보 변경</button>
	   <button type='button' class="change_pass">비밀번호 변경</button>
	   <button type='button' class="dropbtn">탈퇴</button>
	</div>
	
	</form>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>