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
function getList(page, search_type, search_text){
	$("#ajax_content").empty();
	//console.log(sdata)
	$.ajax({
		type : "GET",
		data : {
			 "page":page,
			 "search_type": search_type,
			 "search_text" : search_text
		},
		url : "tour_board_list1",
		dataType : "json",
		//cashe : false,
		success : function(data) {
		 num =data.listcount;	//변수 선언
		//alert(JSON.stringify(data))
			//$("table").find("font").text("글 개수 : " + data.listcount);
		 
				$("#ajax_content").empty();//
				//적용안됨$("#viewcount").val(data.search_type); //엄청긴글의 json을 받아온거에 limit값 고정할려고씀	
				//alert(data.search_type)
				count1= data.search_type;
			output="";
			 
				
				
				output+='<div style="text-align: center;"><h2><b><font color="#99654e">Tour_List</font></b></h2></div>';
				  output+=' <font size=3 style="margin-left: 15px; margin-bottom: 20px" id="count">글 개수 :'+num+'</font>'	;
				  //검색
				
			
				output+=' 		  <div class="wrap">'
					
						output+='<select id="viewcount" name="search_type" class="search_field">'
							if(count1==0){
								output+='<option value="0" selected>제목</option>'
							}else{
								output+='<option value="0" >제목</option>'
							}
				
							if(count1==1){
								output+='<option value="1" selected>카페이름</option>'
							}else{
								output+='<option value="1">카페이름</option>'
							}
						
							if(count1==2){
								output+='<option value="2" selected>내용</option>'
							}else{
								output+='<option value="2" >내용</option>'
							}
							
							if(count1==3){
								output+='<option value="3" selected>작성자</option>'
							}else{
								output+='<option value="3" >작성자</option>'
							}

						
						
						output+='</select>'	
				output+=' 	   <div class="search">'
				output+=' 	      <input id="search_input" type="text" class="searchTerm" placeholder="찾을 단어를 검색해 보세요!" value="'+data.search_text+'">'
				output+=' 	      <button type="submit" class="searchButton">'
				output+=' 	        <i class="fa fa-search"></i>'
				output+=' 	     </button>'
				output+=' 	   </div>'
				output+=' 		</div>'
					
					
					output+='<input type="hidden" id="viewcount_text" value='+data.search_type+'>'
					output+='<input type="hidden" id="search_input_text" value='+data.search_text+'>'
				  
				  
				  output+='	 <div class="container mt-2">';
				  output+='	  <div class="row">';
				  
if(data.listcount > 0) { //총 갯수가 0보다 큰경우 
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
				  			
				  			$("#ajax_content").empty();//
				  			output+='<font size=5>등록된 글이 없습니다.</font>';
				  		}
				  		
				  		output+='</div>';// <!-- row end -->
				  		output+='</div>';//<!-- <div class="container mt-2"> -->
				  		output+='<button style="font-size: 12pt;" type="button" class="btn btn-info float-right" id="write_btn">글 쓰 기</button>';
				  		output+='<div class="col-sm-2"></div>';
				  		output+='	</div>';
				  		output+='</div>';
				  		if(data.listcount>data.limit){
				  			output+='<div id="more"></div>';
				  		}
				  		$("#ajax_content").append(output);//
				
				
			
				

		}, //success end
		error : function() {
			console.log('에러')
		}
	})//ajax end
}//function ajax end



$(document).on("click","#more",function(){
	viewcount =$("#viewcount_text").val();
	input = $("#search_input_text").val();
	$("#ajax_content").empty();	
	getList(more_i,viewcount,input);
		more_i++;

});


$(document).on("click","#write_btn",function(){

		location.href="tour_board_write";
})

$(document).on("click",".searchButton",function(){
	viewcount =$("#viewcount option:selected").val();
	input = $("#search_input").val();
	
	getList(1,viewcount,input);
})

$(document).on("change","#viewcount",function(){
		selectedValue = $(this).val();
		$("#search_input").val('');
		message=["찾을 제목을","찾을 카페이름을","찾을 내용을","찾을 작성자를"]
		$("#search_input").attr("placeholder",message[selectedValue]+" 입력하세요");
	}); //$("#viewcount").change end


$(document).ready(function(){
	more_i=2;
	search_type=$("#search_type").val();
	search_text=$("#search_text").val();
	getList(1,search_type,search_text);
	

	
})