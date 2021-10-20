$("form").submit(function() {
	var cquantity = $("#quantity").val();
	console.log("cquantity=" + cquantity);
	var id = $('#id').val();
	if (id == '') {
		alert("로그인을 하세요")
		return false;
	}

})

$("#plus").click(function(event) {
	console.log("plus=" + plus)
	var cquantity = Number($("#cquantity").val());
	var cremain = Number($("#cremain").val());
	var cperpoint = Number($("#perpoint").val());
	if (cquantity < cremain) {
		cquantity++;
		console.log("cquantity=" + cquantity);
		var ctotal = Number(cperpoint * cquantity);
		console.log("ctotal=" + ctotal);
		$("#PayAmount").val(ctotal);
		$("#cquantity").val(cquantity);
		console.log("111")
	} else {
		alert("수량을 초과하였습니다");
	}

})
$("#minus").click(function(event) {

	var cquantity = Number($("#cquantity").val());
	var cremain = Number($("#cremain").val());
	var cperpoint = Number($("#perpoint").val());
	if (cquantity > 1) {
		cquantity--;
		console.log("cquantity=" + cquantity);
		var ctotal = Number(cperpoint * cquantity);
		console.log("ctotal=" + ctotal);
		$("#PayAmount").val(ctotal);
		$("#cquantity").val(cquantity);

	} else {
		alert("최소수량이 1개 입니다")
	}

})

$("#buy").click(
		function() {
			var code = $("#ccode").val();
			var description = $("#cdescription").val();
			var productname = $("#cproductname").val();
			var perpoint = $("#perpoint").val();
			var quantity = $("#cquantity").val();

			location.href = "buynow?code=" + code + "&description="
					+ description + "&productname=" + productname
					+ "&perpoint=" + perpoint + "&quantity=" + quantity;

		})
