<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA_board_list</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/qna/list.js" charset="utf-8"></script>
 <style>
   select.form-control{
         width:auto;margin-bottom:2em;display:inline-block}
   .rows{text-align:right; font-size: 15px;}
   .gray{color:gray}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:8%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:50%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:14%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:17%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:11%}
  
  .form-control{
  	width: 10px !important;
  	height: 21px !important;
  }
  .current{
  	position: absolute;
    top: -10px;
    left: 12px;
  }
  .container{
   	font-size: 15px;
   }
   
   #float-right{
   	font-size: 15px;
    width: 7%;
    height: 30px;
   }
   
   #title{
   text-align: center;
   margin-top: 50px;
   margin-bottom: -31px;
   }
 </style>
</head>
<body>
<jsp:include page="../header.jsp">
		 <jsp:param name="num" value="<%= 4 %>"/>
	</jsp:include>

<h2  id="title">QNA 게시판</h2>
     <section class="upcoming-classes spad">
        <div class="container">
         <div class="row">
			
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
	   <th>
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
	<c:forEach var="b" items="${boardlist}" >	
	<tr>
	  <td><%--번호 --%>
		<c:out value="${num}"/><%-- num 출력 --%>		
		<c:set var="num" value="${num-1}"/>	<%-- num=num-1; 의미--%>	
	  </td>
	  <td><%--제목 --%>
	     <div>			
			<%-- 답변글 제목앞에 여백 처리 부분 
			      QNA_RE_LEV,  QNA_NUM, 
			      QNA_SUBJECT, QNA_NAME, QNA_DATE, 
			      QNA_READCOUNT : property 이름 --%>
		    <c:if test="${b.QNA_RE_LEV != 0}">  <!--  답글인 경우 -->
				<c:forEach var="a" begin="0" end="${b.QNA_RE_LEV*2}" step="1">
				&nbsp; 	
				</c:forEach>		
				<img src='../resources/img/line.gif'>
			</c:if>  
			 
			<c:if test="${b.QNA_RE_LEV == 0}">  <%-- 원문인 경우 --%>
				&nbsp;  
			</c:if> 			
			
			<a href="detail?num=${b.QNA_NUM}">
				 <c:out value="${b.QNA_SUBJECT}"  escapeXml="true"/>  
				<%-- ${b.QNA_subject} --%>
				<%-- escapeXml="true" : HTML 태그를 화면에 그대로 보여줍니다. --%>	
				<span class="gray small">[<c:out value="${b.CNT}"/>]</span>
			</a>
			
		  </div>
		</td>
		<c:choose>
		<c:when test="${name==''}">
		<td><div>${b.USER_ID}</div></td>
		</c:when>
		<c:otherwise>
		<td><div>${b.USER_NICKNAME}</div></td>
		</c:otherwise>
		</c:choose>
		<td><div>${b.QNA_DATE.substring(0,10)}</div></td>	
		<td><div>${b.QNA_READCOUNT}</div></td>
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
					
					<button type="button" class="btn btn-info float-right" id="float-right">글 쓰 기</button>
                
         </div><!--     <div class="row"> end -->
        </div><!-- container end -->
     </section>
 
     <!-- footer -->
     <jsp:include page="../footer.jsp" />
</body>
</html>