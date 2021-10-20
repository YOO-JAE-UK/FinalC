id = $('#id').val();
date = $("#calendar").fullCalendar('getDate');
year = moment(date).format("YYYY");
month = moment(date).format("MM")

function getCalendar() {

	$('#calendar').fullCalendar(
			{
				height : 680,
				aspectRatio : 2,
				handleWindowResize : true,
				header : {
					right : 'custom2 prevYear,prev,next,nextYear',
					center : 'custom3'
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
						text : '출석체크',
						id : 'check',
						click : function() {

							if (id == '') {
								alert("로그인을 하세요");
								location.href = "../member/login"
								return;
							}
							$.ajax({
								type : "post",
								url : "attendAdd",
								async : false,
								dataType : "json",
								data : {
									"id" : id
								},
								success : function(data) {

									if (data.result == 1) {
										alert("출석체크 완료하였습니다.")

										$("#calendar").fullCalendar('destroy');// 두번째
																				// 부터는
																				// empty
																				// 하면
																				// 생성이
																				// 않되니깐
																				// 아예
																				// 초기화하고
																				// 다시 생
										getCalendar();
										$("#calendar>div:nth-child(n+3)")
												.remove();
										isCheck();
										attendCount();

									}

								}

							})

						}
					},
					custom3 : {
						text : 'Today',
						id : 'today',

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
		url : "isCheck",
		type : "post",
		async : false,
		dataType : "json",
		data : {
			"id" : id
		},
		success : function(res) {
			console.log("member:" + res.member);
			if (res.member != null) {
				$(".fc-custom2-button").css('color', 'red');
				$(".fc-custom2-button").prop('disabled', true);
				$(".fc-custom2-button").text("출석완료");
			} else {
				$(".fc-custom2-button").css('color', 'black');
				$(".fc-custom2-button").prop('disabled', false);
				$(".fc-custom2-button").text("출석체크");
			}
		}

	})
};

function attendCount() {
	$
			.ajax({
				url : "attendCount",
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
						$(".checkNumber").empty();
						output = "<span data-v-8e5f91ac='' class='checkinEvent__number__checkin'>";
						output += ndata.count;
						output += "</span>번";

						$(".checkNumber").append(output);

					}
				}

			})
}

$('body').on('click', '.fc-prev-button', function() {

	if (month == 1) {
		month = 12;
		year--;
	} else {
		month--;
	}
	console.log("prevYear:" + year);
	console.log("prevMonth:" + month)
	attendCount();

});
$('body').on('click', '.fc-next-button', function() {
	if (month == 12) {
		month = 1;
		year++;
	} else {
		month++;
	}
	console.log("nextYear:" + year);
	console.log("nextMonth:" + month)
	attendCount();
});

$('body').on('click', '.fc-nextYear-button', function() {

	year++;
	console.log("nextYearbutton:" + year);
	console.log("nextMonthbutton:" + month)
	attendCount();
});
$('body').on('click', '.fc-prevYear-button', function() {
	year--;
	console.log("prevYearbutton:" + year);
	console.log("prevMonthbutton:" + month)
	attendCount();
});
$('body').on('click', '.fc-custom3-button', function() {
	getCalendar(); // 두번째까지 생성될수 있다 그다음부터는 생성되지 않는다 즉 (두개까지만 만들수 있다고 생각하면
					// 된다)작동하지 않는다.때문에 위에empty를 쓰면 두번째는 없어진다.
	$("#calendar>div:nth-child(n+3)").remove();
	$("#calendar").fullCalendar('today');
	date = $("#calendar").fullCalendar('getDate'); // 두번째 캘린더 생성후부터 현재페이지의 날짜를
													// 가져올수 있다. 첫번째는 그달의 날짜로
													// 지정되고 두번째부터 현재페이지 날짜로
													// 설정된다.
	year = moment(date).format("YYYY");
	month = moment(date).format("MM");
	// $("#calendar>div:nth-child(n+3)").remove();
	// console.log("todayYear:" + year);
	// console.log("todayMonth:" + month);
	// getCalendar();
	// console.log("getCalendar 후:");
	// $("#calendar>div:nth-child(n+3)").remove();
	// $("#calendar").fullCalendar('today');
	// date = $("#calendar").fullCalendar('getDate');
	// year = moment(date).format("YYYY");
	// month = moment(date).format("MM");
	isCheck();
	attendCount();
});

function getAttendData() {
	// var date = $("#calendar").fullCalendar('getDate');
	// var year = moment(date).format("YYYY");
	// var month = moment(date).format("MM")
	// console.log(month);
	var items = [];
	var id = $('#id').val();
	$.ajax({

		type : "post",
		url : "attendList",
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