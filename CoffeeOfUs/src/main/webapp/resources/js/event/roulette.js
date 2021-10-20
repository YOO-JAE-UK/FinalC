function rotation() {
	var id = $("#id").val();

	var status = '';
	var rpoint = 0;
	if (id == '') {
		alert("로그인을 하세요");
		location.href = "../member/login"
		return;
	}
	console.log("fn=" + 1);
	var result = isCheckStatus();
	console.log("result=" + result);
	if (result != null) {
		status = result.status;
		rpoint = result.point;
		if (status == 'Y') {
			alert("이미 응모 하였습니다.내일 다시 시도해주세요");
			return;
		} else {
			var seq = 0;
			var duration = 5000;
			var pieAngle = 360 * 4;
			var angle = 0;// 원래 이미지 위치를 기준으로 한다. transform: rotate(247deg) 적용전
							// 위치 기준
			var output = "";
			$.ajax({
				url : "getRandomNum",
				type : "post",
				dataType : "json",
				data : {
					"id" : id,
					"point" : rpoint
				},

				success : function(rdata) {
					var seq = rdata.rnum;
					var message = rdata.messagePoint;
					console.log("seq:" + seq);
					angel = pieAngle - ((seq * 45) - 22);
					console.log("angel=" + angel);
					$("#roulette_base").rotate(
							{
								duration : duration,
								animateTo : angel,
								callback : function() {
									if (seq == 7) {
										alert("너무 아쉽네요~ 내일엔 행운이 찾아올겁니다.");
									} else {
										alert("축하드립니다." + rdata.messagePoint
												+ "포인트 획득하셨습니다.");
									}
									$(".point").empty();
									output += "<div id='point' >현재 포인트</div>"
									output += "<div id='mypoint' >"
											+ rdata.point + "&nbsp;P</div>"
									$(".point").append(output);
								}
							});
				}

			})
		}
	} else {
		alert("먼저 출석체크를 해주세요");
	}

}
function isCheckStatus() {
	var id = $("#id").val();
	console.log("id=" + id);
	var m;
	console.log("id=" + id.toString());
	$.ajax({
		url : "isCheck",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"id" : id
		},
		success : function(d) {

			m = d.member;
		}

	})
	return m;
}