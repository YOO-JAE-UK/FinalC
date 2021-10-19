<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/tour/list_manage.js" charset="utf-8"></script>

 
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=5%>" />
</jsp:include>


<style>
	/* search */
	.nice-select{
		border: solid 2px #37586f !important; 	
		width: 60px !important;
    	padding: 0px !important;
    	padding-left: 5px !important;
   		 height: 25px !important;
   		 line-height: 23px !important;
   		 font-size: 10px !important;
	}
	.nice-select .option{
		border: 0px solid black;
	     padding-left: 18px !important; 
    	 padding-right: 29px !important;
    	 line-height: 20px !important;
    	 min-height: 0px !important;
	}
	
	.nice-select .option{
	    padding-left: 0px !important;
   		padding-right: 0px !important;
	}
	
	.nice-select .list {
	
	box-shadow: 0 0 0 1px rgb(0 0 0) !important;
	}
	
	
	
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.search_field{
 	border: 2px solid #37586f;
    border-radius: 5px;
    height: 25px;
}

   

body{
  background: #f2f2f2;
  font-family: 'Open Sans', sans-serif;
}

.search {
  width: 100%;
  position: relative;
  display: flex;
}

.searchTerm {
  width: 100%;
  border: 3px solid #37586f;
  border-right: none;
  padding: 5px;
  height: 35px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 35px;
  border: 1px solid #37586f;
  background: #37586f;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 30%;

      transform: translate(228%, -80%);
}

	/* searach  */










/*  */
 video {
    max-width: 100%;
  }
  .card {
    transition: transform 0.2s ease;
    box-shadow: 0 4px 6px 0 rgba(22, 22, 26, 0.18);
    border-radius: 0;
    border: 0;
    margin-bottom: 1.5em;
  }
  .card:hover {
    transform: scale(1.1);
  }
  .nav-sidebar{
  	padding-top: 30px;
  }
  

.btn{
	margin-bottom: 30px;
    margin-top: 30px;
}

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

/* On screens that are less than 400px, display the bar vertically, instead of horizontally */
@media screen and (max-width: 400px) {
	.sidebar a {
		text-align: center;
		float: none;
	}
}
.over{
	overflow: hidden
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="tour_map">시 도 별지도</a> 
				<a class="active"  href="tour_board_list">투어 후기 리스트</a>

			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px;">
			
			
			
			
			<div style="text-align: center;"><h2><b><font color="#99654e">Tour_List</font></b></h2></div>
<c:if test="${listcount > 0 }">							  
  </c:if><%-- <c:if test="${listcount > 0 }"> end --%>
  <font size=3 style="margin-left: 15px; margin-bottom: 20px">관리자 글(only 1) 개수 : ${listcount}</font>	
  
  
					<div class="wrap">
					<form action="tour_board_manage_list">
						<select id="viewcount" name="search_type" class="search_field">
							<option value="0" ${search_type==0 ? "selected":""}>제목</option>
							<option value="1" ${search_type==1 ? "selected":""}>카페이름</option>
							<option value="2" ${search_type==2 ? "selected":""}>내용</option>
							<option value="3" ${search_type==3 ? "selected":""}>작성자</option>
						</select>
				 	   <div class="search">
				 	      <input id="search_input" name="search_text" type="text" class="searchTerm" placeholder="찾을 단어를 검색해 보세요!" value="${search_text}">
				 	      <button type="submit" class="searchButton">
				 	        <i class="fa fa-search"></i>
				 	     </button>
				 	   </div>
				 	 </form>
				 		</div>
				
				
				
  
  
  	
					       <div class="container mt-2">
							  <div class="row">
			<c:set var="num" value="${listcount-(page-1)*limit}"/>	
			<c:forEach var="b" items="${boardlist}">	
							    <div class="col-md-3 col-sm-7">
							      <div class="card card-block" style="margin-bottom: 30px;">
				 <div>																					
																					<c:set var="tour_num" value="${tour_num+1}"/>
							      <p class="card-title text-right" style="float:left; text-align: center;">NO.<c:out value="${listcount-tour_num+1}"/></p>
							    <p class="card-title text-left" style="float:right; text-align: center;">조회수 : ${b.TOUR_READCOUNT }</p>
				 </div>
							 <div style="width: 100%; height: 150px;"> 
							    
							     <c:if test="${empty b.TOUR_FILE}">
							    <a href="detail?num=${b.TOUR_NUM}" style="color: black"> 
							    	<img src="${pageContext.request.contextPath}/resources/img/cafe_default.jpg" alt="cafe_image" title="cafe_image" class="shoe fade-in one" id="cafe_image" width="100%" height="100%"/> 
								</a>
								</c:if>
								
							<%-- 	<c:set var="cafe_image" value="${boarddata.TOUR_FILE}"/> --%>
							                    <c:if test="${!empty b.TOUR_FILE}">
							                    <a href="detail?num=${b.TOUR_NUM}" style="color: black"> 
							                    	<img src="get_img?name=${b.TOUR_FILE}" alt="cafe_image"  class="shoe fade-in one" width="100%" height="100%">
							   					</a>
							   					</c:if>
							     
							     
							  </div>     
							        <h5 class="card-title mt-3 mb-3" style="text-align: center;">
							        	<a href="detail?num=${b.TOUR_NUM}" style="color: black"> 
											 <c:out value="${b.TOUR_SUBJECT}"  escapeXml="true"/> 
										</a>
							        </h5>
							        <hr style="margin-top: 0px;">
							        <p class="card-text over" style="height: 60px"> 카페이름 : ${b.TOUR_NAME}</p>
							        <p class="card-text">날짜 : ${b.TOUR_DATE.substring(0,10)}</p>
							        <p class="card-text over">닉네임 : ${b.USER_NICKNAME}</p> 
								  </div>
								</div> <!-- "col-md-3 col-sm-6" end -->
			</c:forEach>
			
	
	
<%-- 게시글이 없는 경우--%>
					<c:if test="${listcount == 0 }">
						<font size=5>등록된 글이 없습니다.</font>
					</c:if>	
	
	
							  </div> <!-- row end -->
							  
							  
							  	<!-- Pagination -->
	<div class="center-block">
		  <ul class="pagination justify-content-center">		
			 <c:if test="${page <= 1 }">
				<li class="page-item">
				  <a class="page-link gray">이전&nbsp;</a>
				</li>
			 </c:if>
			 <c:if test="${page > 1 }">			
				<li class="page-item">
				   <a href="tour_board_manage_list?page=${page-1}" 
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
					   <a href="tour_board_manage_list?page=${a}" 
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
				<a href="tour_board_manage_list?page=${page+1}" 
				   class="page-link">&nbsp;다음</a>
			  </li>	
			</c:if>
		 </ul>
		</div>
		
		
							 </div>	<!-- <div class="container mt-2"> -->
					
					
					
					
					
					
					
					
					
					
				<!-- 	<button type="button" class="btn btn-info float-right">글 쓰 기</button> -->
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>