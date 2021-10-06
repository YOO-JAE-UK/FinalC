var getCalendar = function(){
	
	$('#calendar').fullCalendar({
	   
		header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    },
	   
        views: {
            month: {titleFormat: 'YYYY년 MMMM월'},
        },
        monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
        monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
        dayNames: ["일", "월", "화", "수", "목", "금", "토"],
        dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	    // 출석체크를 위한 버튼 생성
	    customButtons: { 
	        custom2: {
	          text: '출석체크하기',
	          id: 'check',
	          click: function() {	
	        	 var id=$('#id').val();
	        	  if(id==''){
	        		  alert("로그인을 하세요");
	        		  location.href="../member/login"
	        	  }
	        	  $.ajax({
                	 type:"post",
                	 url: "../event/attendAdd",
                	 dataType: "json",
                	 data: {"id":id},
	        	  	 success:function(data){
	        	  		 console.log(data.result);
	        	  		 if(data.result==1){
	        	  			$(".fc-custom2-button").css('color','red');
	        	  			 $(".fc-custom2-button").prop('disabled',true);
	        	  			 $(".fc-custom2-button").text("출석완료");
	        	  			
	        	  		 }
	        	  	 }
                   
                   
                   
                   })
                	   
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
//	  var date = $("#calendar").fullCalendar('getDate');
//	  var year = moment(date).format("YYYY");
//	  var month = moment(date).format("MM")
//	  console.log(month);
	var events=[]; 
	var id=$('#id').val(); 
	$.ajax({
   	 
     type:"get",
   	 url: "../event/attendList",
   	 dataType: "json",
   	 data: {"id":id},
	  	 success:function(rdata){
	  		console.log(JSON.stringify(rdata)) 			
	  			 events.push({
	  			             
	  			             title: "출석",
	  			             start:"2021-09-21",
	  			             end:  "2021-09-21", //20
	  			             textColor: 'white'                 
	  			 	                          
	  			             });//push end
	  		               
	  		 //each end	
	  	
	  	 }
	      
	});
    console.log(events)           
	//ajax - param starDate~endDAte
  return events;

}

getCalendar();
