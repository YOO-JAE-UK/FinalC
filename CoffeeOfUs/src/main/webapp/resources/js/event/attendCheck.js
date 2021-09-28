var getCalendar = function(){
	
	$('#calendar').fullCalendar({
	    header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    },
        // 출석체크를 위한 버튼 생성
	    customButtons: { 
	        custom2: {
	          text: '출석체크하기',
	          id: 'check',
	          click: function() {	
                    // ajax 통신으로 출석 정보 저장하기 
                    // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                    // 통신 성공시 버튼 바꾸고, property disabled 만들기 
	          }
	        }
	    },
	    events: getAttendData(), 
       // 달력 정보 가져오기 
	   
	  }); 
}

var getAttendData = function(){
	  var date = $("#calendar").fullCalendar('getDate');
	  //var month_int = date.getMonth();
	  try{

		  console.log(date.year(), date.month() + 1);
	  }catch(e){}
	  
	  //you now have the visible month as an integer from 0-11
	
	
	var events = [];
                  events.push({
	                              id: 1,
	                              title: '1234',
	                              start: '2021-09-01',
	                              end: '2021-09-21', //20
		                          
	 	                          textColor: 'white' 
	                          });
                 events.push({
	                              id: 2,
	                              title: '1234',
	                              start: '2021-09-25',
	                              end: '2021-09-26', //25
		                         
	 	                           textColor: 'white' 
	                          });
	
	//ajax - param starDate~endDAte
	return events;
	
}

getCalendar();
console.log("3");