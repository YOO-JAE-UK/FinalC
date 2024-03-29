<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자모드(회원 목록 보기)</title>
<jsp:include page="../header.jsp"></jsp:include>
<script src="../resources/js/jquery-3.6.0.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" 
      type="text/css" rel="stylesheet">
<%--  
1. 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다.

2. 검색 필드를 변경하면 검색어 입력창에 placeholder 나타나도록 합니다.
  예로 아이디를 선택하면 placeholder로 "아이디 입력하세요"라고 나타납니다.
  예로 이름를 선택하면 placeholder로 "이름 입력하세요"라고 나타납니다.
  예로 나이를 선택하면 placeholder로 "나이 입력하세요"라고 나타납니다.
  예로 성별를 선택하면 placeholder로 "여 또는 남 입력하세요"라고 나타납니다.
  
3. 검색 버튼 클릭시 다음을 체크합니다.
    1) 검색어를 입력하지 않은 경우 "검색어를 입력하세요" 라고 대화상자가 나타나게 합니다.
    2) 나이는 두 자리 숫자가 아닌 경우 "나이는 형식에 맞게 입력하세요(두자리 숫자)" 라고 대화상자가 나타나게 합니다.
    3) 성별은 "남" 또는 "여"가 아닌 경우 "남 또는 여를 입력하세요" 라고 대화상자가 나타나게 합니다.
    
4. 회원 목록의 삭제를 클릭한 경우
    confirm("정말 삭제하시겠습니까?")를 실행해서 취소를 클릭하면 "memberDelete.net"로 이동하지 않습니다.
 --%>
</head>
<script>
 $(function(){
	 //검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
	 var selectedValue = '${search_field}'
	 if(selectedValue != '-1')
		 $("#viewcount").val(selectedValue);
	 
	 //검색 버튼 클릭한 경우
	 $("button").click(function(){
     //검색어 공유 유효성 검사합니다.
        if($("input").val()== ''){
        	alert("검색어를 입력하세요");
        	$("input").focus();
        	return false;
        }
     
        word=$(".input-group input").val();
        if(selectedValue==3){
        	if (word!="남" && word!="여"){
        		alert("남 또는 여를 입력하세요");
        		return false;
        	}
        }
	 }); //button click end
	 
	 //검색어 입력창에 placeholder 나타나도록 합니다.
	 $("#viewcount").change(function(){
		 selectedValue = $(this).val();
		 $("input").val('');
		 message=["아이디","이름","닉네임","여 또는 남"]
		 $("input").attr("placeholder", message[selectedValue] + " 입력하세요");
	 })//$("#viewcount").change end
	 
	 //회원 목록의 삭제를 클릭한 경우
	 $("tr > td:nth-child(3) > a").click(function(event){
		 var answer = confirm("정말 삭제하시겠습니까?");
		 console.log(answer);//취소를 클릭한 경우-flase
		 if(!answer){//취소를 클릭한 경우
			 event.preventDefault(); //이동하지 않습니다.
		 }
	 }) //삭제 클릭 end
 })
</script>
<style>
table caption{caption-side:top; text-aligh:center}
h1{text-align:center}
li.current{
          background:#faf7f7; color:gray;
}
body > div > table > tbody > tr > td:last-child > a{color:red}
form{margin:0 auto; width:80%; text-align:center}
select{
   color: #495057;
   background-color: #fff;
   background-clip: padding-box;
   border: 1px solid #ced4da;
   border-radius: .25rem;
   transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
   outline:none;
 }
 .container{
 width:60%;
 font-size:15px;
 }
 
 td:nth-child(1){wieth:33%}
 
 .input-group{
 margin-bottom:1em;
 margin-top:4em;
 }
 
 .form-control{
 height: 40px !important;
 font-size:15px !important;
 }
 #submit_btn{
 font-size:15px;
 height: 39px;
 }
 #table_line{
 border: 1px; solid lightgray;
 }
</style>
</head>
<body>
<div class="container">
 <form action="list" method="post">
    <div class="input-group">
     <select id="viewcount" name="search_field">
        <option value="0"  selected>아이디</option>
        <option value="1">이름</option>
        <option value="2">닉네임</option>
     </select>
     <input name="search_word" type="text" class="form-control"
            placeholder="아이디 입력하세요" value="${search_word}">
     <button class="btn btn-primary" type="submit" id="submit_btn">검색</button>
    </div>
 </form>
 <%--회원이 있는 경우 --%>
 <c:if test="${listcount > 0 }"> 
 <table class="table table-striped">
   <caption style="font-weight:bold">관리자 전용</caption>
     <thead>
       <tr>
         <th colspan="2">회원 목록</th>
         <th>
              <font size=3>회원 수 : ${listcount}</font>
         </th>
       <tr>
          <td>아이디</td><td>이름</td><td>닉네임</td><td>삭제</td>
       </tr>
     </thead>
     <tbody>
        <!-- membercontroller > /list > mv.addObject("memberlist", list); -->
       <c:forEach var="m" items="${memberlist}">
        <tr>
         <td>
             <a href="member_info?id=${m.USER_ID}">${m.USER_ID}</a>
         </td>
        <td>${m.USER_NAME}</td>
        <td>${m.USER_NICKNAME}</td>
        <td><a href="delete?id=${m.USER_ID}">삭제</a></td>
        </tr>
       </c:forEach>     
     </tbody>     
 </table>
 <div>
    <ul class="pagination justify-content-center">
      <c:if test="${page <= 1 }">
         <li class="page-item">
           <a class="page-link current" href="#">이전&nbsp;</a>
         </li>
      </c:if>
      <c:if test="${page > 1 }">
            <li class="page-item">
<a href="list?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
                class="page-link">이전</a>&nbsp;
            </li>
      </c:if>   
      
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
         <c:if test="${a == page}">
            <li class="page-item">
                 <a class="page-link current" href="#" >${a}</a>
            </li>
         </c:if>
         <c:if test="${a != page }">
                <li class="page-item">
       <a href="list?page=${a}&search_field=${search_field}&search_word=${search_word}"
                           class="page-link">${a}</a>
                </li>
         </c:if>
       </c:forEach>
       
       <c:if test="${page >= maxpage }">
           <li class="page-item">
               <a class="page-link current" href="#">&nbsp;다음</a>
           </li>
       </c:if>
       <c:if test="${page < maxpage }">
           <li class="page-item">
    <a href="list?page=${page+1}&search_field=${search_field}&search_word=${search_word}"
                           class="page-link ">&nbsp;다음</a>
           </li>
       </c:if>
    </ul>
   </div>
  </c:if>
</div>

<%-- 회원이 없는 경우 --%>.
 <c:if test="${listcount == 0 && empty search_word }">
    <h1> 회원이 없습니다.</h1>
 </c:if>
 
 <c:if test="${listcount == 0 && !empty search_word}">
    <h1>  검색 결과가 없습니다.  </h1>
 </c:if>   
 
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>