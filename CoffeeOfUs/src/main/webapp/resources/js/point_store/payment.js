$("#juso").on('change', 'input[type=radio]', function() {
	console.log("라디오 체그 값=" + $(this).val())
	var selectAdd = $(this).val();
	var post = $(this).next().val();
	var place = $(this).next().next().next().next().text()
	var name = $(this).next().next().val()
	var tel = $(this).next().next().next().val()
	console.log
	$("#post1").val(post)
	$("#address").val(selectAdd)
	$("#recieveaddress").val(place);
	$("#recievename").val(name);
	$("#recievetel").val(tel);

})

$("#addAddress").click(function() {
	var rname = $("#recievename").val();
	var rtel = $("#recievetel").val();
	var rplace = $("#recieveaddress").val();
	var rpost = $("#post1").val();
	var raddress = $("#address").val();

	if (raddress == '') {
		alert("주소를 입력하세요")
	} else if (rname == '') {
		alert("받는분 성함을 입력하세요")
	} else if (rtel == '') {
		alert("받는분 연락처를 입력하세요")
	} else if (rplace == '') {
		alert("받는곳을 입력해주세요")
	} else {

		$.ajax({
			url : "addAddress",
			type : "post",
			data : {
				rname : rname,
				rtel : rtel,
				rplace : rplace,
				rpost : rpost,
				raddress : raddress
			},
			success : function(rdata) {
				if (rdata.result == 1) {
					alert("기본배송지로 설정되었습니다.");
					getAddressList();

				} else {
					alert("이미 설정되어 있습니다.")

				}
			}

		})
	}

})

function getAddressList() {
	output = '';
	$
			.ajax({
				url : "getAddressList",
				dataType : "json",
				type : "post",
				success : function(data) {

					if (data.addresslist.length > 0) {
						$("#juso").empty();
						$(data.addresslist)
								.each(
										function(index, item) {
											console.log("afdsafd="
													+ item.rcheck);
											if (item.rcheck == 1) {

												output += '<div class="form-check form-check-inline">'
														+ '<input class="form-check-input" type="radio"'
														+ 'name="vaddress" id="inlineRadio1" value="'
														+ item.raddress
														+ '" checked >'
														+ '<input type="hidden" value="'
														+ item.rpost
														+ '">'
														+ '<input type="hidden"  value="'
														+ item.rname
														+ '">'
														+ '<input type="hidden"  value="'
														+ item.rtel
														+ '">'
														+ '<label class="form-check-label" for="inlineRadio1">'
														+ item.rplace
														+ '</label></div>'
											} else {
												output += '<div class="form-check form-check-inline">'
														+ '<input class="form-check-input" type="radio"'
														+ 'name="vaddress" id="inlineRadio1" value="'
														+ item.raddress
														+ '">'
														+ '<input type="hidden"  value="'
														+ item.rpost
														+ '">'
														+ '<input type="hidden"  value="'
														+ item.rname
														+ '">'
														+ '<input type="hidden" value="'
														+ item.rtel
														+ '">'
														+ '<label class="form-check-label" for="inlineRadio1">'
														+ item.rplace
														+ '</label></div>'
											}

										})
						$("#juso").append(output);

					}

				}

			})

}

$("#joinform").submit(function() {
	var totalpoint = Number($("#totalpoint").val());
	var mypoint = Number($("#point").val());
	console.log("mypoint======" + mypoint)
	console.log("totalpoint=====" + totalpoint)
	var result = confirm("결제를 진행하시겠습니까?");
	if (result == true) {
		if (totalpoint > mypoint) {
			alert("보유하신 포인트가 부족합니다.(현재 보유 포인트:" + mypoint + ")");
			return false;
		}
	}
})
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('post1').value = data.zonecode;
			document.getElementById("address").value = fullRoadAddr;

		}
	}).open();
}
