<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE_modify</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/coffee/modify.js"></script>
 <style>
 	h1{font-size: 1.5rem; text-align: center; color: #1a92b9}
	.container{width:60%}
	#upfile{display: none}
 </style>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

<h2 style="text-align: center;">Beans입니다.</h2>
	 <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
                 <div class="col-xs-12 col-sm-12 col-md-3">
                	<ul>
                		<li>커피 정보게시판</li>
                		<li>출석 게시판</li>
                		<li>추천 음악게시판</li>
                		<li>투어 게시판</li>
                		<li>Q & A</li>
                	</ul>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                	<form action="modifyAction" method="post" name="modifyform"
					 enctype="multipart/form-data">
					 <input type="hidden" name="COFFEE_NUM" value="${boarddata.COFFEE_NUM}">
					<input type="hidden" name="COFFEE_FILE" value="${boarddata.COFFEE_FILE}">
					<input type="hidden" name="before_file" value="${boarddata.COFFEE_FILE}">
					<h1>MVC 게시판 - 수정</h1>
					<div class="form-group">
						<label for="board_name">글쓴이</label><input type="text"
						 class="form-control" value="${boarddata.USER_ID}" readOnly>
					</div>
					
					<div class="form-group">
						<label for="board_subject">제목</label>
						<textarea name="COFFEE_SUBJECT" id="board_subject" rows="1"
						 class="form-control" maxlength="100">${boarddata.COFFEE_SUBJECT}</textarea>
					</div>
					
					<div class="form-group">
						<label for="board_content">내용</label>
						<textarea name="COFFEE_CONTENT" id="board_content" 
						 class="form-control" rows="15">${boarddata.COFFEE_CONTENT }</textarea>
					</div>
					<%-- 원문글인 경우에만 파일 첨부 수정 가능합니다. --%>
					<c:if test="${boarddata.COFFEE_RE_LEV==0 }">
					<div class="form-group read">
						<label for="board_file">파일 첨부</label>
						<label for="upfile">
							<img src="../resources/img/attach.png" alt="파일첨부" width="20px">
						</label>
						<input  type="file" id="upfile" name="uploadfile">
						 <span id="filevalue">${boarddata.COFFEE_ORIGINAL}</span>
						 <img src="../resources/img/remove.png" alt="파일삭제" width="10px" class="remove">
					</div>
					
					</c:if>
					
					<div class="form-group">
						<label for="board_pass">비밀번호</label>
						<input name="COFFEE_PASS"
						 id="board_pass" type="password" size="10" maxlength="30"
						 class="form-control" placeholder="Enter board_pass" value="">
					</div>
					<div>
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="reset" class="btn btn-danger"
								onclick="history.go(-1)">취소</button>
					</div>
					</form>
                </div>
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
 
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>