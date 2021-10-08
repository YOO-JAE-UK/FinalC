function go(page){
	var limit = $('#viewcount').val();
	var data = "limit=" + limit + "&state=ajax&page=" + page;
	ajax(data);
}
function setPaging(href, digit){
	var output = "<li class=page-item>";
	gray="";
	if(href==""){
		gray=" gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + ">" + digit + "</a></li>"; 
	output += anchor;
	return output;
}
function getList(page){

	//console.log(sdata)
	$.ajax({
		tpye : "GET",
		data : {
			 "page":page
		},
		url : "tour_board_list1",
		dataType : "json",
		//cashe : false,
		success : function(data) {
			//$("#viewcount").val(data.limit); //엄청긴글의 json을 받아온거에 limit값 고정할려고씀
			//$("table").find("font").text("글 개수 : " + data.listcount);
			
			
			
			if(data.listcount > 0) { //총 갯수가 0보다 큰경우
				
	
			output="";
			 var num =data.listcount;	//변수 선언
				
				
				output+='<div style="text-align: center;"><h2><b><font color="#ED4C6B">Tour_List</font></b></h2></div>';
				  output+=' <font size=3 style="margin-left: 15px; margin-bottom: 20px" id="count">글 개수 :'+num+'</font>'	;
				  output+='	 <div class="container mt-2">';
				  output+='	  <div class="row">';
				  
				 
				  		$(data.boardlist).each(///////////////////(total -index-1)
				  				function(index, item) {
				  					
				  					output+='<div class="col-md-3 col-sm-7">';
			  						output+='<div class="card card-block" style="margin-bottom: 30px;">';
			  							output+='<div>';

			  					output+=' <p class="card-title text-right" style="float:left; text-align: center;">NO.'+num+'</p>'; //<c:out value="${listcount-tour_num+1}"/>
			  					
				  				output+=' <p class="card-title text-left" style="float:right; text-align: center;">조회수 : '+this.tour_READCOUNT+'</p>'; //${b.TOUR_READCOUNT }
				  				output+='</div>';	
				  				output+='<div style="width: 100%; height: 150px;">';			  				
				  					if(this.tour_FILE ==null){
				  						output+='<img src="../resources/img/cafe_default.jpg" alt="cafe_image" title="cafe_image" class="shoe fade-in one" id="cafe_image" width="100%" height="100%"/>';
				  					}else{
				  						output+='<img src="get_img?name='+this.tour_FILE+'" alt="cafe_image" title="cafe_image" class="shoe fade-in one" id="cafe_image" width="100%" height="100%"/>';
				  					}
				  				
				  				output+='</div>';
				  				output+='<h5 class="card-title mt-3 mb-3" style="text-align: center;">';
				  				output+='	<a href="detail?num='+this.tour_NUM+'" style="color: black">'+this.tour_SUBJECT+' </a>';//${b.TOUR_NUM} 하고 <c:out value="${b.TOUR_SUBJECT}"  escapeXml="true"/> 
				  				output+='</h5>';
				  				output+='	<hr style="margin-top: 0px;">';
				  				output+='<p class="card-text over" style="height: 60px"> 카페이름 : '+this.tour_NAME+'</p>'	;																		
				  				output+=' <p class="card-text">날짜 : '+this.tour_DATE.substring(0,10) +'</p>';
				  				output+='<p class="card-text over">닉네임 : '+this.user_NICKNAME+'</p> ';
				  				output+='</div>';
				  				output+='</div> <!-- "col-md-3 col-sm-6" end -->';
				  				num--;
				  				});//	$(data.boardlist).each(
			}//if(data.listcount) end	
				  		
				  		if(data.listcount == 0){
				  			output+='<font size=5>등록된 글이 없습니다.</font>';
				  		}
				  		
				  		output+='</div>';// <!-- row end -->
				  		output+='</div>';//<!-- <div class="container mt-2"> -->
				  		output+='<button type="button" class="btn btn-info float-right">글 쓰 기</button>';
				  		output+='<div class="col-sm-2"></div>';
				  		output+='	</div>';
				  		output+='</div>';
				  		if(data.listcount>data.limit){
				  			output+='<div style="    background: linear-gradient(to bottom, #e2e2e2, transparent); height:30px;" id="more"></div>';
				  		}
				  		$("#ajax_content").append(output);//
				
				
			
				

		}, //success end
		error : function() {
			console.log('에러')
		}
	})//ajax end
}//function ajax end



$(document).on("click","#more",function(){
	$("#ajax_content").empty();
	getList(more_i)
		more_i++;
});


$(document).on("click","button",function(){

		location.href="tour_board_write";

})

$(document).ready(function(){
	more_i=2;
	getList(1);
	
})