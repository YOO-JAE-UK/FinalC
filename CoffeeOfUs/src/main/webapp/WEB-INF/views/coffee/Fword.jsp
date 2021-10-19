<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp">
	<jsp:param name="num" value="<%=1%>" />
</jsp:include>

<!--  <script src="../resources/js/tour/list_manage.js" charset="utf-8"></script>  -->

<!--자동완성기능 필요한 것 CSS , JS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../resources/js/coffee/jquery-ui.js"></script>
<script src="../resources/js/coffee/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://unpkg.com/hangul-js"></script>
<script src="https://unpkg.com/type-hangul@latest/dist/type-hangul.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/coffee/hangul.js"></script>



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
  font-size: 12px;
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
  height: 50px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 50px;
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
	margin: 0 auto;
     /*  transform: translate(228%, -80%); */
     margin-bottom: 30px;
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
.panel{
	width: 70% !important;
    margin: 0 auto !important;
}

/* .modal-backdrop{
	height: 100%;
} */
/* Modal */
.modal-header{
	margin: 0 auto;
}
/* tab */
.tab-pane{
	width: 85%;
	text-align: left;
}
.nav nav-tabs{
	width:85%;
	margin-left: 100px;
}
.tab-content{
  	min-height: 100px;
    height: 100%;	
}
  
