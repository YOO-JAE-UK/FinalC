<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE_write</title>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/coffee/list.js" charset="utf-8"></script>
 <style>
   select.form-control{
         width:auto;margin-bottom:2em;display:inline-block}
   .rows{text-align:right;}
   .gray{color:gray}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:8%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:50%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:14%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:17%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:11%}
   
   .sidebar {
	margin: 0;
	padding: 0;
	width: 200px;
	background-color: #f1f1f1;
	height: 100%;
	overflow: auto;
	min-height: 400px;
}

/* Sidebar links */
.sidebar a {
	display: block;
	color: black;
	padding: 20px;
	position: relative;
	top: 100px;
	text-decoration: none;
	font-size: 16px;
}

/* Active/current link */
.sidebar a.active {
	background-color: #37586f;
	color: white;
}

/* Links on mouse-over */
.sidebar a:not(.active ):hover {
	background-color: #9e9e9e;
	color: white;
}

/* Page content. The value of the margin-left property should match the value of the sidebar's width property */
div.content {
	margin-left: 200px;
	padding: 1px 16px;
	height: 1000px;
}

/* On screens that are less than 700px wide, make the sidebar into a topbar */
@media screen and (max-width: 700px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		float: left;
	}
	div.content {
		margin-left: 0;
	}
}
 </style>
</head>
<body>
<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a class="active" href="list">커피 정보 게시판</a> 
				<a href="Fword">출석 게시판</a>
				<a href="Beans">투어게시판</a>
				<a href="Beans">Q & A</a>
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px; margin-bottom: 30px;">
			
			


<div class="col-xs-12 col-sm-12 col-md-9">
                	<span>줄보기</span>
					<select class="form-control" id="viewcount">
						<option value="1">1</option>
						<option value="3">3</option>
						<option value="5">5</option>
						<option value="7">7</option>
						<option value="10" selected>10</option>
					</select>
					        	 <%-- 게시글이 있는 경우--%> 
								<c:if test="${listcount > 0 }">
								 <table class="table table-striped">
   <thead>
	<tr>
	   <th colspan="3">MVC 게시판 - list</th>
	   <th colspan="2">
			<font size=3>글 개수 : ${listcount}</font>
	   </th>
	</tr>
	<tr>
		<th><div>번호</div></th>
		<th><div>제목</div></th>
		<th><div>작성자</div></th>
		<th><div>날짜</div></th>
		<th><div>조회수</div></th>
	</tr>	
   </thead>
   <tbody>
	<c:set var="num" value="${listcount-(page-1)*limit}"/>	
	<c:forEach var="b" items="${boardlist}">	
	<tr>
	  <td><%--번호 --%>
		<c:out value="${num}"/><%-- num 출력 --%>		
		<c:set var="num" value="${num-1}"/>	<%-- num=num-1; 의미--%>	
	  </td>
	  <td><%--제목 --%>
	     <div>			
			<%-- 답변글 제목앞에 여백 처리 부분 
			      COFFEE_RE_LEV,  COFFEE_NUM, 
			      COFFEE_SUBJECT, COFFEE_NAME, COFFEE_DATE, 
			      COFFEE_READCOUNT : property 이름 --%>
		    <c:if test="${b.COFFEE_RE_LEV != 0}">  <!--  답글인 경우 -->
				<c:forEach var="a" begin="0" end="${b.COFFEE_RE_LEV*2}" step="1">
				&nbsp; 	
				</c:forEach>		
				<img src='../resources/img/line.gif'>
			</c:if>  
			 
			<c:if test="${b.COFFEE_RE_LEV == 0}">  <%-- 원문인 경우 --%>
				&nbsp;  
			</c:if> 			
			
			<a href="detail?num=${b.COFFEE_NUM}">
				 <c:out value="${b.COFFEE_SUBJECT}"  escapeXml="true"/>  
				<%-- ${b.COFFEE_subject} --%>
				<%-- escapeXml="true" : HTML 태그를 화면에 그대로 보여줍니다. --%>	
				<span class="gray small">[<c:out value="${b.CNT}"/>]</span>
			</a>
			
		  </div>
		</td>
		<td><div>${b.USER_NICKNAME}</div></td>
		<td><div>${b.COFFEE_DATE}</div></td>	
		<td><div>${b.COFFEE_READCOUNT}</div></td>
	   </tr>
	  </c:forEach>
	 </tbody>	
	</table>
		
	<div class="center-block">
		  <ul class="pagination justify-content-center">		
			 <c:if test="${page <= 1 }">
				<li class="page-item">
				  <a class="page-link gray">이전&nbsp;</a>
				</li>
			 </c:if>
			 <c:if test="${page > 1 }">			
				<li class="page-item">
				   <a href="list?page=${page-1}" 
				      class="page-link">이전&nbsp;</a>
				</li> 
			 </c:if>
					
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li class="page-item " >
					   <a class="page-link gray">${a}</a>
					</li>
				</c:if>
				<c:if test="${a != page }">
				    <li class="page-item">
					   <a href="list?page=${a}" 
					      class="page-link">${a}</a>
				    </li>	
				</c:if>
			</c:forEach>
			
			<c:if test="${page >= maxpage }">
				<li class="page-item">
				   <a class="page-link gray">&nbsp;다음</a> 
				</li>
			</c:if>
			<c:if test="${page < maxpage }">
			  <li class="page-item">
				<a href="list?page=${page+1}" 
				   class="page-link">&nbsp;다음</a>
			  </li>	
			</c:if>
		 </ul>
		</div>
     </c:if><%-- <c:if test="${listcount > 0 }"> end --%>
					
					<%-- 게시글이 없는 경우--%>
					<c:if test="${listcount == 0 }">
						<font size=5>등록된 글이 없습니다.</font>
					</c:if>
					
					<button type="button" class="btn btn-info float-right">글 쓰 기</button>
                </div>



		 	
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>
 
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>