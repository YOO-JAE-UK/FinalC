items = [];
id = $('#id').val();
check=0;
function getCalendar() {

	$('#calendar').fullCalendar(
			{
				height : 660,
				aspectRatio : 2,

				header : {
					right : 'custom2 prevYear,prev,next,nextYear'
				},

				views : {
					month : {
						titleFormat : 'YYYY년 MMMM월'
					},
				},
				monthNames : [ "1", "2", "3", "4", "5", "6", "7", "8", "9",
						"10", "11", "12" ],
				monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8",
						"9", "10", "11", "12" ],
				dayNames : [ "일", "월", "화", "수", "목", "금", "토" ],
				dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				// 출석체크를 위한 버튼 생성
				customButtons : {
					custom2 : {
						text : '출석체크하기',
						id : 'check',
						click : function() {

							if (id == '') {
								alert("로그인을 하세요");
								location.href = "../member/login"
								return;
							}
							$.ajax({
								type : "post",
								url : "../event/attendAdd",
								async : false,
								dataType : "json",
								data : {
									"id" : id
								},
								success : function(data) {

									if (data.result == 1) {
										console.log(1111);
										alert("출석체크 완료하였습니다.")
										getCalendar();
										isCheck();
										attendCount();
										
									}

								}

							})

						}
					}
				},

				events : getAttendData(),
				// 달력 정보 가져오기
				eventRender : function(event, eventElement) {
					if (event.imageurl) {
						eventElement.prepend("<img src='" + event.imageurl
								+ "' width='85' height='50'>");
						
					}
				}
			});

};

function isCheck() {
	console.log("id:" + id);
	$.ajax({
		url : "../event/isCheck",
		type : "post",
		async : false,
		dataType : "json",
		data : {
			"id" : id
		},
		success : function(res) {
			if (res.member != null) {
				$(".fc-custom2-button").css('color', 'red');
				$(".fc-custom2-button").prop('disabled', true);
				$(".fc-custom2-button").text("출석완료");
			} else {
				$(".fc-custom2-button").css('color', 'black');
				$(".fc-custom2-button").prop('disabled', false);
				$(".fc-custom2-button").text("출석체크하기");
			}
		}

	})
};

function attendCount() {
	var date = $("#calendar").fullCalendar('getDate');
	var year = moment(date).format("YYYY");
	var month = moment(date).format("MM");
	
			$.ajax({
				url : "../event/attendCount",
				type : "post",
				async : false,
				dataType : "json",
				data : {
					"id" : id,
					"year" : year,
					"month" : month
				},
				success : function(ndata) {
					var output = "";
					if (ndata != null) {
						console.log("ndata.count:" + ndata.count);
						$(".checkinEvent__number__checkin").empty();
						output = "<span data-v-8e5f91ac='' class='checkinEvent__number__checkin'>";
						output += ndata.count;
						output += "</span>번";

						$(".checkNumber").append(output);

					}
				}

			})
}


$('body').on('click','.fc-prev-button',function(){
	check++;
	var date = $("#calendar").fullCalendar('getDate');
	var year = moment(date).format("YYYY");
	var month = moment(date).format("MM")
	month = month - check;
	console.log(month);
	
})
$('body').on('click','.fc-next-button',function(){
	check--;
	var date = $("#calendar").fullCalendar('getDate');
	var year = moment(date).format("YYYY");
	var month = moment(date).format("MM")
	month = month - check;
	console.log(month);
	
})


function getAttendData() {
	// var date = $("#calendar").fullCalendar('getDate');
	// var year = moment(date).format("YYYY");
	// var month = moment(date).format("MM")
	// console.log(month);

	var id = $('#id').val();
	$.ajax({

		type : "post",
		url : "../event/attendList",
		async : false,
		dataType : "json",
		data : {
			"id" : id
		},
		success : function(rdata) {
			if (rdata != null) {
				$.each(rdata, function(index, element) {
					items.push({

						start : element.attenddate,
						end : element.attenddate, // 20
						textColor : 'white',
						imageurl : '../resources/img/check.png',
						color : '#FFFFFF'
					});// push end
				})
			}// if end
			console.log("ev=" + items);

		}

	});

	return items;
}

getCalendar();
isCheck();
attendCount();