</style>
<script>
/* 자동완성기능 */
 $(function() { //화면 다 뜨면 시작
		//DB쿼리 조작 없이 초성 검색을 하기 위해서는 우선 DB에 있는 항목들을 다 가지고 와야한다.
		//즉 너무 많은 수가 있으면 클라이언트 측이 느려질 수 있다는 점.
		//하지만 DB쿼리를 조작해서 서버에서 초성검색을 하는 방식에 비해 서버에는 무리가 없다.
		// ajax로 미리 검색어 목록을 다 가지고 온다.
		$.ajax({
			type : 'get',
			url : "json",
			dataType : "json",
			//request.term = $("#autocomplete").val()
			//data: {"param":"param"},
			success : function(data) {
				//현재 data 상태
				//data = ["김치 볶음밥","신라면","진라면","라볶이","팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"];
				
				//이부분이 초성 검색이 가능하게 만들어 주는 부분
				let source = $.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
					chosung = "";
					//Hangul.d(item, true) 을 하게 되면 item이 분해가 되어서 
					//["ㄱ", "ㅣ", "ㅁ"],["ㅊ", "ㅣ"],[" "],["ㅂ", "ㅗ", "ㄲ"],["ㅇ", "ㅡ", "ㅁ"],["ㅂ", "ㅏ", "ㅂ"]
					//으로 나오는데 이중 0번째 인덱스만 가지고 오면 초성이다.
					Hangul.d(item, true).forEach(function(strItem, index) {
						if(strItem[0] != " "){	//띄어 쓰기가 아니면
							chosung += strItem[0];//초성 추가
						}
					});
					return {
						label : chosung + "|" +item, //실제 검색어랑 비교 대상 ㄱㅊㅂㅇㅂ|김치 볶음밥 이 저장된다.
						value : item, //김치 볶음밥
						chosung : chosung	//ㄱㅊㅂㅇㅂ
					}
				});
				
				
				$("#search_input").autocomplete({
					source : source,	// source 는 자동 완성 대상
					select : function(event, ui) {	//아이템 선택시
						console.log(ui.item.label + " 선택 완료");	
						
					},
					focus : function(event, ui) {	//포커스 가면
						return false;//한글 에러 잡기용도로 사용됨
					}
				}).autocomplete( "instance" )._renderItem = function( ul, item ) {	
				//.autocomplete( "instance" )._renderItem 설절 부분이 핵심
			      return $( "<li>" )	//기본 tag가 li로 되어 있음 
			        .append( "<div>" + item.value + "</div>" )	//여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
			        .appendTo( ul );	//웹 상으로 보이는 건 정상적인 "김치 볶음밥" 인데 내부에서는 ㄱㅊㅂㅇㅂ,김치 볶음밥 에서 검색을 함.
			    };
			}
		});

	});


	/* 자동완성 end */


	$(document).ready(function(){
		$("form").submit(function(){
			if($.trim($("#FWORD_WORD").val()) == ""){
				alert("단어를 밉력해주세요");
				$("#FWORD_WORD").focus();
				return false;
			}
			if($.trim($("#FWORD_CONTENT").val()) == ""){
				alert("단어 설명을 입력해주세요");
				$("#FWORD_CONTENT").focus();
				return false;
			}

		})//submit end

		
		$("span").click(function(){
			$("#word_content").text("");
			$.ajax({
				type : "POST",
				data : {
					"word" : $(this).text()
				},
				url : "target_word",
				dataType : "json",
				cashe : false,
				success : function(data) {
					output="";
					output="<div><h4>"+data.word+"</h4></div>"
					output+="<div>"+data.content+"</div>"
					$("#word_content").append(output);
				}, //success end
				error : function() {
					console.log('에러')
				}
			})//ajax end

		})
		$('.searchButton').click(function(){
			$("#word_content").text("");
			$.ajax({
				type : "POST",
				data : {
					"word" : $('#search_input').val()
				},
				url : "target_word",
				dataType : "json",
				cashe : false,
				success : function(data) {
					output="";
					output="<div><h4>"+data.word+"</h4></div>"
					output+="<div>"+data.content+"</div>"
					$("#word_content").append(output);
				}, //success end
				error : function() {
					console.log('에러')
				}
			})//ajax end
		});
	
		$('#myModal').modal('hide');
		$('.modal-backdrop').remove();
		
		
		
		
	})//document end
	
	
	
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
				<a href="Test">나만의 커피 찾기</a> 
				<a class="active"  href="Fword">커피 용어 찾기</a>
				<a href="Beans">원두</a>
			</div>
		</div>
		<div class="container calendar-container col-sm-7"
			style="position: relative; left: -5%; margin-top:30px;   font-size: 12pt;">
			
			
			
			
			<div style="text-align: center;"><h2><b><font color="#99654e">커피 용어 찾기</font></b></h2></div>



		
  					<div style="text-align: center; margin:0 auto;">
  						<div style="float: none; margin-top: 20px;"><h3><b><font color="#99654e">내용</font></b></h3></div>
  						<div style="float: none; margin: 0 auto; margin-bottom: 20px; border: 2px solid black; width: 300px; height: 100px;" id="word_content">
  							
  						</div>
					
					</div>
			
					
					<div class="wrap">
				 	   <div class="search">
				 	      <input id="search_input" name="word" type="text" class="searchTerm" placeholder="찾을 단어를 검색해 보세요!" value="">
				 	      <button type="submit" class="searchButton">
				 	        <i class="fa fa-search"></i>
				 	     </button>
				 	   </div>
				 	 
				 		</div>
					
		
