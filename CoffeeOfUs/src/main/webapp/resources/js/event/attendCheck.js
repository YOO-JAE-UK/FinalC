items=[]; 
id=$('#id').val(); 
function getCalendar(){
	
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
	        	 
	        	  if(id==''){
	        		  alert("로그인을 하세요");
	        		  location.href="../member/login"
	        	  }
	        	  $.ajax({
                	 type:"post",
                	 url: "../event/attendAdd",
                	 async: false,
                	 dataType: "json",
                	 data: {"id":id},
	        	  	 success:function(data){
	        	  		
	        	  		 if(data.result==1){
	        	  			console.log(1111);
	        	  			 alert("출석체크 완료하였습니다.")
	        	  			 location.href="../event/attendCheck"
	        	  		 }
	        	  		
	        	  	 }
                   
                   
                   
                   })
                	   
                  // ajax 통신으로 출석 정보 저장하기 
                    // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                    // 통신 성공시 버튼 바꾸고, property disabled 만들기 
	          }
	        }
	    },
	   
	    events:getAttendData(),
       // 달력 정보 가져오기 
	  
	  }); 
	
};
//console.log("sdfdsa:" + getAttendData());


function isCheck(){
	console.log("id:" + id);
	$.ajax({
		url:"../event/isCheck",
		type:"post",
		async:false,
		dataType: "json",
		data:{"id":id},
		success:function(res){
			if(res!=null){
				console.log("321321321:"+res);
				$(".fc-custom2-button").css('color','red');
  	  			 $(".fc-custom2-button").prop('disabled',true);
  	  			 $(".fc-custom2-button").text("출석완료");
			}
		}
		
	})
};

function attendCount(){
	var date = $("#calendar").fullCalendar('getDate');
	var yearMonth = moment(date).format("YYYY-MM");
	$.ajax({
		url:"../event/attendCount",
		type:"post",
		async:false,
		dataType: "json",
		data:{"id":id,"yearMonth":yearMonth},
		success:function(attendCount){
			var output="";
			if(res!=null){
				$(".checkinEvent__number__checkin").empty();
				output="<span data-v-8e5f91ac='' class='checkinEvent__number__checkin'>";
				output+= attendCount;
				output+="</span>번";
				
				$(".checkNumber").append(output);
				
				
			}
		}
		
	})
}

function getAttendData(){
//	  var date = $("#calendar").fullCalendar('getDate');
//	  var year = moment(date).format("YYYY");
//	  var month = moment(date).format("MM")
//	  console.log(month);
	
	var id=$('#id').val(); 
	$.ajax({
   	 
     type:"post",
   	 url: "../event/attendList",
     async:false,
   	 dataType: "json",
   	 data: {"id":id},
	  	 success:function(rdata){
	  		if(rdata!=null){
	  		   $.each(rdata,function(index,element){			
	  			 items.push({
	  			             
	  			             title: "출석",
	  			             start:element.attenddate,
	  			             end:  element.attenddate, //20
	  			             textColor: 'white'                 
	  			 	                          
	  			             });//push end
	  		    })            
	  		}//if end	
	  		console.log("ev="+items);
	  		
	  	 }
	       
	});
	
   return items;
}

getCalendar();
isCheck();