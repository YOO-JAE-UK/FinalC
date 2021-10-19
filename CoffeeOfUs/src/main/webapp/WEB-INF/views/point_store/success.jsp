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
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    
   
	<form  id="joinform"
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
		<h1 class="titlefont">주문정보</h1>

		<div id="idwap">
			<em style="color: red; float: left">*</em> <b id="idtext">주문자 ID</b>
			<input type="text" name="id" id="input_id" readonly value="${id}"
				>
		</div>

		<div id="wap">
			<em style="color: red; float: left; margin: 53px 0 0 0;">*</em> <b
				id="nametext">주문자 이름</b> <input type="text" name="USER_NICKNAME" class="tx"
				id="input_name" value="${member.USER_NICKNAME }" readonly>
		</div>
		<div></div>
		<div id="email_wap">
			<em style="color: red; float: left; margin: -3px 0 0 0;">*</em> <b
				id="mailtext" style="width: 50%">이메일 주소</b> <input type="text"
				name="USER_EMAIL" class="tx" id="input_email" value="${member.USER_EMAIL }"
			readonly>
		</div>


		<div id="tel_wap">
			<em style="color: red; float: left; margin: 37px 0px 0 0px;">*</em> <label
				for="tel_1"><b id="teltext">연&nbsp;락&nbsp;처</b></label><br> <input
				type="text"  name="USER_PHONE" class="tx" value="${member.USER_PHONE }"
				id="input_tel" readonly>
		</div>
		<br> <br>
		<h1 class="titlefont2">상품정보</h1>
		<div id="product">
			<table class="table table-striped">
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
		<h1 class="titlefont2"></h1>

		<div id="recievewap">
			<em style="color: red; float: left">*</em> <b id="idtext">받는분 성함:</b>
			<input type="text" name="rname" id="recievename" value="${r.rname}" required
				maxLength="14">
		</div>
		<br>
		<div id="recievewap">
			<em style="color: red; float: left">*</em> <b id="idtext">받는분 연락처:</b>
			<input type="text" name="rtel" id="recievetel" value="${r.rtel}"required
				maxLength="14">
		</div>
		<div id="recievewap">
			<em style="color: red; float: left">*</em> <b id="idtext">받는 곳:</b>
			<input type="text" name="rplace" id="recieveaddress" value="${r.rplace}"required
				maxLength="14">
		</div>
		<br> <b>최근 배송지</b>
        <div id="juso">
		 <c:if test="${addressList!=null}">
		   <c:forEach var="add" items="${addressList}">
		      <c:if test="${add.rcheck==1}">
		      <div class="form-check form-check-inline">
			   <input class="form-check-input" type="radio"
				name="rplace" id="inlineRadio1" value="${add.raddress}" checked >
				<input type="hidden" name="rpost" value="${add.rpost}">
				<input type="hidden" name="rname" value="${add.rname}">
				<input type="hidden" name="rtel" value="${add.rtel}">
			   <label class="form-check-label" for="inlineRadio1">${add.rplace}</label>
		      </div>
		      </c:if>
		    <c:if test="${add.rcheck==0}">
		     	<div class="form-check form-check-inline">
			   <input class="form-check-input" type="radio"
				name="rplace" id="inlineRadio1" value="${add.raddress} " >
				<input type="hidden" name="rpost" value="${add.rpost}">
				<input type="hidden" name="rname" value="${add.rname}">
				<input type="hidden" name="rtel" value="${add.rtel}">
			   <label class="form-check-label" for="inlineRadio1">${add.rplace}</label>
		      </div>
		      </c:if>	      
		   </c:forEach>
		 </c:if> 
		</div>
		
		<!-- <div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="address" id="inlineRadio1" value="option1" >
			<label class="form-check-label" for="inlineRadio1">집</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="address" id="inlineRadio2" value="option2">
			<label class="form-check-label" for="inlineRadio2">회사</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="address" id="inlineRadio3" value="option3">
			<label class="form-check-label" for="inlineRadio3">학교 </label>
		</div> -->
		<br>

		<div class="clearfix">


			<em style="color: red; float: left; margin: 25px 0 0 0;">*</em> <b
				id="addtext">받는분 주소</b> <input type="text"
				size="10" maxLength="10" name="rpost" class="tx" id="post1" value="${r.rpost}"required>
			<div id="add_wap">
				<input type="button" value="우편검색" id='postcode'
					onclick="execDaumPostcode()"> <input type="text" size="50"
					name="raddress" class="tx" id="address" value="${r.raddress }" required>
			</div>
			<button type="button" class="btn btn-info addaddress" id="addAddress">기본 배송지로 설정</button>
			<div class="totalPoint">
			<div id="totalpointwap">
			<em style="color: red; float: left">*</em> <b id="idtext">총결제 포인트:</b>
			<input type="text" name="totalPoint" id="totalpoint" required value="${totalPoint }"
			  readonly	maxLength="14">
		</div>
			</div>

			<button type="reset" class="cancelbtn" onClick="history.go(-1)">←
				취소</button>
			<button type="submit" class="submitbtn">결제</button>
		</div>

	</form>
<script src="../resources/js/point_store/payment.js" charset="utf-8"></script> 
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>