<div style="margin-left: 100px;">			
	<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#r" aria-controls="r" role="tab" data-toggle="tab">ㄱ</a></li>
    <li role="presentation"><a href="#s" aria-controls="s" role="tab" data-toggle="tab">ㄴ</a></li>
    <li role="presentation"><a href="#e" aria-controls="e" role="tab" data-toggle="tab">ㄷ</a></li>
    <li role="presentation"><a href="#f" aria-controls="f" role="tab" data-toggle="tab">ㄹ</a></li>
    <li role="presentation"><a href="#a" aria-controls="a" role="tab" data-toggle="tab">ㅁ</a></li>
    <li role="presentation"><a href="#q" aria-controls="q" role="tab" data-toggle="tab">ㅂ</a></li>
    <li role="presentation"><a href="#t" aria-controls="t" role="tab" data-toggle="tab">ㅅ</a></li>
    <li role="presentation"><a href="#d" aria-controls="d" role="tab" data-toggle="tab">ㅇ</a></li>
    <li role="presentation"><a href="#w" aria-controls="w" role="tab" data-toggle="tab">ㅈ</a></li>
    <li role="presentation"><a href="#c" aria-controls="c" role="tab" data-toggle="tab">ㅊ</a></li>
    <li role="presentation"><a href="#z" aria-controls="z" role="tab" data-toggle="tab">ㅋ</a></li>
    <li role="presentation"><a href="#x" aria-controls="x" role="tab" data-toggle="tab">ㅌ</a></li>
    <li role="presentation"><a href="#v" aria-controls="v" role="tab" data-toggle="tab">ㅍ</a></li>
     <li role="presentation"><a href="#h" aria-controls="g" role="tab" data-toggle="tab">ㅎ</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  
    <div role="tabpanel" class="tab-pane active" id="r">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㄱ' or b.FWORD_CONSONANT=='ㄲ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>	
    </div>
    
    <div role="tabpanel" class="tab-pane" id="s">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㄴ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
    </div>
    <div role="tabpanel" class="tab-pane" id="e">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㄷ' or b.FWORD_CONSONANT=='ㄸ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
    <div role="tabpanel" class="tab-pane" id="f">
        <c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㄹ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
    </div>
    <div role="tabpanel" class="tab-pane" id="a">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅁ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
    <div role="tabpanel" class="tab-pane" id="q">
        <c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅂ' or b.FWORD_CONSONANT=='ㅃ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
    </div>
    <div role="tabpanel" class="tab-pane" id="t">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅅ' or b.FWORD_CONSONANT=='ㅆ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
    </div>
    <div role="tabpanel" class="tab-pane" id="d">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅇ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
    </div>
    <div role="tabpanel" class="tab-pane" id="w">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅈ' or b.FWORD_CONSONANT=='ㅉ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
    <div role="tabpanel" class="tab-pane" id="c">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅊ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
    </div>
    
        <div role="tabpanel" class="tab-pane" id="z">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅋ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
	
	    <div role="tabpanel" class="tab-pane" id="x">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅌ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
	
	    <div role="tabpanel" class="tab-pane" id="v">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅍ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
	
	    <div role="tabpanel" class="tab-pane" id="g">
    	<c:forEach var="b" items="${list}">
			<c:if test="${b.FWORD_CONSONANT=='ㅎ'}">
	       		<span>${b.FWORD_WORD}</span>&nbsp;&nbsp;&nbsp;
	       	</c:if>
  		</c:forEach>
	</div>
  </div>

</div>				
			
					
					
					
</div><!-- 내가만든 div -->					
					
					
					
					
					
					
					
				<!-- 모달 -->	

<%--modal 시작 --%>
			<div class="modal" id="myModal">
			 <div class="modal-dialog">
			  <div class="modal-content">
			   <%-- Modal body --%>
			   <div class="modal-body">
			   	<form name="deleteForm" action="add_word" method="post">
			   	<h2 style="text-align: center;">단어 추가하기</h2>
			   	<div class="form-group">
			   		<label for="FWORD_WORD">용어</label>
			   		<input type="text" class="form-control" name="FWORD_WORD" id="FWORD_WORD" placeholder="단어를 입력하세요" maxlength="15">
			   	</div>
			   	<div class="form-group">
			   		<label for="FWORD_CONTENT">용어설명</label>
			   		<textarea rows="10" class="form-control" name="FWORD_CONTENT" id="FWORD_CONTENT" placeholder="내용을 입력하세요"></textarea>
			   	</div>
			   
			   	
			   	<button type="submit" class="btn btn-primary">전송</button>
			   	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			   	</form>
			   </div><!-- class="modal-body" -->
			  </div><!-- class="modal-content" -->
			 </div><!-- class="modal-dialog" -->
			</div><!-- class="modal end"  <div class="modal" id="myModal">-->


				<!-- 모달 end -->	
		 	<button style="font-size: 12pt;" type="button" class="btn btn-info float-right" data-toggle="modal" data-target="#myModal">단어 추가하기</button> 
			
			<div class="col-sm-2">
			</div>
			
			
			
			
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>