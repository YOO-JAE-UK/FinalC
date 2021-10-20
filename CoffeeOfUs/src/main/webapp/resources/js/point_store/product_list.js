function getList(page, searchword) {
	output = ""

	$
			.ajax({
				url : "getList",
				dataType : "json",
				data : {
					page : page,
					searchword : searchword
				},

				success : function(rdata) {
					console.log("rdata=" + JSON.stringify(rdata));
					$("#product_list").empty();
					if (rdata.listcount > 0) {
						$(rdata.list)
								.each(
										function(index, item) {

											output += '<div class="col-md-6 col-lg-3 ">';
											output += '<div class="product">';
											output += '<a href="productDetail?code='
													+ item.code
													+ '&productname='
													+ item.productname
													+ '&description='
													+ item.description
													+ '&perpoint='
													+ item.perpoint
													+ '&img='
													+ item.img
													+ '&quantity='
													+ item.quantity
													+ '"  class="img-prod"><img class="img-fluid"'
													+ 'src="../upload'
													+ item.img
													+ '" alt="Colorlib Template">';
											output += '<div class="overlay"></div> </a>';
											output += ' <div class="text py-3 pb-4 px-3 text-center"> ';
											output += '<h3>';
											output += '<a href="productDetail?code='
													+ item.code
													+ '&productname='
													+ item.productname
													+ '&description='
													+ item.description
													+ '&perpoint='
													+ item.perpoint
													+ '&img='
													+ item.img
													+ '&quantity='
													+ item.quantity
													+ '">'
													+ item.productname.replace(
															/</g, "&lt;")
															.replace(/>/g,
																	"&gt;")
													+ '</a>';
											output += '</h3>';
											output += '<div class="d-flex">';
											output += '<div class="pricing">';
											output += '<p class="price">';
											output += '<span id="price">'
													+ item.perpoint
													+ 'P</span>';
											output += '</p></div></div>';
											output += '<div class="bottom-area d-flex px-3">';
											output += '<div class="m-auto d-flex">';
											//							
											output += '<a href="javascript:addCart('
													+ item.code + ',';
											output += +item.perpoint
													+ ')"'

													+ ' class="add-to-cart d-flex justify-content-center align-items-center text-center">'
											output += '<span><i class="ion-ios-cart"></i></span></a>'
											output += '<a href="buynow?quantity=1&code='
													+ item.code
													+ '&productname='
													+ item.productname
													+ '&perpoint='
													+ item.perpoint
													+ '"  class="buy-now d-flex justify-content-center align-items-center mx-1">'
											output += '<span><i class="icon-credit-card"></i></span></a>'
											output += '</div></div></div></div></div>'
										})
						$("#product_list").append(output);

						$("#ul_paging").empty();
						output = ""
						output = "";
						if (rdata.page <= 1) {
							output += ' <li><a class="active">&lt;</a></li>';
						} else {
							output += ' <li><a href="javascript:getList('
									+ (rdata.page - 1) + ',' + rdata.searchword
									+ ')" class="lin">&lt;</a></li>';
						}
						for (var i = rdata.startpage; i <= rdata.endpage; i++) {
							if (i == rdata.page) {
								output += '<li><a class="active">' + i
										+ '</a></li>';
							} else {
								output += '<li><a href="javascript:getList('
										+ i + ',' + rdata.searchword
										+ ')" class="lin">' + i + '</a></li>';
							}
						}

						if (rdata.page >= rdata.maxpage) {
							output += '<li><a class="active">&gt;</a></li>';
						} else {
							output += '<li><a href="javascript:getList('
									+ (rdata.page + 1) + ',' + rdata.searchword
									+ ')" class="lin">&gt;</a></li>';
						}

						$("#ul_paging").append(output);
						console.log(output);

						$("#mypoint").html(rdata.point);
						$("#cartcount").html(rdata.cartcount);

					} else {
						if (searchword == '') {
							output += '<div id="no_product"><font size=5>등록된 상품이 없습니다.</font></div>'
						}
						output += '<div id="no_product"><font size=5>검색한 상품이 존재하지 않습니다.</font></div>'
						$("#product_list").append(output);
						$("#ul_paging").empty();
					}
				}
			})

} // getList end

$(".row").on('click', '.add-to-cart', function(event) {
	var id = $("#id").val();
	if (id == '') {

		alert("로그인하고 장바구니에 추가해주세요");
		event.stopPropagation();
		event.preventDefault();
		location.href = "../member/login";
	}

})

$("#cartListView").click(function(e) {
	var id = $("#id").val();
	if (id == '') {
		alert("로그인을 하세요")
		e.preventDefault();
		location.href = "../member/login"
	}

})

$(".row").on('click', '.buy-now', function(e) {
	var id = $("#id").val();
	if (id == '') {
		alert("로그인하고 결제해주세요");
		event.stopPropagation();
		event.preventDefault();
		location.href = "../member/login";

	}
})

function addCart(ccode, cperpoint) {
	console.log("cperpoint=" + cperpoint)
	$.ajax({
		url : "addtoCart",
		type : "post",
		data : {
			cquantity : 1,
			ccode : ccode,
			cperpoint : cperpoint,
		},
		success : function(rdata) {

			getList(1);
		}

	})

}

$("#searchwordbtn").click(function() {
	var searchword = $("#searchword").val().trim();

	console.log("js searchword=" + searchword);
	getList(1, searchword);

})

getList(1, '')