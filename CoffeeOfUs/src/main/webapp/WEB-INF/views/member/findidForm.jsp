<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>ID/PW 찾기</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<jsp:include page="../header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/css/findid.css"
	type="text/css" rel="stylesheet">

<script>
var findid = " ${id.USER_ID}";
var result = "${result}";
if (result == 'findpass_EmailFail') {
	alert("정보가 일치하지 않습니다.")
}

 if ("${rr}" == 'findid_IdFail') {
	alert("아이디는 " + findid +" 입니다." )
 }
	</script>



<style>
</style>


</head>
<body>
	
    
	<form name="findidForm1" id="form1" action="${pageContext.request.contextPath }/member/findIdProcess"
		method="POST">
		<h3 class="titlefont">ID 찾기</h3>
		<div class="input_wrp">
			
			<div class="comtext">이메일</div>
			<div class="input_wrp">
				<div class="findemailbtn">
					<input type='text' id="findemail" name="findemail"
						placeholder="ex) user01@naver.com" required>
				</div>
			</div>
				<div>
					<button type="submit" class="findidbtn" id="searchBtn">ID 찾기</button>
				</div>
		</div><br>
	</form>
	<form name="findpassForm2" id="form2" action="${pageContext.request.contextPath }/member/findpwProcess"
		method="post">
		<h3 class="titlefont2"> 비밀번호 찾기</h3>
		<p class="title2_message">사용자 ID와 이메일 주소를 입력후 이메일을 확인해주세요.</p>
		<div class="input_wrp">
			<div class="comtext">사용자 ID</div>
			<input type='text' id="id" name="id" placeholder="ex) user01"
				required>
			<div class="comtext">이메일 주소</div>
			<input type='text' id="email" name="email" placeholder="ex) user01@naver.com"
				required>
			<div>
				<button type="submit" class="tempassbtn">비밀번호 찾기</button>
			    <button type='reset' class="cancelbtn" onClick="history.go(-1)">← 취소</button>
			</div>
		</div>
	</form>
	
	

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>