<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Story</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 123 %>"/>
	</jsp:include>
<h1 style="text-align: center;">Beans입니다.</h1>
	 <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
                 <div class="col-xs-12 col-sm-12 col-md-3">
                	<ul>
                		<li>취향 테스트</li>
                		<li>커피 이야기</li>
                		<li>커피 용어</li>
                		<li>원두</li>
                		<li>머신</li>
                		<li>레시피</li>
                	</ul>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                	hi~
                </div>
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
     
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>