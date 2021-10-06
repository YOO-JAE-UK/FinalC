  
var events = [];
$('#calendar').fullCalendar(
		
		{
			slotEventOverlap: false,
			header : {
				right : 'custom2 prevYear,prev,next,nextYear'
			},

			views : {
				month : {
					titleFormat : 'YYYY년 MMMM월'
				},
			},
			monthNames : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
					"11", "12" ],
			monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8", "9",
					"10", "11", "12" ],
			dayNames : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			// 출석체크를 위한 버튼 생성
			customButtons : {
				custom2 : {
					text : '출석체크하기',
					id : 'check',
				}
			// click end
			},

			events : function(start, end, timezone, callback) {
				console.log(start)
				console.log(end)
				console.log(timezone)
				console.log(callback)
				
				// 달력 정보 가져오기
				var id = $('#id').val();
				$.ajax({

					type : "get",
					url : "../event/attendList",
					dataType : "json",
					data : {
						"id" : id
					},
					success : function(rdata) {
						
						if (rdata != null) {
							$.each(rdata, function(index, element) {
								events.push({

									title : "출석",
									start : element.attenddate,
							          // 20
									textColor : 'white'
									
								});// push end
							})// each end

							callback(events);
						}
					}

				});
			},
			
		});

$(".fc-custom2-button").on('click',function(){
	var id = $('#id').val();
	
	if (id == '') {
		alert("로그인을 하세요");
		location.href = "../member/login"
	}
	
			$.ajax({
				type : "post",
				url : "../event/attendAdd",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(data) {
					console.log(data.result);
					if (data.result == 1) {
						$(".fc-custom2-button").css(
								'color', 'red');
						$(".fc-custom2-button").prop(
								'disabled', true);
						$(".fc-custom2-button")
								.text("출석완료");
						
					   alert("출석체크 되었습니다.");
					   location.href="../event/attendCheck"
					}
				
					
				}
				
			})
			$('.fc-prev-button').on('click', function() {
	            $('#calendar').fullCalendar('prev'); // call method
	            alert('Previous Month');
	        });
	        $('.fc-next-button').on('click', function() {
	            $('#calendar').fullCalendar('next'); // call method
	            alert('Next Month');
	        });// ajax end
})
