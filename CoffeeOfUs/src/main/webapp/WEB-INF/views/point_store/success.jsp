<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>주 문 정 보</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../resources/js/member/join.js" charset="utf-8"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/payment.css"
	type="text/css" rel="stylesheet">
<script>
	
</script>
<style>
#recieveaddress{
	position:relative;
	right:341px;
}
.od{
	font-size:17px;
	position:relative;
	left:111px;
	bottom:25px
}
#tex{
	resize:none;
	height:78px;
	width:179px;
	border:none
}
#text{
	resize:none;
	height:78px;
	width:285px;
	border:none
}
.order{
	font-size:17px
}
#rec{
	position:relative;
	left:464px;
	bottom:258px
}
#back{
  position:relative;
  bottom:167px;
  right:538px
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    
   <div class="container" style="width:60%">
	<form  id="successform"
		action="${pageContext.request.contextPath }/point_store/finalPay"
		method="post" >
		<c:set var="r" value="${addressInfo}"/>
		<input type="hidden" name="check" value="${check }">
		<input type="hidden" name="productname"  value="${product.productname}">
	    <input type="hidden" name="code" value="${product.code}">
		<input type="hidden" name="productname" value="${product.productname }">
		<input type="hidden" name="quantity" value="${product.quantity }">
		<input type="hidden" name="perpoint" value="${product.perpoint }"> 
		<input type="hidden" name="point" value="${point}"> 
		<h1 class="titlefont">결제가 완료되었습니다</h1>

		<div class="order" id="orderid" >
			<b>주문자 아이디:</b>
			<span class="od" >${id }</span>
		</div> 
		<div class="order" id="ordername" >
			<b>주문자 이름:</b>
			<span class="od" >${member.USER_NICKNAME }</span>
		</div>
		<div class="order" id="ordetel" >
			<b>주문자 연락처:</b>
			<span class="od" >${member.USER_PHONE }</span>
		</div>
		<div class="order" id="orderemail" >
			<b>주문자 이메일:</b>
			<textarea rows="3" cols="9" id="text">${member.USER_EMAIL }</textarea>
		</div>
		
		<div id="rec">
		<div id="recename" class="order">
			<b>받는분 이름:</b>
			<span class="od" >${r.rname}</span>
		</div>
		
		<div id="rectel" class="order">
			<b>받는 연락처:</b>
			<span class="od" >${r.rtel}</span>
		</div>
		<div id="recieveemail" class="order">
			<b>받는분 주소:</b>
			<textarea rows="3" cols="9" id="tex">${r.raddress}</textarea>
		</div>
	  </div>
		
		
		<div id="product" style="position:relative;bottom:239px">
		<h1 class="titlefont2" >상품정보</h1>
			<table class="table table-striped" style="margin-bottom:-7rem">
				<thead>
					<tr>
						<th>상품명</th>
						<th>수 량</th>
						<th>단 가</th>
						<th>가 격</th>
					</tr>
				</thead>
				<tbody>
			<c:if test="${check==1 }">
				<c:set var="p" value="${product}"/>
					 <tr>
						<td>${p.productname }</td>
						<td>${p.quantity }</td>
						<td>${p.perpoint }</td>
						<td>${totalPoint}</td>
					</tr> 
			</c:if>	
			<c:if test="${check==0 }">
			  <c:forEach  var="c" items="${cartlist }">
			      <tr>
			      	    <td>${c.cproductname }</td>
						<td>${c.cquantity }</td>
						<td>${c.cperpoint }</td>
						<td>${c.ctotalpoint}</td>
					</tr>   
			  
			  </c:forEach>
			</c:if>  	
				</tbody>

			</table>
		</div>
		
		
		
		<br>

		<div class="clearfix" style="position:relative;bottom:15px">


			<div id="point" class="order" style="position:relative;left:575px;bottom:123px">
			<b>결제된 포인트:</b>
			<span class="od" >${totalPoint }</span>
		   </div>
					
			<button type="button" class="submitbtn" id="back" onclick="location.href='list'" >스토어로 돌아가</button>
		</div>

	</form>
</div>	
<script src="../resources/js/point_store/payment.js" charset="utf-8"></script> 
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>