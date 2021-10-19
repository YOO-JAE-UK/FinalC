<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA_board_modify</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/qna/modify.js"></script>
 <style>
 	h1{font-size: 1.5rem; text-align: center; color: #1a92b9}
	.container{width:60%; font-size:15px;}
	
	#font-size, #board_pass,
	#board_subject, #board_content{
		font-size:15px;
	}
	
	#upfile{display: none}
 </style>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

     <section class="upcoming-classes spad">
   	   <h4 style="text-align: center;">QNA - 수정 게시판</h4>
        <div class="container">
         <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                	<form action="modifyAction" method="post" name="modifyform"
					 enctype="multipart/form-data">
					 <input type="hidden" name="QNA_NUM" value="${boarddata.QNA_NUM}">
					<input type="hidden" name="QNA_FILE" value="${boarddata.QNA_FILE}">
					<input type="hidden" name="before_file" value="${boarddata.QNA_FILE}">
					<div class="form-group">
						<label for="board_name">글쓴이</label>
						<input type="text" class="form-control" id="font-size"
						value="${boarddata.USER_NICKNAME}" readOnly>
						<input type="hidden" class="form-control" id="font-size"
						value="${boarddata.USER_ID}" readOnly>
					</div>
					
					<div class="form-group">
						<label for="board_subject">제목</label>
						<textarea name="QNA_SUBJECT" id="board_subject" rows="1" 
						 class="form-control" maxlength="100">${boarddata.QNA_SUBJECT}</textarea>
					</div>
					
					<div class="form-group">
						<label for="board_content">내용</label>
						<textarea name="QNA_CONTENT" id="board_content" 
						 class="form-control" rows="15">${boarddata.QNA_CONTENT }</textarea>
					</div>
					<%-- 원문글인 경우에만 파일 첨부 수정 가능합니다. --%>
					<c:if test="${boarddata.QNA_RE_LEV==0 }">
					<div class="form-group read">
						<label for="board_file">파일 첨부</label>
						<label for="upfile">
							<img src="../resources/img/attach.png" alt="파일첨부" width="20px">
						</label>
						<input  type="file" id="upfile" name="uploadfile">
						 <span id="filevalue">${boarddata.QNA_ORIGINAL}</span>
						 <img src="../resources/img/remove.png" alt="파일삭제" 
						 		width="10px" class="remove">
					</div>
					
					</c:if>
					
					<div class="form-group">
						<label for="board_pass">비밀번호</label>
						<input name="QNA_PASS"
						 id="board_pass" type="password" size="10" maxlength="30"
						 class="form-control" placeholder="Enter board_pass" value="">
					</div>
					<div>
						<button type="submit" class="btn btn-primary" id="font-size">수정</button>
						<button type="reset" class="btn btn-danger" id="font-size"
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